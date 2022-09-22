provider "aws" {
  access_key = "AKIARJ5LAJYCOIXAVGFC"  # user aceess key
  secret_key = "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"  # user secret key
  region = "eu-central-1"
}

data "aws_availability_zones"  "working" {} # show available zones in that region
data "aws_caller_identity" "current" {}    # show account ID
data "aws_region" "current" {}  # show region name and description 
data "aws_vpcs" "my_vpcs" {}  # show available vpcs

# Show production vpc with name prod
data "aws_vpc" "prod_vpc" {
    tags = {
        Name = "prod"
    }
}

# Creating 2 subnet on prod vpc 
resource "aws_subnet" "prod_subnet_1" {
    vpc_id = data.aws_vpc.prod_vpc.id   # taking this value from output prod_vpc_id
    availability_zone = data.aws_availability_zones.working.names[0] # taking this value from output data_aws_availability_zones
    cidr_block = "172.31.48.0/20"
    tags = {
        Name = "Subnet-1 in ${data.aws_availability_zones.working.names[0]}" # name will automatically assign from availabiliyu zone
        Account = "Subnet in Account ${data.aws_caller_identity.current.account_id}"
        Region = data.aws_region.current.description
    }
}

resource "aws_subnet" "prod_subnet_2" {
    vpc_id = data.aws_vpc.prod_vpc.id   # taking this value from output prod_vpc_id
    availability_zone = data.aws_availability_zones.working.names[1] # taking this value from output data_aws_availability_zones
    cidr_block = "172.31.64.0/20"
    tags = {
        Name = "Subnet-2 in ${data.aws_availability_zones.working.names[1]}" # name will automatically assign from availabiliyu zone
        Account = "Subnet in Account ${data.aws_caller_identity.current.account_id}"
        Region = data.aws_region.current.description
    }
}

output "prod_vpc_id" {
    value = data.aws_vpc.prod_vpc.id  
}

output "prod_vpc_cidr" {
    value = data.aws_vpc.prod_vpc.cidr_block # prod vpc blocks
}


output "aws_vpc" {
    value = data.aws_vpcs.my_vpcs.ids
}

output "data_aws_availability_zones" {
    value = data.aws_availability_zones.working.names    #[1] or [2] show only one region from the list 
}

output "data_aws_caller_identity" {
    value = data.aws_caller_identity.current.account_id   
}

output "data_aws_region" {
    value = data.aws_region.current.name
}

output "data_description" {
    value = data.aws_region.current.description
}