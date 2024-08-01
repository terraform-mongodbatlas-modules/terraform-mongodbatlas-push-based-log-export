provider "mongodbatlas" {
}

provider "aws" {
  region = "us-east-2"
}

run "generate_random_name" {
  module {
    source = "./tests/random_name_generator"
  }
}

run "create_project" {
  module {
    source = "./tests/project_generator"
  }

  variables {
    project_name = "test-modules-tf-p-${run.generate_random_name.name_project}"
  }
}

run "create_bucket_with_provided_name" {
  command = apply

  module {
    source = "./"
  }

  variables {
    project_id           = run.create_project.project_id
    bucket_name          = "test-modules-tf-bucket-${run.generate_random_name.name_project}"
    create_bucket        = true
    iam_role_name        = "test-modules-tf-role-${run.create_project.project_id}"
    iam_role_policy_name = "test-modules-tf-policy-${run.create_project.project_id}"
    force_destroy        = true
  }

  assert {
    condition     = mongodbatlas_cloud_provider_access_setup.setup.provider_name == "AWS"
    error_message = "Invalid provider name"
  }

  assert {
    condition     = aws_iam_role.iam_role.name == "test-modules-tf-role-${run.create_project.project_id}"
    error_message = "Invalid role name"
  }

  assert {
    condition     = aws_iam_role_policy.policy.name == "test-modules-tf-policy-${run.create_project.project_id}"
    error_message = "Invalid policy name"
  }
}
