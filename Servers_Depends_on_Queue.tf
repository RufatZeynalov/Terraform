provider "aws" {
  access_key = "AKIARJ5LAJYCOIXAVGFC"  # user aceess key
  secret_key = "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"  # user secret key
  region = "eu-central-1"
}



resource "aws_instance" "web_server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]  
  tags = {
    name = "Web Server"
  }
  depends_on = [aws_instance.DB_Server, aws_instance.App_server]
}


resource "aws_instance" "App_server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id] 
  tags = {
    name = "Application Server"
  } 
  depends_on = [aws_instance.DB_Server]  # App server will not be created until DB server will be up 
}


resource "aws_instance" "DB_Server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]
  tags = {
    name = "Database Server"
  } 
}




# Security Group
resource "aws_security_group" "web_server" {
  name        = "WebServer_Security_Group"
  description = "Allow inbound traffic"


# Incomming traffic

  dynamic "ingress" {              # allow us to add several rules by one block
    for_each = ["80", "443", "8080", "7777"]   # adding port list with for_each loop
  content {
    from_port        = ingress.value     # redirecting us to for_each port list 
    to_port          = ingress.value 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

  
  ingress {
    description      = "Allow 22 port only for specefic IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.10.0.0/16"]
  }


# Outgoing Traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dynamic SecurityGroup"
    Owner = "Rufat Zeynalov"
  }
} 
 