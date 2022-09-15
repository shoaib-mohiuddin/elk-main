resource "aws_security_group" "demo_sg" {
  name        = "demo-sg"
  description = "Allow connection for Demo servers"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description      = "Allow port 5044"
    from_port        = 5044
    to_port          = 5044
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo-sg"
  }
}