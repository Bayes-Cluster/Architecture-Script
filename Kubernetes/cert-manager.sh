# add repo
sudo helm repo add jetstack https://charts.jetstack.io && sudo helm repo update
# helm insatll cert-manager
sudo helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.9.1 --set installCRDs=true
# cloudflare-token.yaml
sudo kubectl apply -f cloudflare-token.yaml
# ClusterIssuer.yaml
sudo kubectl apply -f ClusterIssuer.yaml
# Certificate.yaml
sudo kubectl apply -f Certificate.yaml
