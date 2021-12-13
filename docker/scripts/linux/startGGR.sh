#Stop & remove containers
docker rm -f $(docker ps -f name=ggr -q)

./installDockerCompose

#up containers
cd ~/seleniumgrid/docker/ggr
/usr/local/bin/docker-compose up -d








