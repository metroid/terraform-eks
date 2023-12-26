# Recursos eks
#  * cluster development
#  * cluster deployment
#  * 
#
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.23"
  subnets         = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id


  workers_group_defaults = {
    root_volume_type = "gp3"
    
  }

  worker_groups = [
    {
      name                          = var.workers_name_deployment
      instance_type                 = var.instance_type
      additional_userdata           = ""
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
      
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

