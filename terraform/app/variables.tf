variable "key_name" {
  default = "smallcorp_test"
  description = "The key name of the Key Pair to use for the instance"
}

variable "instance_profile" {
  default = "ec2-xxxxxx"
  description = "instance profile with correct privileges for server"
}

variable "aws_region" {
  default = "eu-west-1"
  description = "aws region."
}

# web node
variable "server_name" {
  default = "webnode"
}

variable "private_ip" {
  default = "172.10.31.141"
}

variable "ami" {
  default  =  "ami-xxxxxxxxxxxxxxx" # webnode-20200503
}

variable "instance_type" {
  default  = "t2.small"
}


# app_node
variable "app_server_name" {
  default = "appnode"
}

variable "app_private_ips" {
  default = ["172.10.31.115","172.10.31.125","172.10.31.145"]
}

variable "app_ami" {
  default  =  "ami-0xxxxxxxxxxxxxxx" # appnode-20200313
}

variable "app_instance_type" {
  default  = "t2.xlarge"
}

variable "app_instance_count" {
  default  = 3
}




