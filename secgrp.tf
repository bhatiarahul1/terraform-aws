resource "aws_security_group" "devops-beanelb" {
  name = "devops-bean-elb-sg"
  description = "devops-bean-sg"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "devops-bastion-sg" {
  name = "devops-bastion-sg"
  description = "devops-bastion-sg"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = [0.0.0.0/0]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = [var.my_ip]
  }
}

resource "aws_security_group" "devops-prod-sg" {
  name = "devops-bean-prod-sg"
  description = "devops-bean-prod-sg"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = [0.0.0.0/0]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = [ aws_security_group.devops-bastion-sg.id ]
  }

}

resource "aws_security_group" "devops-backend-sg" {
  name =  "devops-backend-sg"
  description = "sg for RDS, Cache and memcache"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = [0.0.0.0/0]
  }
  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = [ aws_security_group.devops-prod-sg.id]
  }

}

resource "aws_security_group_rule" "sec_grp_to_allow_itself" {
  from_port         = 0
  protocol          = "tcp"
  security_group_id = aws_security_group.devops-backend-sg.id
  source_security_group_id = aws_security_group.devops-backend-sg.id
  to_port           = 65535
  type              = "ingress"
}