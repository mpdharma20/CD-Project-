provider "aws"{
    region = "us-east-1"
    access_key = "AKIA6L4ONQT6YMSQKZRR"
    secert_key = "qa1oio/qu9lQ+DXifTzfd4ou2X343YBrVDxdXUzm"

}
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Micro-vpc"
    }
    }

resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "Micro-subnet-1"
    }
    }

    resource "aws_subnet" "my_subnet2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "Micro-subnet-2"
    }
    }

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "Micro-igw"
    }
    }

resource "aws_route_table" "my_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "Micro-route-table"
    }
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
}

resource "aws_route_table_association" "My route assoc" {
    subnet_id = aws_subnet.my_subnet.id
    route_table_id = aws_route_table.my_route_table.id
}

resource "aws_route_table_association" "My route assoc2" {
    subnet_id = aws_subnet.my_subnet2.id
    route_table_id = aws_route_table.my_route_table.id
}

