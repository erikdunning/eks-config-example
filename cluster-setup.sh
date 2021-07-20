#!/bin/bash

export AWS_PROFILE=ventureindustries
export AWS_REGION=us-east-1
export EKS_CLUSTER=venture-compound-east
export my_domain=ventureindustries.io
export ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

# helm repo add eks https://aws.github.io/eks-charts
# helm repo add jetstack https://charts.jetstack.io
# helm repo update
# helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
#   --set clusterName=${EKS_CLUSTER} \
#   --set serviceAccount.create=false \
#   --set serviceAccount.name=aws-load-balancer-controller \
#   -n kube-system

# kubectl create namespace venture-industries

helm upgrade -i venture-industries venture-industries

kubectl -n venture-industries get Ingress