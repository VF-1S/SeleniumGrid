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
docker pull selenoid/chrome:97.0
docker pull selenoid/chrome:96.0
docker pull selenoid/chrome:95.0
docker pull selenoid/firefox:96.0
docker pull selenoid/firefox:95.0
docker pull selenoid/firefox:94.0
docker pull browsers/edge:97.0
docker pull browsers/edge:96.0
docker pull browsers/edge:95.0
docker pull selenoid/opera:82.0
docker pull selenoid/opera:81.0
docker pull browsers/safari:15.0
docker pull browsers/safari:14.0
docker pull selenoid/video-recorder:latest-release 

::up containers
cd ../../selenoid
docker-compose up -d
pause
