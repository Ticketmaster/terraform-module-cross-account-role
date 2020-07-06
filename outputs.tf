output "aws_iam_role_arn" {
  value = "${aws_iam_role.iam_role.arn}"
}

output "aws_iam_role_name" {
  value = "${aws_iam_role.iam_role.name}"
}

output "aws_iam_role_policy_name" {
  value = "${aws_iam_role_policy.iam_policy.name}"
}
