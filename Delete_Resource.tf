provider "aws" {
    access_key = "AKIARJ5LAJYCOIXAVGFC"  # user aceess key
    secret_key = "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"  # user secret key
    region = "eu-central-1"
}

resource "aws_instance" "rufat_linux" {
    ami = "ami-0e7e134863fac4946" 
    instance_type = "t2.micro"
    tags  = {   # addint tags on our instance 
        name = "test"
        owned = "rufat"
        project = "devops"
    }
    }