
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.2.0"

  name = "smallcorp-Test"
  cidr = "172.10.0.0/16"

  azs             = ["eu-west-1b", "eu-west-1c"]
  public_subnets = ["172.10.11.0/24","172.10.10.0/24"]
  private_subnets  = ["172.10.31.0/24","172.10.30.0/24"]

  public_subnet_tags = {Name = "smallcorp-Test-Public"}
  private_subnet_tags = {Name = "smallcorp-Test-Private"}


  enable_dns_support = true
  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway = false
  enable_s3_endpoint = true
  enable_dhcp_options = true

  tags = {
    Name = "smallcorp-Test"
  }
}
