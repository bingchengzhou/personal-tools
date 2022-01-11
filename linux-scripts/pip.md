
- pip 替换源，如果安装慢，可以使用稍低版本的，避免和别人抢资源


```bash
pip install opencv-python==4.1.2.30  -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
```

- pip 安装去依赖

```bash
pip install --no-deps torchvision==0.10 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
```