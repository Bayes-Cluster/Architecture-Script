HOSTNAME=$1
PASSWD=$2

sudo helm repo add rancher-stable http://rancher-mirror.oss-cn-beijing.aliyuncs.com/server-charts/stable
sudo helm upgrade rancher rancher-stable/rancher --namespace cattle-system --create-namespace --set hostname=$HOSTNAME --set bootstrapPassword=$PASSWD --set ingress.tls.source=secret
