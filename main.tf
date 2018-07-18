variable "role_name" {}
variable "allowed_arns" {}
variable "iam_policy" {}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["${split(",", var.allowed_arns)}"]
    }
  }
}

resource "aws_iam_role" "iam_role" {
  name = "${var.role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.instance-assume-role-policy.json}"
}

resource "aws_iam_role_policy" "test_policy" {
  name = "${var.role_name}-policy"
  role = "${aws_iam_role.iam_role.id}"
  policy = "${var.iam_policy}"
}
