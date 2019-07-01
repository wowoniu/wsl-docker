@echo off
setlocal enabledelayedexpansion


:: ****************************************************************************************
set wsl_docker_compose_file=/mnt/g/DOCKER_SERVER/DOCKER/DOCKER_SERVER/wsl2/docker-compose.yml

:: get sub linux ip
wsl ip addr | grep eth0 | awk "/inet ([0-9\.]+)/{print $2}"|awk -F "/" "{print $1}" >> ip_tmp
set/p sub_linux_ip=<ip_tmp
del ip_tmp
echo SUB LINUX IP:%sub_linux_ip%



:: set container port proxy
wsl awk '/- [0-9]+:[0-9]+ ?$/{if(index($0,"#")==0){sub("-","");sub(":[0-9]+","");sub(/^[[:blank:]]*/,"");print}}' /mnt/g/DOCKER_SERVER/DOCKER/DOCKER_SERVER/wsl2/docker-compose.yml >> prot_tmp
for /f "delims=" %%i in (prot_tmp) do (
  set p=%%i
  echo RESET PORT PROXY:!p!
  netsh interface portproxy delete v4tov4 listenport=!p!
  netsh interface portproxy add v4tov4 listenport=!p! connectaddress=%sub_linux_ip% connectport=!p!
)
del prot_tmp


:: start docker container
wsl docker-compose -f /mnt/g/DOCKER_SERVER/DOCKER/DOCKER_SERVER/wsl2/docker-compose.yml down
wsl docker-compose -f /mnt/g//DOCKER_SERVER/DOCKER/DOCKER_SERVER/wsl2/docker-compose.yml up -d
echo DOCKER_CONTAINERS IS RUNNING
pause