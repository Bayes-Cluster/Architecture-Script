sudo helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
sudo helm repo update

sudo helm upgrade --cleanup-on-fail \
  --install jupyterhub jupyterhub/jupyterhub \
  --namespace jupyterhub  \
  --create-namespace \
  --version=2.0.0 \
  --values jupyterhub-config.yaml \
  --timeout 600s
