#
# Security groups
#
output "sg_app_instances_id" {
    value = "${aws_security_group.app_instances.id}"
}



output "sg_web_instances_id" {
    value = "${aws_security_group.web_instances.id}"
}
