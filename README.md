# fw-server
Quick firmware server for Tasmota firmware OTA updates

```
docker run -it --name fw-server -v "/docker-data/fw":"/fw" -p "80:5000/tcp" --net='bridge' jakezp/fw-server
```
