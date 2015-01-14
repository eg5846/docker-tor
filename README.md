# tor docker image
Simple tor docker image with tor daemon installed. 

## Build tor docker image
```
git clone https://github.com/eg5846/tor-docker.git
cd tor-docker
sudo docker build -t eg5846/tor-docker .

# Pushing image to registry.hub.docker.com is no longer required!!!
# Image build is automatically initiated after pushing commits of project to github.com
# sudo docker push eg5846/tor-docker
```

# Run tor docker image
```
sudo docker run -d -p 9050:9050 --name tor -h tor eg5846/tor-docker

# Optional: Set tor exit nodes in env
sudo docker run -d -e TOR_EXITNODES="{ca}" -p 9050:9050 --name tor -h tor eg5846/tor-docker
```

## TODO
* Process tor logs with logstash
* Do not run tor daemon with root rights
