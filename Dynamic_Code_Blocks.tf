provider "aws" {
  access_key = "AKIARJ5LAJYCOIXAVGFC"  # user aceess key
  secret_key = "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"  # user secret key
  region = "eu-central-1"
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
 