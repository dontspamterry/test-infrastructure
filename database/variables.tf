variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region to deploy to"
}

variable "self_serve_state_db_read_cu" {
  default     = 5
  description = "Read capacity units"
}

variable "self_serve_state_db_write_cu" {
  default     = 5
  description = "Write capacity units"
}
