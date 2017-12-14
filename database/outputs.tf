output "self_serve_user_state_arn" {
  value = "${aws_dynamodb_table.self_serve_user_state.arn}"
}