data "aws_vpc" "main_vpc" {

  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}
