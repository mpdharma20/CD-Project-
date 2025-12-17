resource "aws_security_group" "teraservice_sg" {
  name        = "teraservice_sg"
  description = "Security group for TeraService"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress{
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0./0"]
  }
}
resource "aws_security_group" "terraservice_sg" {
    name        = "terraservice_sg"
    description = "Security group for TerraService"
    vpc_id      = aws_vpc.main.id
    
    ingress {
        description      = "Allow HTTP"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]

    }
    egress{
        description      = "Allow all outbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

