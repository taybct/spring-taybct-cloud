IMAGE_NAME=spring-taybct-gateway
VERSION=3.5.2
docker build -f ./Dockerfile -t ghcr.io/taybct/$IMAGE_NAME:$VERSION --build-arg JAR_FILE=target/$IMAGE_NAME-$VERSION.jar .