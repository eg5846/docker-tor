# docker-tor
Simple docker image with tor daemon installed.  
Should be used together with https://github.com/eg5846/docker-polipo

## Build tor docker image
```
git clone https://github.com/eg5846/docker-tor.git
cd docker-tor
sudo docker pull ubuntu:bionic
sudo docker build -t tor .
```

## Run tor docker container
```
sudo docker run -d --restart=always -P --name tor tor

# Optional: Set tor exit nodes in env
sudo docker run -d --restart=always -e TOR_EXITNODES={ca} -P --name tor tor
```

## Inspect tor docker container
```
# Show stdout
sudo docker logs tor

# Run bash inside container
sudo docker exec -it tor /bin/bash
cat /var/log/tor/notice.log
exit

# Access logfile on volume directly
sudo docker run --rm -t --volumes-from tor tor cat /var/log/tor/notice.log 
```

## TODOs
* Process tor logs with logstash
* Do not run tor daemon with root rights
