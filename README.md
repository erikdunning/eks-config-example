
# Example EKS Config Notes

TODO:
- SSL Security
- ECR Images
- S3 w/ CloudFront

## Helpful Resources

- [Setup AWS Application Load Balancer Ingress in Kubernetes](https://www.youtube.com/watch?v=S8U7A-eGdOs)
  - Bonus: [Minimal Code Examples](https://github.com/RobinNagpal/kubernetes-tutorials/blob/master/06_tools/007_alb_ingress/01_eks/Makefile)
- [Unboxing the new AWS Load Balancer Controller for K8s](https://www.youtube.com/watch?v=Lw4-noYhMjQ)
- [Helm Getting Started Guide](https://helm.sh/docs/chart_template_guide/getting_started/)
- [eksctl Examples](https://github.com/weaveworks/eksctl/tree/main/examples)
- [Docker CLI Reference](https://docs.docker.com/engine/reference/run/)
- [Kubernetes Ingress Docs](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Securing a Cluster](https://kubernetes.io/docs/concepts/cluster-administration/#securing-a-cluster)

- https://github.com/coding-flamingo/K8sandHelm
- https://github.com/RobinNagpal/kubernetes-tutorials/blob/master/06_tools/007_alb_ingress/01_eks/k8s/01-foo-deployment.yml

## Kubernetes Dashboard Setup

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
aws eks get-token --cluster-name cluster-1 | jq -r '.status.token'
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
```

## Helm Setup

```
curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
OR
brew install kubernetes-helm
helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set clusterName=cluster-1 \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  -n kube-system
```

### Other Helm Repos / Charts

```
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install nginx bitnami/nginx
```

## Command Examples

### `helm`

```
helm upgrade -i venture-industries-1 venture_industries/
helm uninstall venture-industries venture_industries
kubectl get deployment -n kube-system aws-load-balancer-controller
helm ls --namespace venture-industries
```

### `kubectl`

```
kubectl get svc,po,deploy
kubectl get nodes
kubectl -n venture-industries get Ingress
kubectl get all -n venture-industries
kubectl logs -f k8sfrontend-venture-industries-1-deployment-679ddf759b-6f46k -n venture-industries
```

### `eksctl`

```
eksctl get cluster --region us-west-2
eksctl create cluster -f <path>
eksctl utils write-kubeconfig --region us-east-1 --cluster cluster-1
```


