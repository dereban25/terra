provider "aws" {
  region = "us-west-1" //N.California
}
terraform {
  backend "s3" {
	bucket = "terradereban"
	key    = "github/terraform.tfstate"
	region = "us-west-1"
  }
}

resource "aws_security_group" "main_security_group" {
  name        = var.security_group_name
  description = "Ctetated by DE with terraform ${var.security_group_name}"
  vpc_id      = "vpc-0125681c8ea57944b"
  tags = {
  Name = "coord" }
}
resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.main_security_group.id}"
}

resource "aws_security_group_rule" "allow_allin" {
  type              = "ingress"
  from_port         = -2
  to_port           = -2
  protocol          = "-1"
  cidr_blocks       = ["160.83.87.86/31"]
  description       = "Deutsche"
  security_group_id = "${aws_security_group.main_security_group.id}"
}
resource "aws_security_group_rule" "allow_allcoor" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["45.76.186.132/32"]
  description       = "DR in Singapore"
  security_group_id = "${aws_security_group.main_security_group.id}"
}


resource "aws_security_group_rule" "rule_rdp" {
  count             = "${length(var.rulescoord)}"
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = "${var.rulescoord[count.index].range}"
  description       = "${var.rulescoord[count.index].descr}"
  security_group_id = "${aws_security_group.main_security_group.id}"
}
