terraform {
  backend "local" {

  }
}

provider "aws" {
  region = "${var.aws_region}"
  version = "~> 0.1"
  shared_credentials_file = "/Users/terrysiu/.aws/credentials"
  profile = "fake"
  skip_credentials_validation = true
  endpoints {
    dynamodb = "http://localhost:8000"
  }
}

resource "aws_dynamodb_table" "ccp_auth" {
  name           = "ccp_self_service_auth_${var.environment}"
  read_capacity  = "${var.self_serve_auth_db_read_cu}"
  write_capacity = "${var.self_serve_auth_db_write_cu}"
  hash_key       = "token"

  attribute {
    name = "token"
    type = "S"
  }

  ttl {
    attribute_name = "timeToExist"
    enabled        = false
  }

  /*
  tags {
    Name         = "Self Serve User State DB"
    Environment  = "local'"
  }
  */
}

resource "aws_dynamodb_table" "ccp_state" {
  name           = "ccp_self_service_state_${var.environment}"
  read_capacity  = "${var.self_serve_state_db_read_cu}"
  write_capacity = "${var.self_serve_state_db_write_cu}"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  ttl {
    attribute_name = "timeToExist"
    enabled        = false
  }

  /*
  tags {
    Name         = "Self Serve User State DB"
    Environment  = "local'"
  }
  */
}
