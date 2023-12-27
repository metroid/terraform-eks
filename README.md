# terraform-eks

Requirements
|  Name    |	  Version  |
|--------- |------------|
|terraform |	>= 0.14.0|


Providers
|Name |	Version|
|-----|--------|
|aws 	| 5.0.0|
|random |3.1.0|

Modules
|Name |	Source| 	Version|
|-----|-------|----------|
|eks|terraform-aws-modules/eks/aws|17.24.0|


Resources
|Name||
|----|---|
|aws_iam_role||
|aws_eks_cluster||
|aws_iam_role_policy_attachment||
|aws_eks_node_group||
|aws_iam_role_policy_attachment|arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy|
|aws_iam_role_policy_attachment|arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy|
|aws_iam_role_policy_attachment|arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly|
