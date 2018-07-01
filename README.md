# docker_perf

notes
=====


http://chairnerd.seatgeek.com/faster-redeploys-with-docker-build-cacher/

docker images -a 

docker run -it ubuntu bash

docker info
vfs - BAD!
devicemapper - slow!

delete dangling images
docker rmi $(docker images -f "dangling=true" -q)

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker build -t friendlyhello .  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyhello  # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello         # Same thing, but in detached mode
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
docker login             # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag                   # Run image from a registry

https://docs.docker.com/develop/develop-images/multistage-build/


docker stack ls                                            # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
docker service ls                 # List running services associated with an app
docker service ps <service>                  # List tasks associated with an app
docker inspect <task or container>                   # Inspect task or container
docker container ls -q                                      # List container IDs
docker stack rm <appname>                             # Tear down an application
docker swarm leave --force      # Take down a single node swarm from the manager


User-defined bridge networks are best when you need multiple
containers to communicate on the same Docker host.

Host networks are best when the network stack should not be isolated
from the Docker host, but you want other aspects of the container to
be isolated.

Overlay networks are best when you need containers running on
different Docker hosts to communicate, or when multiple applications
work together using swarm services.

Macvlan networks are best when you are migrating from a VM setup or
need your containers to look like physical hosts on your network, each
with a unique MAC address.

Third-party network plugins allow you to integrate Docker with
specialized network stacks.

For the ADD and COPY instructions, the contents of the file(s) in the
image are examined and a checksum is calculated for each file. The
last-modified and last-accessed times of the file(s) are not
considered in these checksums. During the cache lookup, the checksum
is compared against the checksum in the existing images. If anything
has changed in the file(s), such as the contents and metadata, then
the cache is invalidated.


recommended RUN apt-get combo
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.* \
 && rm -rf /var/lib/apt/lists/*