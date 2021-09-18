# Resource block for AWS EKS Cluster

resource "random_string" "suffix" {
  length = 8
  special = false
}

locals {
  cluster_name = "demo-eks-${random_string.suffix.result}"
}


resource "aws_eks_cluster" "eks_cluster" {
    name = local.cluster_name
    role_arn = aws_iam_role.kube_iam_role.arn
    cluster_version = "1.21"
    vpc_id = aws_vpc.main.id
    vpc_config {
      subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
    }
    
    depends_on = [
      aws_iam_role_policy_attachment.eks_cluster_policy, 
      aws_iam_role_policy_attachment.ks_vpc_resource_controller
    ]

    tags = {
      "Environment" = "development"
      "Cost-center" = "1000-2003"
    }

    worker_group_defaults = {
        root_volume_type = "gp2"
    }

    worker_groups = [
        {
            name = "worker_group_1"
            instance_type = "t2.small"
            additional_userdata = "echo eks"
            asg_desired_capacity = 2
            additional_security_group_ids = [aws_security_group.worker_group_1.id]
        },

        {
            name = "worker_group_2"
            instance_type = "t2.medium"
            additional_userdata = "echo eks"
            asg_desired_capacity = 1
            additional_security_group_ids = [aws_security_group.worker_group_2.id]
        }
    ]
}

