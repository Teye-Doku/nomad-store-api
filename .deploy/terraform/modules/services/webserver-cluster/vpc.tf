resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc
  enable_dns_support = true 
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet_1_public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_public_subnet_1
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    "Tier" = "Public"
  }
}
resource "aws_subnet" "subnet_2_public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_public_subnet_2
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    "Tier" = "Public"
  }
}
resource "aws_subnet" "subnet_3_public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_public_subnet_3
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    "Tier" = "Public"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta_subnet_1_public" {
  subnet_id = aws_subnet.subnet_1_public.id
  route_table_id = aws_route_table.rtb_public.id
}
resource "aws_route_table_association" "rta_subnet_2_public" {
  subnet_id = aws_subnet.subnet_2_public.id
  route_table_id = aws_route_table.rtb_public.id
}
resource "aws_route_table_association" "rta_subnet_3_public" {
  subnet_id = aws_subnet.subnet_3_public.id
  route_table_id = aws_route_table.rtb_public.id
}