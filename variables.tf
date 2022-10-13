# VPC FILE VARIABLES
#####################


##########################
#variable for ec2
##########################

variable "ssh_key_name" {
  type        = string
  description = "key to use for SSH into the ec2 instance. I will leave it black, sub with your own"
  default     = "radostinpaskalev_key"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "usr_data_file" {
  type    = string
  default = "userdata.sh"
}
variable "tags" {
  type = map(any)
  default = {
    "Purpose"   = "2022_DevOps"
    "ManagedBy" = "Terraform"
    "Purpose"   = "school"
    Owner = "Dima"
  }
}

#-------- S3 BUCKET VARIABLES ------------#




#--------- SG vars ------------------------#


######
# RDS VARS

variable "db_engine" {
  description = "possible values are also including mysql"
  default     = "postgres"
}

variable "db_username" {
  default = "admin1"
}