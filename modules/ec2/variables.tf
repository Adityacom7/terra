variable "ami" {}
variable "vpc_security_group_ids"{
  type = list(string)
}
variable "instance_type" {}
variable "subnet_id" {}
variable "iam_instance_profile" {}
variable "key_name" {}
variable "user_data" {
  default = ""
}
variable "tags" {
  type = map(string)
}
