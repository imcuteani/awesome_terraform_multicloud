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

resource "aws_iam_role_policy_attachment" "name" {
  
}