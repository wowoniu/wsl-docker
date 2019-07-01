@echo off
docker-compose -f G:/DOCKER_SERVER/DOCKER/DOCKER_SERVER/docker-compose.yml down
docker-compose -f G:/DOCKER_SERVER/DOCKER/DOCKER_SERVER/docker-compose.yml up -d
echo DOCKER_CONTAINERS IS RUNNING
echo.
pause
