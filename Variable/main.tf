provider "aws" {
  access_key = "--------------------------------"  # user aceess key
  secret_key = "--------------------------------"  # user secret key
  region = var.region     # relocation data to variable by var.data function
}


resource "aws_instance" "web_server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server.id]
  depends_on = [aws_instance.DB_Server, aws_instance.App_server] 
  # monitoring = var.enable_detailed_monitoring   # This part enabling monitoring but it's not free of charge 
  tags = merge(var.common_tags, { Name = "web_server"})
  
}

resource "aws_instance" "App_server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server.id]
  depends_on = [aws_instance.DB_Server, aws_instance.App_server] 
  tags = merge(var.common_tags, { Name = "App_Server"})
}

resource "aws_instance" "DB_Server" {
  ami = "ami-0e2031728ef69a466"  # Amazon Linux
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server.id]
  tags = merge(var.common_tags, { Name = "DB_server"})

}


# Security Group
resource "aws_security_group" "web_server" {
  name        = "WebServer_Security_Group"
  description = "Allow inbound traffic"
  

# Incomming traffic

  dynamic "ingress" {              # allow us to add several rules by one block
    for_each = var.allow_ports
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

  tags = merge(var.common_tags, { Name = "Dynamic SecurityGroup"})
} 
 
