terraform {  
  required_providers {   
    aws = {      
      source  = "hashicorp/aws"      
      version = "~> 3.27"    
    }  
  }
  required_version = ">= 0.14.9"
}

provider "aws" {  
  profile = "default"  
  # region  = lookup(var.vpc_info, "region")
  region = var.region

#   assume_role {
#     role_arn = "arn:aws:iam:accountID:role/network"
#   }

  max_retries = 1

  default_tags {
      tags = {
        Environment = "HomeLab"
        Division    = "Sandbox"
        Source      = "Terraform-Sandbox"
        Consumer    = "Dragos"
        Application = "CrazyClownSandbox"
      }
  }
}

#######################
# VPC CREATION SECTION
#######################

resource "aws_vpc" "myVPC" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    "Name" = "deec1-terraform-vpc"
  }
}