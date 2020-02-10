#!/bin/sh

#启用 prod 配置
ActiveProfiles=prod
#内部端口
targetPort=8080
#镜像版本号
vendor=1.0.0
#项目名
projectName=spring-hello-demo

# 打包
cd $WORKSPACE/$projectName
mvn clean package -D skipTests

#删除镜像下所有容器
if [ $(docker ps -qf "name=$projectName") ];then 
    docker rm -f $projectName
fi

#删除旧镜像
if [ $(docker images -qf "reference=$projectName:$vendor") ];then 
    docker rmi -f $projectName:$vendor
fi
 
#创建镜像
docker build -t $projectName:$vendor .
 
#启动镜像生成容器
docker run --name $projectName -d -p $targetPort:$targetPort $projectName:$vendor
