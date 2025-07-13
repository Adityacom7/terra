resource "aws_iam_role" "ec2_role" {
  name = var.name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

  resource "aws_iam_instance_profile" "ec2_profile" {
    name = "${var.name}_instance_profile"
    role = aws_iam_role.ec2_role.name
  }
