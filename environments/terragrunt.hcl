

terraform {
  extra_arguments "retry_lock" {
    commands  = ["get_terraform_commands_that_need_locking()"]
    arguments = [
      "-lock-timeout=60m"
    ]
  }
}

inputs = {
    aws_account_id = "397366898130"
    region = "us-east-1"
    # s3_prefix_list_ids = []
    # vpc_id = ""
    # private_subnet_ids = []
}