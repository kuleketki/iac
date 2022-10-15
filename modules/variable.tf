//aws_vpc variables

variable "vpc_name" {
  description = "The service account name"
  type        = string
  default     = "aws_vpc"
}


variable "region" {
  description = "The region in which to create the VPC network"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block"{
  description = "The region in which to create the VPC network"
  type        = string
  default     = "172.168.0.0/16"
}

variable "rds_vpc_cidr_block"{
  description = "The region in which to create the VPC network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_count"{
    description = "Number of subnet"
    type = map(number)
    default = {
      public = 1,
      private = 2
    }
}

variable setting{
    description = "Configuration setting"
    type = map(any)
    default = {
      "database" = {
        allocated_storage = 10
        engine = "mysql"
        engine_version = "8.0.27"
        instance_class = "db.t2.micro"
        db_name = "todo"

      } 
    }
}

variable "public_subnet_cidr_bloc"{
    description = "Avaialble CIR block"
    type = string
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr_bloc"{
    description = "Avaialble CIR block"
    type =  list(string)

    default = ["10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24"
    ]
}

variable "db_username"{
    description = "User name"
    type = string
    default = "root"
}

variable "db_password" {
    description = "Password"
    type = string
    default = "root12345"
  
}




//peering vpc variables 

variable "owner_profile" {
  description = "AWS Profile"
  default     = "root"
}


variable "accepter_profile" {
  description = "AWS Profile"
  default     = "root"
}

variable "owner_vpc_id" {
  description = "vpc-0c44bd4b1d4a72faa"
  type = string
  default = "vpc-0087728f9e337feae"
}

variable "accepter_vpc_id" {
  description = "vpc-06e957ff4fd4e0428"
  type = string
  default = "vpc-046c34740077cf61e"
}

//for cluster vpc variable 
variable "username" {
  type        = string
  default     = "kops"
  description = "IAM username for kOps"
}

variable "profile" {
  type        = string
  default     = "root"
  description = "Git profile to be used for running the script"
}



variable "s3_bucket_name" {
  type        = string
  default     = "sandeepwagh.me"
  description = "Name of the s3 bucket to be created for kOps"
}

variable "master_size" {
  type        = string
  default     = "t3.small"
  description = "Name of the master_size to be created for kOps"
}

variable "node_size" {
  type        = string
  default     = "t3.small"
  description = "Name of the node_size to be created for kOps"
}

variable "zones" {
  type        = string
  default     = "us-east-1a,us-east-1b,us-east-1c"
  description = "Name of the zones to be created for kOps"
}

variable "domain_name" {
  type        = string
  default     = "aws.sandeepwagh.me"
  description = "Name of the kops cluster to be created for kOps"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "/Users/sandy/.ssh/kops-key.pub"
  description = "Name of the kops cluster to be created for kOps"
}

//kops create cluster --name=aws.sandeepwagh.me --cloud=aws --master-zones=us-east-1a,us-east-1b,us-east-1c --zones=us-east-1a,us-east-1b,us-east-1c --node-count=3 --topology=private --networking=calico --node-size=t3.small --kubernetes-version=1.22.15 --master-size=t3.small --master-image=ami-08c40ec9ead489470 --node-image=ami-08c40ec9ead489470 --ssh-public-key=/Users/sandy/.ssh/kops-key.pub --bastion=true --state=s3://sandeepwagh.me --yes

