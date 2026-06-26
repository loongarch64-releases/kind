FROM lcr.loongnix.cn/library/debian:unstable

RUN apt update && apt install -y git \
    make \
    golang

    

ENV KIND_VERSION=''

CMD ["sh", "-c","/workspace/process_version.sh $KIND_VERSION"]
