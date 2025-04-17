# harmony-next-flutter-pipeline-docker

使用GithubActions构建基于flutter的鸿蒙NEXT项目

- 鸿蒙命令行工具版本为 5.0.4
- flutter 版本为 3.22.0-ohos

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
          flutter build hap --target-platform=ohos-arm64
          # 没有配置签名, 不会导致shell中断, 则需要执行以下两条命令输出 ./ohos/entry/build/default/outputs/default/entry-default-unsigned.hap
          cd ohos
          hvigorw assembleHap --release
```
