resource "aws_eks_cluster" "eks" {

  name = var.cluster_name

  role_arn = aws_iam_role.eks_cluster_role.arn

  version = "1.33"

  vpc_config {

    subnet_ids = [
      aws_subnet.public1.id,
      aws_subnet.public2.id
    ]

    endpoint_public_access  = true
    endpoint_private_access = false
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy
  ]
}