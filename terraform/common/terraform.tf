provider "aws" {
    version = "~> 2.0"
    region = "eu-west-1"
    profile = "smallcorp_test"
}

provider "template" {
  version = "~> 2.1"
}

terraform {
 backend "remote" {
   organization = "smallcorpLtd"
   workspaces {
     name = "dev-common"
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
