variable "owner" {
  description = "Owner Id of the AMI"
  type        = string
}

variable "ami_elasticsearch" {
  description = "AMI for Elasticsearch"
  type        = string
}

variable "ami_logstash" {
  description = "AMI for Logstash"
  type        = string
}

variable "ami_kibana" {
  description = "AMI for Kibana"
  type        = string
}

variable "ami_filebeat" {
  description = "AMI for Filebeat"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}