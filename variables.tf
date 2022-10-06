# VPC FILE VARIABLES
#####################
variable "vpc_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "subnet_cidr_1" {
  default = "10.10.1.0/24"
}

variable "subnet_cidr_2" {
  default = "10.10.3.0/24"
}

variable "subnet_cidr_private" {
  default = "10.10.2.0/24"
}

variable "az_subnet_1" {
  default = "us-east-1a"
}

variable "az_subnet_2" {
  default = "us-east-1b"
}

variable "az_private_subnet" {
  default = "us-east-1c"
}

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

variable "ebs_optimized" {
  description = "must be true or the default is false"
  type        = bool
  default     = false
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
variable "bucket_name" {
  description = "Must be unique aws-wide"
  type        = string
  default     = "rady-bucket-test1"
}

variable "versioning" {
  description = "Cange to TRUE if you vant versioning ON in your S3 bucket"
  type        = bool
  default     = false
}

#--------- SG vars ------------------------#
variable "to_port_def" {
  type    = number
  default = 0
}

variable "from_port_def" {
  type    = number
  default = 0
}

variable "all_protocols" {
  type    = string
  default = "-1"
}

variable "sg_cidrs" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

######
# RDS VARS

variable "db_engine" {
  description = "possible values are also including mysql"
  default     = "postgres"
}

variable "db_username" {
  default = "admin1"
}