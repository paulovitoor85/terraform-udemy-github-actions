terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      version = "3.0.0"
      source  = "hashicorp/azurerm"
    }

    aws = {
      version = " 3.73.0"
      source  = "hashicorp/aws"
    }
  }

  backend "azurerm" {
    resource_group_name  = "remote-state"
    storage_account_name = "paulovitoremotestate"
    container_name       = "remote-state"
    key                  = "azure-vm-github-actions/terraform.tfstate"
  }

}

provider "azurerm" {
  features {}

}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "remote-state"
    storage_account_name = "paulovitoremotestate"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }


}

provider "aws" {
  
  default_tags {
    tags = {
      owner      = "paulovitor"
      managed-by = "terraform"
    }
  }

}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "paulovitor-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}