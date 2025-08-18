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
    bucket_name          = "mongodb-atlas-tf-${run.generate_random_name.name_project}"
    use_existing_bucket  = false
    iam_role_name        = "mongodb-atlas-test-acc-tf-${run.create_project.project_id}"
    iam_role_policy_name = "mongodb-atlas-test-acc-tf-${run.create_project.project_id}"
    force_destroy        = true
  }

  assert {
    condition     = module.log_export.aws_configuration[0].atlas_aws_account_arn != null
    error_message = "AWS configuration should be present"
  }

  assert {
    condition     = data.aws_s3_bucket.s3_bucket_data.arn == "arn:aws:s3:::${var.bucket_name}"
    error_message = "Invalid arn"
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
