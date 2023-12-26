environment					= "testing"
owner						= "ipalacios" 
cluster_name				=  "deployment-cluster"
vpc_name					=  "eks-devops-vpc"
region						=  "us-east-1"
cidr						=  "10.0.0.0/16"
public_subnets_cidr			=  ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
private_subnets_cidr		=  ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
workers_name_deployment		=  "jenkins"
instance_type				=  "t3.medium"
keyname						=  "devops-key"