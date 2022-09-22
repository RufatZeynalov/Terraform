provider "aws" {
  access_key = "--------------------------------"  # user aceess key
  secret_key = "--------------------------------"  # user secret key
  region = "eu-central-1"
}

# Making static IP Address 

resource "aws_eip" "my_static_ip" {
    instance = aws_instance.apache_server.id
}
# server description
resource "aws_instance" "apache_server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]       
  user_data = templatefile ("../script.sh.tpl" , {
    f_name = "Rufat"
    l_name = "Zeynalov"
    names = ["Nizi", "Bahlul", "Qexpe"]
  })   # send data into our scrpith.sh file  tpl its extantion for dinamic files
  tags = { 
    Name = "Web Server Build by Terraform"
    Owner = " Rufat Zeynalov"
  }
  lifecycle {
    prevent_destroy = true  # prevent to destroy user data 
    ignore_changes = ["ami", "user_data"] # ignore to prevent ami, user-data changes
  }
  lifecycle {
    create_before_destroy = true # # will create new instance before the destroy old one 
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
 
