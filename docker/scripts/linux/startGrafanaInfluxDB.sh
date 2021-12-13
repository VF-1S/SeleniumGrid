docker network create grafana_network
docker run -d --network grafana_network -p 8086:8086 --name=influxdb1 -v /var/tmp/influxdb-storage:/var/lib/influxdb -v /var/tmp/influxdb/influxdb.conf:/etc/influxdb/influxdb.conf influxdb:1.7
docker run -d --network grafana_network -p 8087:8086 --name=influxdb -v /var/tmp/influxdb-storage2:/var/lib/influxdb2 influxdb:2.0
docker run -d --network grafana_network -p 3000:3000 --name=grafana -v /var/tmp/grafana-storage:/var/lib/grafana grafana/grafana
