# tor docker image
Simple docker image with tor daemon installed.  
Should be used together with https://github.com/eg5846/polipo-docker

## Build tor docker image
```
git clone https://github.com/eg5846/tor-docker.git
cd tor-docker
sudo docker build -t eg5846/tor-docker .

# Pushing image to registry.hub.docker.com is no longer required!!!
# Image build is automatically initiated after pushing commits of project to github.com.
# sudo docker push eg5846/tor-docker
```

## Run tor docker container
```
sudo docker run -d -P --name tor -h tor eg5846/tor-docker

# Optional: Set tor exit nodes in env
sudo docker run -d -e TOR_EXITNODES={ca} -P --name tor -h tor eg5846/tor-docker
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
docker run --rm -t --volumes-from tor eg5846/ubuntu-docker:trusty cat /var/log/tor/notice.log 
```

## TODO
* Process tor logs with logstash
* Do not run tor daemon with root rights
