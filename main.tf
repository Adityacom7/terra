
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "main-subnet"
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
    security_group_ids = module.sg.sg_id
    iam_instance_profile = module.iam.instance_profile
    key_name = var.key_name
    tags = {
        Name = "my-ec2-instance"
    }
}
