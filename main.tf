
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

module "sg" {
    source = "./modules/sg"
    name= "ec2sg"
    vpc_id=aws_vpc.main.id

}

module "iam" {
    source = "./modules/IAM"
    name = var.name
}

module "ebs" {
    source = "./modules/EBS"
    availability_zone = var.aws_region

    size = 10
    tags = {
        Name = "my-ebs-volume"
    }
}


module "ec2" {
    source = "./modules/ec2"
    ami= var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.main.id
    security_group_ids = module.sg.security_group_ids
    iam_instance_profile = module.iam.instance_profile_name
    key_name = var.key_name
    tags = {
        Name = "my-ec2-instance"
    }
}
