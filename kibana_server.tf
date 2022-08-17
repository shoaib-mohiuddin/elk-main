resource "aws_instance" "kibana_server" {
  #ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  #key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.kibana_public.id

  tags = {
    Name = "Kibana"
  }
}

resource "aws_eip" "kibana_server_ip" {
  instance = aws_instance.kibana_server.id
  vpc      = true
}