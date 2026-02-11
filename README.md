# data-engineering-zoomcamp-homework
Homework for https://github.com/DataTalksClub/data-engineering-zoomcamp/

## Docker
### Docker Image
A Docker Image is a template for creating a container

### Container
A container is a self-contained and isolated environment
- Create a container from a Docker Image:
    `docker run -it --option my_docker_image`
    - Use tag `-slim` (e.g python:3.13.11-slim) to create smaller container (run faster)
    - Use option `--entrypoint=bash` to start run in bash for debugging
    - Use option `--rm` to remove one-time use containers after each use
    - Append `-v /dir/in/local:/dir/in/container` to link a local directory to a container directory (Volume Mapping)
    - Append `-p localhost_port:container_port` to link a localhost port to a container port (Port Mapping)

- Use `docker ps -a` to get all running containers, use `docker ps -aq` to get only the id
- Use ``docker rm `docker ps -aq`` to remove all running containers

### Dockerfile
Dockerfile helps creating a Docker Image from other image(s) and/or file(s)
- `FROM another_docker_image`: Initiate from another image
- `WORKDIR /path/to/dir`: Change working directory in the image
- `COPY /path/to/dir /path/to/`: Copy directory(s)/file(s) to a directory in the image
- `RUN`: Execute a command
- `ENTRYPOINT ["default", "executable", "command"]`: Default command to be executed on container run

[Dockerfile Reference](https://docs.docker.com/reference/dockerfile/)

- Build a Docker Image:
    `docker build -t my_docker_image`

### Docker Network
Docker Network allows containers in the same network to communicate with each other via port like localhost.
- Create a Docker Network:
    `docker network create my_docker_network`
- Add a container to a network by adding the option `--network=my_docker_network`
- List all network:
    `docker network ls`

### Docker Compose
A docker-compose.yaml file helps creating multiple containers at once in the same network, without having to manually long docker command
- Run docker compose:
    `docker compose up`

[Docker Compose File Reference](https://docs.docker.com/reference/compose-file/)