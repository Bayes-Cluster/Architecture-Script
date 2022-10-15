curl -sfL https://rancher-mirror.oss-cn-beijing.aliyuncs.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn  INSTALL_K3S_EXEC="agent 
                    --server https://<apiserver-ip>:6443 \
                    --token=k3s-token \
                    --flannel-iface wg0         \
                    --node-name $HOSTNAME" sh -
