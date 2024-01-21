FROM openjdk:18-alpine
#声明作者
LABEL maintainer="a little <little@autre.cn> https://coding.autre.cn"
#环境变量
ARG SPRING_PROFILES_ACTIVE=prod
ENV SPRING_PROFILES_ACTIVE=${SPRING_PROFILES_ACTIVE}
#升级内核及软件
RUN set -x \
    && apk update \
    && apk upgrade \
    ##设置时区
    ##&& apk --update add --no-cache tzdata \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone \
    && apk del tzdata
    ## 清除安装软件及缓存
    ##&& rm -rf /tmp/* /var/cache/apk/*
# ##安装openjdk8
# RUN set -x \
#     && apk add openjdk17 \
#     && rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
#开放端口
EXPOSE 8080