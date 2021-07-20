
# Example EKS Config Notes

TODO:
- SSL Security
- ECR Images
- S3 w/ CloudFront
- Fargate

## Helpful Resources

### Upcoming Events
- [re: invent](https://reinvent.awsevents.com/?sc_icampaign=Event_event_reInvent_DG2&sc_ichannel=ha&sc_icontent=awssm-8337_event_customer_reinvent21&sc_ioutcome=Strategic_Events&sc_iplace=hero&trk=ha_a134p000007BgyOAAS~ha_awssm-8337_event_customer_reinvent21&trkCampaign=AWS_reInvent_2021)

### AWS Reference
- [Application load balancing on Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html)
- [AWS Load Balancer Controller](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html)
- [Setting up end-to-end TLS encryption on Amazon EKS with the new AWS Load Balancer Controller](https://aws.amazon.com/blogs/containers/setting-up-end-to-end-tls-encryption-on-amazon-eks-with-the-new-aws-load-balancer-controller/)
- [EKS Workshop](https://www.eksworkshop.com/010_introduction/)
- [Using a Network Load Balancer with the NGINX Ingress Controller on Amazon EKS](https://aws.amazon.com/blogs/opensource/network-load-balancer-nginx-ingress-controller-eks/)
- [Fargate](https://docs.aws.amazon.com/eks/latest/userguide/fargate.html)
- *[Create an HTTPS listener for your Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html)
- *[aws cli create-listener](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/elbv2/create-listener.html)
- *[Using Amazon ECR Images with Amazon EKS](https://docs.aws.amazon.com/AmazonECR/latest/userguide/ECR_on_EKS.html)
- [Workload Management](https://docs.aws.amazon.com/eks/latest/userguide/eks-workloads.html)
- [Containers Roadmap](https://github.com/aws/containers-roadmap/projects/1?card_filter_query=eks)
- [Setting up with Amazon ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/get-set-up-for-amazon-ecr.html)
- [Using Amazon ECR with the AWS CLI](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html)

### YouTube
- [Setup AWS Application Load Balancer Ingress in Kubernetes](https://www.youtube.com/watch?v=S8U7A-eGdOs)
  - Bonus: [Minimal Code Examples](https://github.com/RobinNagpal/kubernetes-tutorials/blob/master/06_tools/007_alb_ingress/01_eks/Makefile)
- Part 1: [Unboxing the new AWS Load Balancer Controller for K8s](https://www.youtube.com/watch?v=Lw4-noYhMjQ)
- Part 2: [Deploying your app to AWS Fargate on Amazon EKS](https://www.youtube.com/watch?v=J67CHCXHMxw)

### Other Reference Info

- [Docker CLI Reference](https://docs.docker.com/engine/reference/run/)
- [Kubernetes Ingress Docs](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Securing a Cluster](https://kubernetes.io/docs/concepts/cluster-administration/#securing-a-cluster)

- https://github.com/coding-flamingo/K8sandHelm
- https://github.com/RobinNagpal/kubernetes-tutorials/blob/master/06_tools/007_alb_ingress/01_eks/k8s/01-foo-deployment.yml


## Tools

### `aws`

```
Logging into AWS ECR:
aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com
```

### `kubectl`

#### Useful Command Examples

```
kubectl get svc,po,deploy
kubectl get nodes
kubectl -n venture-industries get Ingress
kubectl get all -n venture-industries
kubectl logs -f k8sfrontend-venture-industries-1-deployment-679ddf759b-6f46k -n venture-industries
kubectl exec -it -n venture-industries pod/k8sfrontend-venture-industries-deployment-6d9bc86596-rqlr9 -- /bin/sh
```

### `eksctl`

- [Config Examples](https://github.com/weaveworks/eksctl/tree/main/examples)

#### Useful Command Examples

```
eksctl get cluster --region us-west-2
eksctl create cluster -f <path>
eksctl utils write-kubeconfig --region us-east-1 --cluster cluster-1
```

### `helm`

- [Getting Started Guide](https://helm.sh/docs/chart_template_guide/getting_started/)

#### Helm Setup

```
curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
OR
brew install kubernetes-helm
```

#### Other Helm Repos / Charts

```
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install nginx bitnami/nginx
```

#### Useful Command Examples

```
helm upgrade -i venture-industries venture-industries
helm uninstall venture-industries venture-industries
kubectl get deployment -n kube-system aws-load-balancer-controller
helm ls --namespace venture-industries
```

## Kubernetes Analytics UIs
### Pixie

- [Website](https://px.dev/)

### Grafana

- [Website](https://grafana.com/oss/grafana/)

### Kubernetes Dashboard

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
aws eks get-token --cluster-name cluster-1 | jq -r '.status.token'
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
```





