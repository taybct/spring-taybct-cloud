IMAGE_NAME=spring-taybct-gateway
VERSION=3.5.0
docker build -f ./Dockerfile -t crpi-p3j3l56qfuzd5nzg.cn-shenzhen.personal.cr.aliyuncs.com/taybct/$IMAGE_NAME:$VERSION --build-arg JAR_FILE=target/$IMAGE_NAME-$VERSION.jar .