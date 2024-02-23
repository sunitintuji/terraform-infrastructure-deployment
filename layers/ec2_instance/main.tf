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




module "ec2_instances_test1" {
  source = "../../modules/ec2_instance"

  name = "test1"
  instance_count        = "1"
  instance_type         = "t2.micro"
  associate_elastic_ip  = "true"
  key_name = "sujan"
  env = "dev"
  availability_zone = "us-east-1a"
  ami_id = "ami-0c7217cdde317cfec"

}

module "ec2_instances_test2" {
  source = "../../modules/ec2_instance"

  name = "test2"
  instance_count        = "1"
  instance_type         = "t2.micro"
  associate_elastic_ip  = "true"
  key_name = "sujan"
  env = "dev"
  availability_zone = "us-east-1a"
  ami_id = "ami-0c7217cdde317cfec"

}