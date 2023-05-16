resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.example.id
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.example.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true 
}

resource "aws_eip" "bar" {
  vpc = true

  instance                  = aws_instance.example.id
  associate_with_private_ip = "10.0.0.12"
  depends_on                = [aws_internet_gateway.gw]
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_internet" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}


resource "aws_security_group" "example" {
  name = "example"
  description = "Allow all egress"
  vpc_id = aws_vpc.example.id

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    protocol = "all"
    to_port = 0
    from_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "All egress"
  }
}