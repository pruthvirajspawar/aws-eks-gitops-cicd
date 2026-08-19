resource "aws_eks_node_group" "nodegroup" {

  cluster_name = aws_eks_cluster.eks.name

  node_group_name = "eks-node-group"

  node_role_arn = aws_iam_role.node_role.arn

  subnet_ids = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]

  instance_types = [
    var.instance_type
  ]

  scaling_config {

    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_policy
  ]
}