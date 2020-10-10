/**
  *  Its better to  use separate aws_security_group_rule resources.
  *
  *  NOTE:
  *  1. You cannot use a Security Group with in-line rules in conjunction with
  *  any Security Group Rule resources. Doing so will cause a conflict of rule
  *  settings and will overwrite rules.
  *
  +  2. Don't use description on ingress and egress as bugs when updating them
  */

/**
  * Security group for test utility instances
  */
resource "aws_security_group" "app_instances" {
    name = "${var.name_prefix}-app-instances"
    vpc_id = "${data.terraform_remote_state.core.outputs.vpc_id}"
    description = "Security group for instances"

    tags = {
        Name = "${var.name_prefix}-app_instances"
    }
}

/* Allow all outgoing connections */
resource "aws_security_group_rule" "allow_all_egress" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.app_instances.id}"
}

/**
  * In production, it's recommended to remove SSH access to the instance
  * (set var allow_ssh to false)
  */
resource "aws_security_group_rule" "allow_ssh" {
    count = "${var.allow_ssh ? 1 : 0}"
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.app_instances.id}"
}

/**
  * Security group for web utility instances
  */
resource "aws_security_group" "web_instances" {
    name = "${var.name_prefix}-web-instances"
    vpc_id = "${data.terraform_remote_state.core.outputs.vpc_id}"
    description = "Security group for web instances"

    tags = {
        Name = "${var.name_prefix}-web_instances"
    }
}

/* Allow all outgoing connections */
resource "aws_security_group_rule" "web_allow_all_egress" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.web_instances.id}"
}

resource "aws_security_group_rule" "web_allow_web" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.web_instances.id}"
}

resource "aws_security_group_rule" "web_test_allow_ssh" {
    count = "${var.allow_ssh ? 1 : 0}"
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.web_instances.id}"
}


