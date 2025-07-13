resource "aws_instance" "prv"{
    ami= var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.vpc_security_group_ids
    key_name = var.key_name
    iam_instance_profile = var.iam_instance_profile 
    user_data = var.user_data
    
    
    root_block_device {
      volume_size = 10
    volume_type = "gp2"
  
    }
    tags = var.tags

  
}