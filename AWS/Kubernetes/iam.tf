# Resource block of AWS EKS Cluster

resource "aws_iam_role" "kube_iam_role" {
  name = var.eks_iam_role_name

  assume_role_policy = <<POLICY
  {
      "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arm:aws:iam::aws:policy/AmazinEKSClusterPolicy"
  role = aws_iam_role.kube_iam_role.name
}

#Optional , enable Security Groups for Pods 

resource "aws_iam_role_policy_attachment" "eks_vpc_resource_controller" {
  policy_arn = "arm:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role = aws_iam_role.kube_iam_role.name
  
}