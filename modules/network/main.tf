resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"

  tags = merge(local.tags, { Name = local.vpc_name })
}

resource "aws_subnet" "my_subnets" {
  for_each                = local.subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(local.tags, { Name = each.value.name })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, { Name = local.igw_name })
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, { Name = local.route_table_name })
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_associations" {
  for_each = aws_subnet.my_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}