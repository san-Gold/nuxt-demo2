echo "---- 停止容器 -----"
docker stop nuxt-demo1
echo "---- 删除容器 -----"
docker rm -f nuxt-demo1
echo "---- 创建容器 -----"
docker build -t nuxt-demo1 -f ./docker/staging/Dockerfile .
echo "---- 保存成tar压缩包 -----"
docker save -o nuxt-demo1-tar.tar nuxt-demo1

echo "---- 删除镜像 -----"
docker rmi -f nuxt-demo1

echo "---- 恢复镜像文件-------"
docker load --input nuxt-demo1-tar.tar

echo "---- 运行容器 -----"
docker run --name=nuxt-demo1 -d -p 3001:3000 nuxt-demo1

echo "---- 查看容器 -----"
docker ps -a