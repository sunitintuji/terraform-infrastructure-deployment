
# terragrunt.hcl
include {
  path = "${find_in_parent_folders()}"
}
remote_state {
  backend = "s3"
  config = {
    bucket         = "intuji-terragrunt-state-file"
    key            = "modules/ec2/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "intuji-terraform-locks-table"
  }
}


terraform {
  source = "../..//layers/ec2_instance"
  extra_arguments "retry_lock" {
    commands = ["get_terraform_commands_that_need_locking()"]
    arguments = [
      "-lock-timeout=60m",
    ]
  }
  extra_arguments "additional_vars" {
    commands = ["get_terraform_commands_that_need_vars()"]
    optional_var_files = [
      "${get_parent_terragrunt_dir()}/../terragrunt.hcl"
    ]
  }
}

