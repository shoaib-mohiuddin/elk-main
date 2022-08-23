# resource "aws_instance" "ansible_servers" {
#   count = 3

#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.medium"

#   vpc_security_group_ids = [aws_security_group.ansible_server.id]
#   key_name = "talent-academy-lab"
#   subnet_id = data.aws_subnet._.id

#   tags = {
#     Name = "Ansible Server ${count.index + 1}"
#   }
# }

resource "aws_instance" "demo_server_1" {
  ami           = data.aws_ami.ami_filebeat.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = "ta-lab"
  subnet_id = data.aws_subnet.app_private_a.id

  tags = {
    Name = "Demo-1"
  }
}
resource "aws_instance" "demo_server_2" {
  ami           = data.aws_ami.ami_filebeat.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = "ta-lab"
  subnet_id = data.aws_subnet.app_private_b.id

  tags = {
    Name = "Demo-2"
  }
}
resource "aws_instance" "demo_server_3" {
  ami           = data.aws_ami.ami_filebeat.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = "ta-lab"
  subnet_id = data.aws_subnet.app_private_c.id

  tags = {
    Name = "Demo-3"
  }
}