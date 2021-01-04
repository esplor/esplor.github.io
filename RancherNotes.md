# My rancher notes

## Docker run rancher manager

```docker
docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  -v /host/rancher:/var/lib/rancher \
  rancher/rancher:stable
```

```docker
sudo docker run -d --privileged --restart=unless-stopped \
--net=host -v /etc/kubernetes:/etc/kubernetes \
-v /var/run:/var/run rancher/rancher-agent:v2.1.1 \
--server https://ran-man.home.vbn.no \
--token gmkmgpkrwpd9j5lcf6tnrxz4pct7z5xhxtw6zk5l6b7ldq6c8vwnbg \
--ca-checksum 2b63363bb5602aef3dc5cb9195370b300ce6d6c43a180e3dfbe11c073c3c3b2e \
--etcd --controlplane --worker
```