// aws variables
variable "jenkins_server_node_region" {
  description = "instance region"
  default     = "us-west-1"
}

variable "jenkins_server_instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro" // burst what? why didn't he want this spec?z
}

variable "jenkins_server_instance_name" {
  description = "EC2 instance name"
  default     = "jenkins-server"
}

variable "jenkins_server_operating_system" {
  description = "EC2 instance name"
  default     = "jenkins-server"
}