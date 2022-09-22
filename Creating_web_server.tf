provider "aws" {
  access_key = "--------------------------------"  # user aceess key
  secret_key = "--------------------------------"  # user secret key
  region = "eu-central-1"
}
# server description
resource "aws_instance" "apache_server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]       # adding bash scrith in below in between of EOF symbols
  user_data = <<EOF
#! /bin/bash
yum -y update
yum -y install httpd
myip='curl http://169.254.169.254/latest/meta-data/local-ipv4'
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on


EOF
  
  tags = { 
    Name = "Web Server Build by Terraform"
    Owner = " Rufat Zeynalov"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
# Security Group
resource "aws_security_group" "web_server" {
  name        = "WebServer_Security_Group"
  description = "Allow inbound traffic"
  vpc_id      = aws_default_vpc.default.id


# Incomming traffic
  ingress {
    description      = "Allow traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

# Outgoing Traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebBulid Security Group"
    Owner = "Rufat Zeynalov"
  }
} 
 
