

## 1.宿主机clone 工程

```shell
mkdir -p project
git clone git@github.com:MooreThreadsNDA/mtDNN.git
git clone --branch integrate_mtdnn git@github.com:MooreThreadsNDA/mtPyTorch.git mtPyTorch
git clone git@github.com:mthreads/ModelZoo.git
```

## 2.build docker
```sheel
git clone git@github.com:bingchengzhou/personal-tools.git
cd personal-tools
DOCKER_BUILDKIT=1 docker build -f docker/mtPytorch.Dockerfile -t mtpytorch:dev .
```

**build过程中如果显示没有docker buildkit，请删除mtPytorch.Dockerfile中的` --mount=type=cache,target=/var/cache/apt`(这一行是为了增加build时的apt包的缓存)**

## 3.docker 运行和环境准备

__docker run__

```shell
docker run -itd --name mtpytorch_dev -v ${project_dir}:/home/workspace mtpytorch:dev
docker exec it ${container_name} bash
```

__env准备__
```shell
cd /home/workspace && ./set_env.sh
cd /home/workspace/mtDNN && ./build.sh
cd /home/workspace/mtPytorch && python setup.py install
```



