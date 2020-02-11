#!/bin/sh

# 服务端口
targetPort=8080
# 镜像版本号
vendor=1.0.0
# 项目名称
projectName=spring-hello-demo

# 软件打包
cd $WORKSPACE
mvn clean package -D skipTests

# 删除基于镜像的所有容器
if [ $(docker ps -aqf "name=$projectName") ];then 
    docker rm -f $projectName
fi

# 删除旧镜像
if [ $(docker images -qf "reference=$projectName:$vendor") ];then 
    docker rmi -f $projectName:$vendor
fi
 
# 创建镜像
docker build -t $projectName:$vendor .
 
# 基于镜像启动容器
docker run --name $projectName -d -p $targetPort:$targetPort $projectName:$vendor
