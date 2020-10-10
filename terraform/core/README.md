# terraform dev core

This is the core layer of the dev infrastructure


## vpc.tf

This is the vpc and related network infrastructure for the smallcorp Ltd dot net non prod sub-account

This uses the standard vpc module from the hashicorp terraform registry

https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws

* This subnets are set up similar to the current Production smallcorp account but with 172.10.0.0/16 ip ranges.




## OUTSTANDING ISSUES

add additional core resources like vpn etc.