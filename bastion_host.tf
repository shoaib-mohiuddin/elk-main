resource "aws_instance" "bastion_host" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  #key_name = "_"
  subnet_id = data.aws_subnet.kibana_public.id

  tags = {
    Name = "Bastion"
  }
}

resource "aws_eip" "bastion_host_ip" {
  instance = aws_instance.bastion_host.id
  vpc = true
}