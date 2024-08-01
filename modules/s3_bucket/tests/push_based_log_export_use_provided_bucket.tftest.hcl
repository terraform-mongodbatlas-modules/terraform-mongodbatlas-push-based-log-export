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

run "create_bucket" {
  module {
    source = "./tests/bucket_generator"
  }

  variables {
    bucket_name = "mongodb-atlas-tf-${run.generate_random_name.name_project}"
  }
}

run "use_provided_bucket" {
  command = apply

  module {
    source = "./"
  }

  variables {
    project_id           = run.create_project.project_id
    bucket_name          = run.create_bucket.name_bucket
    create_bucket        = false
    iam_role_name        = "mongodb-atlas-test-acc-tf-${run.create_project.project_id}"
    iam_role_policy_name = "mongodb-atlas-test-acc-tf-${run.create_project.project_id}"
  }

  assert {
    condition     = mongodbatlas_cloud_provider_access_setup.setup.provider_name == "AWS"
    error_message = "Invalid provider name"
  }

  assert {
    condition     = aws_iam_role.iam_role.name == "mongodb-atlas-test-acc-tf-${run.create_project.project_id}"
    error_message = "Invalid role name"
  }

  assert {
    condition     = aws_iam_role_policy.policy.name == "mongodb-atlas-test-acc-tf-${run.create_project.project_id}"
    error_message = "Invalid policy name"
  }
}
