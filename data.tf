data "aws_ami" "ubuntu" { # for bastion host
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}
data "aws_ami" "ami_elasticsearch" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["ami-elasticsearch"]
  }

  owners = [var.owner]
}
data "aws_ami" "ami_logstash" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["ami-logstash"]
  }

  owners = [var.owner]
}
data "aws_ami" "ami_kibana" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["ami-kibana"]
  }

  owners = [var.owner]
}
data "aws_ami" "ami_filebeat" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["ami-filebeat"]
  }

  owners = [var.owner]
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

# data "aws_security_group" "bastion_sg" {

#   filter {
#     name   = "tag:Name"
#     values = ["bastion-sg"]
#   }
# }