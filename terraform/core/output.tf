output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}

output "vpc_cidr_block" {
    value = "${module.vpc.vpc_cidr_block}"
}

output "private_subnets" {
    value = "${join(",", module.vpc.private_subnets)}"
}

output "public_subnets" {
    value = "${join(",", module.vpc.public_subnets)}"
}

output "private_subnets_list" {
    value = "${module.vpc.private_subnets}"
}

output "public_subnets_list" {
    value = "${module.vpc.public_subnets}"
}

output "azs_list" {
    value = "${module.vpc.azs}"
}

