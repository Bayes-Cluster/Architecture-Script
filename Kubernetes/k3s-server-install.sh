curl -sfL https://rancher-mirror.oss-cn-beijing.aliyuncs.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn  INSTALL_K3S_EXEC=" \
                        --datastore-endpoint=mysql://db-user:db-passwd@#@tcp(db-ip:3306)/k3s \
						--token=$(openssl -hex 16) \
                        --node-ip $(ip addr show wg0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1) \
                        --advertise-address $(ip addr show wg0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1) \
                        --node-external-ip $(ip addr show wg0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1) \
                        --flannel-iface wg0   \
                        --node-name $HOSTNAME " sh -
