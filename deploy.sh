#!/bin/bash

export AWS_PROFILE=ventureindustries
export AWS_REGION_1=us-east-1
export AWS_REGION_2=us-west-2
export EKS_CLUSTER_1=cluster-1
export EKS_CLUSTER_2=cluster-2
export my_domain=ventureindustries.io
export ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

# eksctl utils associate-iam-oidc-provider \
#   --region $AWS_REGION_1 \
#   --cluster $EKS_CLUSTER_1 \
#   --approve
  
# eksctl utils associate-iam-oidc-provider \
#   --region $AWS_REGION_2 \
#   --cluster $EKS_CLUSTER_2 \
#   --approve

# aws iam create-policy \
#   --policy-name AWSLoadBalancerControllerIAMPolicy \
#   --policy-document file://awslb-policy.json

eksctl create iamserviceaccount \
  --cluster $EKS_CLUSTER_1 \
  --namespace kube-system \
  --region $AWS_REGION_1 \
  --name aws-load-balancer-controller
  
eksctl create iamserviceaccount \
  --cluster $EKS_CLUSTER_2 \
  --namespace kube-system \
  --region $AWS_REGION_2 \
  --name aws-load-balancer-controller