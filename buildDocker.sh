#!/bin/bash
# 生成环境包：安装package.json里的包依赖
node -v
npm install -g yarn -registry=https://registry.npm.taobao.org
yarn -v
#--pure-lockfile  这个参数是在服务器install不生成yarn.lock，防止服务器和本地代码冲突
yarn install --pure-lockfile
# 发布包
yarn build
# 构建docker镜像：运行Dockerfile文件
docker build -t test_vue_container .
# 启动docker容器
docker run -d -p 9090:8080 --name test_vue test_vue_container -v /var/log/nginx:/var/log/nginx

