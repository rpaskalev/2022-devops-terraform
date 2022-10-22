variable  "db_engine" {
    description = "possible values"
    default = "postgres" 
  }

  variable  "db_username" {
        default = "admin1" 
  }

variable "environment" { 
}

variable "db_name" {
    default = "mydb"
 }

variable "engine_version" {
    type = string
    default = "10.21"
  
}

variable "instance_class" {
    type = string
    default = "db.t3.micro"
}


variable "security_group" {
    default = []
  }

variable "public_subnet_1" {
      default = ""
 
}
