variable "aws_region" {
  default = "us-east-2"
}

variable "ami" {
  type = map(any)
  default = {
    us-east-2 = "ami-0cbea92f2377277a4"
    us-east-1 = "ami-0cbea92f2375247a5"
    us-west-2 = "ami-0cbea92f2377277y4"
  }
}

variable "priv_key" {
  default = "devopskey"
}

variable "pub_key" {
  default = "devopskey.pub"
}

variable "username" {
  default = "ubuntu"
}

variable "my_ip" {
  default = "103.208.71.103/32"
}

variable "rmquser" {
  default = "rabbit"
}

variable "rmqpass" {
  default = "R@bbit@123456"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "admin123"
}

variable "dbname" {
  default = "accounts"
}

variable "instance_count" {
  default = "1"
}

variable "vpc_name" {
  default = "devops-vpc-2"
}

variable "zone1" {
  default = "us-east-2a"
}

variable "zone2" {
  default = "us-east-2b"
}

variable "zone3" {
  default = "us-east-2c"
}

variable "vpccidr" {
  default = "172.21.0.0/16"
}

variable "pubsub1cidr" {
  default = "171.21.1.0/24"
}

variable "pubsub2cidr" {
  default = "171.21.2.0/24"
}

variable "pubsub3cidr" {
  default = "171.21.3.0/24"
}

variable "privsub1cidr" {
  default = "171.21.4.0/24"
}

variable "privsub2cidr" {
  default = "171.21.5.0/24"
}

variable "privsub3cidr" {
  default = "171.21.6.0/24"
}