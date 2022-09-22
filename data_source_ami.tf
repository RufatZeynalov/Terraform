provider "aws" {
  access_key = "--------------------------------"  # user aceess key
  secret_key = "--------------------------------"  # user secret key
  region = "eu-central-1"
}

data "aws_ami" "latest_ubuntu" {
    owners = ["099720109477"]
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
    }
}

data "aws_ami" "latest_amazon_linux" {
    owners = ["137112412989"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*-arm64-gp2"]
    }
}


data "aws_ami" "latest_windows_2022" {
    owners = ["801119661308"]
    most_recent = true
    filter {
        name = "name"
        values = ["Windows_Server-2022-English-Full-Base-*"]
    }
}

data "aws_ami" "latest_redhat_version" {
    owners = ["309956199498"]
    most_recent = true
    filter {
        name = "name"
        values = ["RHEL-8.6.0_HVM-*-x86_64-2-Hourly2-GP2"]
    }
}


output "latest_ubuntu_ami_id" {
    value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_ami_name" {
    value = data.aws_ami.latest_ubuntu.name
}

output "latest_amazon_ami_linux_id" {
    value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_ami_linux_name" {
    value = data.aws_ami.latest_amazon_linux.name
}

output "latest_windows_ami_2022_id" {
    value = data.aws_ami.latest_windows_2022.id
}

output "latest_windows_ami_2022_name" {
    value = data.aws_ami.latest_windows_2022.name
}

output "latest_redhat_ami_version_id" {
    value = data.aws_ami.latest_redhat_version.id
}

output "latest_redhat_ami_version_name" {
    value = data.aws_ami.latest_redhat_version.name
}
