::Stop & remove containers
FOR /F "tokens=1* USEBACKQ" %%F IN (`docker ps -af "name=selenoid" -q`) DO (
  docker stop %%F
  docker rm -f %%F
)
::Removing images
FOR /F "tokens=1* USEBACKQ" %%F IN (`docker images -a -q`) DO (
  docker rmi %%F
)

::Download browser images
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

::up containers
cd ../../selenoid
docker-compose up -d
pause
