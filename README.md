# Docker


## 单系统架构

``` shell
docker build -t iautre/java .
```

## 多系统构架

``` shell
docker buildx build -t iautre/java:17 --platform=linux/amd64,linux/arm64 . --push
```

``` shell
docker buildx build -t iautre/java:17 --platform=linux/amd64 . --push
```
``` shell
docker build --platform=linux/amd64 -t iautre/java:17 . --push
```