
- 使用DOCKER BUILDKIT

```bash
DOCKER_BUILDKIT dokcer build
```
或者修改/etc/docker/daemon.json

```text
{ "features": { "buildkit": true } }
```

这样就可以在RUN中使用`--mount=type=cache,target=/var/cache/apt` 就可以使用宿主机的cache来安装，加快docker build


- 使用stack启动container
```bash
docker stack deploy --with-registry-auth --prune -c deploy-tools/mtPytorchDev/docker-compose.yml bczhou
```