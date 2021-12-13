#Stop & remove containers
docker rm -f $(docker ps -f name=selenoid -q)

#Download browser images
docker pull selenoid/chrome:92.0
docker pull selenoid/chrome:91.0
docker pull selenoid/chrome:90.0
docker pull selenoid/firefox:91.0
docker pull selenoid/firefox:90.0
docker pull selenoid/firefox:89.0
docker pull browsers/edge:93.0
docker pull browsers/edge:92.0
docker pull selenoid/opera:77.0
docker pull browsers/safari:14.0
docker pull selenoid/video-recorder:latest-release 

./installDockerCompose

#up containers
cd ../../selenoid
/usr/local/bin/docker-compose up -d








