variable  "db_class" {}

variable  "db_storage" {}

variable  "db_final_snapshot" {
  default = "true"
}

variable  "db_password" {}

variable  "cidr_prefix" {
  default = "10.10"
}

variable  "my_ip" {}

variable  "srv_size" {
  default = "t2.medium"
}

variable  "db_multi_az" {}

variable  "db_backup_retention" {}

variable  "db_name" {}

variable  "db_username" {}

variable  "rancher_admin_password" {}

variable  "rancher_admin_username" {}

variable  "rancher_admin_name" {}

