
- git https to ssh:

```bash
git remote set-url origin git@github.com:bingchengzhou/personal-tools.git
```

- git blame and git log:
```bash
git blame -L 431,444 -- aten/src/ATen/native/Normalization.cpp
# show commit id
git log e926f75b0bc
```