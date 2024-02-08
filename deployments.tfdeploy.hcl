identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

identity_token "k8s" {
  audience = ["k8s.workload.identity"]
}


deployment "development" {
  variables = {
    aws_identity_token_file = identity_token.aws.jwt_filename
    regions             = ["ap-southeast-2"]
    role_arn            = "arn:aws:iam::713532411193:role/tfstacks-role"
    vpc_name = "eks-vpc"
    vpc_cidr = "10.0.0.0/16"
    kubernetes_version = "1.28"
    cluster_name = "eks-cluster"
    
    #EKS OIDC
    tfc_kubernetes_audience = "k8s.workload.identity"
    tfc_hostname = "https://app.terraform.io"
    tfc_organization_name = "hashi-demos-apj"
    eks_clusteradmin_arn = "arn:aws:iam::713532411193:role/aws_rchao_test-developer"
    eks_clusteradmin_username = "aws_rchao_test-developer"

    #K8S
    k8s_identity_token_file = identity_token.k8s.jwt_filename
    namespace = "hashibank"

  }
}
