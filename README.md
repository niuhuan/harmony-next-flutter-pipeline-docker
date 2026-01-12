# harmony-next-flutter-pipeline-docker

使用GithubActions构建基于flutter的鸿蒙NEXT项目

可以使用不同标签引入flutter的不同版本

| 镜像 | Harmony SDK | Flutter |
| --- | --- | --- |
| latest | 6.0.0.418SP | 3.27.5-ohos-1.0.0 |
| 3.27.5-ohos-1.0.0 | 6.0.0.418SP | 3.27.5-ohos-1.0.0 |
| 3.22.0-ohos | 6.0.0.418SP | 3.22.0-ohos |
| 3.7.12-ohos-1.0.6 | 6.0.0.418SP | 3.7.12-ohos-1.0.6 |


使用方式

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container: ghcr.io/niuhuan/harmony-next-flutter-pipeline-docker/image:latest
    steps:
      - name: build hap
        run: |
          # 若配置签名会直接输出 ./ohos/entry/build/default/outputs/default/entry-default-signed.hap
          # 若没有配置签名, 3.7.12-ohos-1.0.6 不会导致shell中断, 更高版本则会中断所以加上 || true
          flutter build hap --target-platform=ohos-arm64 || true
          # 需要执行以下两条命令输出 ./ohos/entry/build/default/outputs/
          cd ohos
          hvigorw assembleHap --release
```
