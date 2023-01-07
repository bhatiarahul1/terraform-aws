module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpccidr
  azs = [var.zone1,var.zone2,var.zone3]
  private_subnets = [var.privsub1cidr,var.privsub2cidr,var.privsub3cidr]
  public_subnets = [var.pubsub1cidr,var.pubsub2cidr,var.pubsub3cidr]


  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support = true

  vpc_tags = {
    Name = var.vpc_name
  }
}


