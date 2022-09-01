# 本地测试docker-compose 打成压缩包

APP_ENV=""
NAME="nuxt-demo2"
TYPE
EXPOSE=3000
POST=3002

while getopts ":e:n:t:" opt
do
    case $opt in
        e)
          APP_ENV=$OPTARG
        ;;
        n)
          NAME=$OPTARG
        ;;
        t)
          TYPE=$OPTARG
        ;;
        ?)
        echo "未知参数"
        exit 1;;
    esac
done


if [ $APP_ENV ] && [ $NAME ]; then
echo "---- 当前环境 - $APP_ENV -----"
echo "---- docker镜像的名字 - $NAME -----"
echo "---- 创建docker-compose.yml -----"
cat>docker-compose.yml<<EOF
version: '3'
services: 
    app:
      build:
        context: ./
        dockerfile: docker/$APP_ENV/Dockerfile
        args:
          APP_ENV: $APP_ENV
      image: $NAME
      container_name: $NAME
      expose:
        - $EXPOSE
      ports:
        - "$POST:$EXPOSE"
      restart: always
      mem_limit: 1G
EOF
fi

if [ "$TYPE" == "build" ]; then
    echo "---- 打包容器 -----"
    echo "---- docker-compose build -----"
    docker-compose build

    echo "---- 保存成tar压缩包 -----"
    docker save -o ${NAME}.tar ${NAME}
    echo "---- 保存成功 -----"
fi

if [ "$TYPE" == "start" ]; then
    echo "---- 删除旧容器 -----"
    docker rmi -f ${NAME}

    echo "---- 解压镜像文件-------"
    docker load --input ${NAME}.tar
    echo "---- 解压成功 -----"

    echo "---- 停止容器 -----"
    echo "---- docker-compose down -----"
    docker-compose down
    echo "---- 启动容器 -----"
    echo "---- docker-compose up -d -----"
    docker-compose up -d
fi

if [ "$TYPE" == "stop" ]; then
    echo "---- 停止容器 -----"
    echo "---- docker-compose down -----"
    docker-compose down
fi