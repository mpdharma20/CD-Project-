provider "aws"{
    region = "us-east-1"
    access_key = "AKIA6L4ONQT6YMSQKZRR"
    secert_key = "qa1oio/qu9lQ+DXifTzfd4ou2X343YBrVDxdXUzm"

}
resource "aws_instance" "MyEC2" {
  tags = {
    Name = "Demo-server"
  }
    ami = "ami-0fa3fe0fa7920f68e"
    instance_type = "t3.micro"
    key_name = "key 02-12"
 security_groups = ["default"]

root_block_device {
    volume_size = 40
    volume_type = "gp2"
    delete_on_termination = true
  }
}