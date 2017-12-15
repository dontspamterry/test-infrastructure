output "self_serve_auth_arn" {
  value = "${aws_dynamodb_table.ccp_auth.arn}"
}

output "self_serve_state_arn" {
  value = "${aws_dynamodb_table.ccp_state.arn}"
}