# 使用 Ubuntu 20.04 作为基础镜像
FROM ghcr.io/sanchuanhehe/harmony-next-pipeline-docker/harmonyos-ci-image:latest

# 设置环境变量以避免交互式安装提示
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=$COMMANDLINE_TOOL_DIR/tool/node/bin:$PATH

RUN git clone \
        https://gitcode.com/openharmony-sig/flutter_flutter.git \
        -b --FLUTTER_REF-- \
        /opt/flutter

ENV FLUTTER_ROOT=/opt/flutter
ENV PATH=$FLUTTER_ROOT/bin:$PATH
ENV PUB_CACHE=$HOME/.pub-cache

RUN apt update && apt install curl -y

RUN flutter create --platforms=ohos first_app && cd first_app && flutter pub get && flutter build hap --target-platform=ohos-arm64

RUN rm -rf first_app

# 设置工作目录
WORKDIR /workspace

# 设置默认命令
CMD ["bash"]
