resource "aws_instance" "kibana_server" {
  ami           = data.aws_ami.ami_kibana.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name = "ta-lab"
  subnet_id = data.aws_subnet.kibana_public.id
  #associate_public_ip_address = true

  tags = {
    Name = "Kibana"
  }
}

resource "aws_eip" "kibana_server_ip" {
  instance = aws_instance.kibana_server.id
  vpc = true
}