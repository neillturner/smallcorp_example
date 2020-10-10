resource "aws_instance" "webnode" {
  instance_type               = "${var.instance_type}"
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${data.terraform_remote_state.common.outputs.sg_web_instances_id}"]
  subnet_id                   = "${element(data.terraform_remote_state.core.outputs.private_subnets_list, 0)}"
  iam_instance_profile        = "${var.instance_profile}"
  private_ip                  = "${var.private_ip}"
  user_data                   = "${file("config_nginx.sh")}"
  lifecycle {
    ignore_changes = ["user_data"]
  }
  associate_public_ip_address = "true"
  tags = {
      Name = "${var.server_name}"
  }
}


