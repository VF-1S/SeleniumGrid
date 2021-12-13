para poner un nodo como selenoid 

<host name="<selenoid_container_name" port="4444" count="5"/>     

asegurarse que seleneoid y ggr estan en la misma red
docker network ls
docker network inpsect network_name
docker network connect network_name selenoid_container_name