FROM python:3.10.11-alpine3.17
RUN set -x \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f bash \
                             curl \
                             wget \
                             tzdata \
    && rm -rf /var/cache/apk/* \
    && apk update \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && pip3 install flask python-dotenv requests==2.27.1 -i https://mirrors.ustc.edu.cn/pypi/web/simple
WORKDIR /app