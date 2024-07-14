# 使用官方Node.js镜像作为基础镜像
FROM node:latest
# 设置工作目录
WORKDIR /root/blog
# 配置淘宝镜像源
RUN npm config set registry http://registry.npm.taobao.org/
# 安装hexo脚手架
RUN npm install hexo-cli -g

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

# 容器启动的时候执行的命令
ENTRYPOINT ["docker-entrypoint.sh"]
