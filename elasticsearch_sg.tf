resource "aws_security_group" "elasticsearch_sg" {
  name        = "elasticsearch-sg"
  description = "Allow connection for Elasticsearch"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description      = "Allow port 9200"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    cidr_blocks      = [aws_security_group.kibana_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "elasticsearch-sg"
  }
}