resource "aws_codebuild_project" "terraform_auto_apply_example" {
  name         = "terraform-auto-apply-example"
  service_role = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/service-role/codebuild-terraform-auto-apply-example-service-role"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "${data.aws_caller_identity.current.account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/terraform:0.0.1"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/momohana/terraform-auto-apply-example.git"
    git_clone_depth = 1
    git_submodules_config {
      fetch_submodules = false
    }
  }
}

resource "aws_codebuild_webhook" "terraform_auto_apply_example" {
  project_name = aws_codebuild_project.terraform_auto_apply_example.name

  filter_group {
    filter {
      pattern                 = "PULL_REQUEST_CREATED"
      type                    = "EVENT"
    }
  }

  filter_group {
    filter {
      pattern                 = "PULL_REQUEST_UPDATED"
      type                    = "EVENT"
    }
  }

  filter_group {
    filter {
      pattern                 = "PULL_REQUEST_REOPENED"
      type                    = "EVENT"
    }
  }

  filter_group {
    filter {
      exclude_matched_pattern = false
      pattern                 = "PUSH"
      type                    = "EVENT"
    }
    filter {
      exclude_matched_pattern = false
      pattern                 = "master"
      type                    = "HEAD_REF"
    }
  }
}
