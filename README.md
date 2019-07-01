# wsl-docker
wsl2下docker便捷启动脚本


## start-server.bat
- 是使用docker-compose对docker for windows 版本的快速开发环境编排


## start-server-wsl.bat
- 是使用docker-compose 对在wsl2 下安装的docker进行编排的工具
- 该脚本自动提取出 docker-compose.yml中定义的容器端口，并使用netsh命令在宿主机上进行端口映射 解决了当前wsl2系统中，访问linux内的程序必须使用linux内的ip的尴尬问题
### 重要提醒
- 使用者请自行 更改下脚本第6行和第17行 关于docker-compose.yml文件路径所在位置的配置
