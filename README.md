# hkknx-docker
Docker Template for HKKNX

```
docker run -d \
  --name hkknx \
  --hostname hkknx \
  --restart=always \
  --network host \
  -e HKKNX_PORT=8180 \
  -v /var/lib/hkknx:/data \
  -d hkknx:latest
```

## Build
```
docker build ~/path/to/hkknx-template/ --build-arg HKKNX_VERSION=1.0.1 -t -t hkknx:latest
```
