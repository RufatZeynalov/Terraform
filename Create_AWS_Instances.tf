provider "aws" {
    access_key = "--------------------------------"  # user aceess key
    secret_key = "--------------------------------"  # user secret key
    region = "eu-central-1"
}

resource "aws_instance" "rufat_linux" {
    count = 2 # how many severs you want to create 
    ami = "ami-0e7e134863fac4946" 
    instance_type = "t2.micro"
}

