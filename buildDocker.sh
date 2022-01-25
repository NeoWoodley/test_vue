#!/bin/bash
# 生成环境包：安装package.json里的包依赖
yarn install
# 发布包
yarn build
# 构建docker镜像：运行Dockerfile文件
docker build -t test_vue_container .
# 启动docker容器
docker run -d -p 9090:8080 --name test_vue test_vue_container -v /var/log/nginx:/var/log/nginx

