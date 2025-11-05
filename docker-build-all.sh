#!/bin/bash
# 镜像仓库地址
registry_url="crpi-p3j3l56qfuzd5nzg.cn-shenzhen.personal.cr.aliyuncs.com"
# 镜像组名
group_name="taybct"
# 镜像版本
image_version="3.5.0"
# 需要 build 哪些 jar 包的名都往这个数组里面放
apps=('spring-taybct-gateway' 'spring-taybct-auth' 'spring-taybct-module-system' 'spring-taybct-admin-file' 'spring-taybct-admin-log' 'spring-taybct-admin-monitor' 'spring-taybct-module-lf' 'spring-taybct-module-online-doc' 'spring-taybct-module-scheduling')
for(( i=0;i<${#apps[@]};i++)) ; do
    ./docker-build.sh -u "$registry_url" -g "$group_name" -n "${apps[$i]}" -v "$image_version"
done
