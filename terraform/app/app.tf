resource "aws_instance" "appnode" {
  instance_type               = "${var.app_instance_type}"
  count         =             = "${var.app_instance_count}"
  ami                         = "${var.app_ami}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${data.terraform_remote_state.common.outputs.sg_app_instances_id}"]
  subnet_id                   = "${element(data.terraform_remote_state.core.outputs.private_subnets_list, 0)}"
  iam_instance_profile        = "${var.instance_profile}"
  private_ip                  = "${element(var.app_private_ips, count.index)}"
  tags = {
      Name = "${var.app_server_name}"
  }
}

