resource "aws_instance" "elasticsearch_server" {
  ami           = data.aws_ami.ami_elasticsearch.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.elasticsearch_sg.id]
  key_name = "ta-lab"
  subnet_id = data.aws_subnet.monitor_private.id

  tags = {
    Name = "Elasticsearch"
  }
}