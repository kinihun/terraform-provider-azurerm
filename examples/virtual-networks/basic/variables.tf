variable "prefix" {
  description = "The prefix used for all resources in this project"
  default = "vtltd"
}

variable "location" {
  description = "The Azure location where all resources in this project should be created"
  default = "West Europe"
}

variable "account_name" {
  description = "The Azure Storage Account name for Terraform state backend"
  default = "vtltdsa"
}

variable "resource_group" {
  description = "The Azure resource group where all resources in this project should be created"
  default = "vtltd-rg"
}
