terraform {
  required_version = "~> 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33.0"
    }
  }
  backend "s3" {
  }
}



provider "aws" {
  region                = var.region
  allowed_account_ids   = [var.aws_account_id]
}



module "lightsailinstanceone" {
  source                = "../../modules/lightsail_instance"
  instance_name         = "my-first-instance"
  bundle_id             = "micro_3_0"
  blueprint_id          = "ubuntu_22_04"
  availability_zone     = "us-east-1a"
  associate_elastic_ip  = true
  env                   = "dev"
  instance_tags = {
    Name        = "my-first-instance"
    Environment = "dev"
  }


port_info = [
    {
      port     = 80
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]

    },
    {
      port     = 22
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]

    },
       {
      port     = 8000
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]

    }
  ]




}

module "lightsailinstancetwo" {
  source                = "../../modules/lightsail_instance"
  instance_name         = "my-second-instance"
  bundle_id             = "micro_3_0"
  blueprint_id          = "ubuntu_22_04"
  availability_zone     = "us-east-1a"
  associate_elastic_ip  = false
  env                   = "prod"
  instance_tags = {
    Name        = "my-first-instance"
    Environment = "prod"
  }  

port_info = [
    {
      port     = 80
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]

    },
    {
      port     = 22
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]

    },
       {
      port     = 8000
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]

    }
  ]

}

