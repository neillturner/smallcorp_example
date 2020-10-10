provider "aws" {
    version = "~> 2.0"
    region = "eu-west-1"
    profile = "smallcorp_test"
}

terraform {
 backend "remote" {
   organization = "smallcorp"
   workspaces {
     name = "dev-core"
   }
 }
}
