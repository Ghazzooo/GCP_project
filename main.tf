module "network" {
    source = "./network"
    region = var.region
    vpc_name = var.vpc_name
   
    subnet_name_1 = var.subnet_name_1
    subnet_name_2 = var.subnet_name_2
    subnet_cidr_1 = var.subnet_cidr_1
    subnet_cidr_2 = var.subnet_cidr_2
}