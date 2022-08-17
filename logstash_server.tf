resource "aws_instance" "logstash_server" {
  #ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  vpc_security_group_ids = [aws_security_group.logstash_sg.id]
  #key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.monitor_private.id

  tags = {
    Name = "Logstash"
  }
}