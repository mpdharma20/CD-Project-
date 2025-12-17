resource "aws_instance" "web_server" {
    ami="ami-0c55b159cbfafe1f0"
    instance_type="t2.micro"
    tags = {
        Name = "WebServerInstance"
    }
    subnet_id = aws_subnet.main.id
    vpc_security_group_ids = [aws_security_group.web_sg.id]

    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd
                systemctl enable httpd
                echo "Hello World from $(hostname -f)" > /var/www/html/index.html
                EOF

}
