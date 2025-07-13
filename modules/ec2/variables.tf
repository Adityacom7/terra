variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}
variable "iam_instance_profile" {}
variable "key_name" {}
variable "user_data" {
  default = ""
}
variable "tags" {
  type = map(string)
}
