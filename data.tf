data "aws_ami" "ubuntu" { # for bastion host
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}
data "aws_ami" "_" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["_"]
  }

  owners = ["_"]
}

data "aws_vpc" "main_vpc" {

  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}

data "aws_subnet" "kibana_public" {

  filter {
    name   = "tag:Name"
    values = ["KibanaSubnet-Public"]
  }
}

data "aws_subnet" "monitor_private" {

  filter {
    name   = "tag:Name"
    values = ["MonitoringSubnet-Private"]
  }
}

data "aws_subnet" "app_private_a" {

  filter {
    name   = "tag:Name"
    values = ["AppSubnet-Private-a"]
  }
}

data "aws_subnet" "app_private_b" {

  filter {
    name   = "tag:Name"
    values = ["AppSubnet-Private-b"]
  }
}

data "aws_subnet" "app_private_c" {

  filter {
    name   = "tag:Name"
    values = ["AppSubnet-Private-c"]
  }
}