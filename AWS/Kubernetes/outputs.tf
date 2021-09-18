output "eks_endpoint" {
    value = aws_eks_cluster.eks_cluster.endpoint
  
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "aws_eks_cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}

output "aws_eks_cluster_vpc_id" {
    value = aws_eks_cluster.eks_cluster.vpc_config
}

output "aws_eks_cluster_name" {
    value = aws_eks_cluster.eks_cluster.name
}