provider "aws" {
    version = "~> 2.0"
    region = "eu-west-1"
    profile = "smallcorp_test"
}

terraform {
 backend "remote" {
   organization = "smallcorpLtd"
   workspaces {
     name = "dev-app"
   }
 }
}

data "terraform_remote_state" "core" {
 backend = "remote"
 config = {
   organization = "smallcorpLtd"
   workspaces = { name = "dev-core" }
 }
}

data "terraform_remote_state" "common" {
 backend = "remote"
 config = {
   organization = "smallcorpLtd"
   workspaces = { name = "dev-common" }
 }
}
