# KPI_DevOps_Task2__Docker_Web_Server 

## Dockerizing a Node.js web app 

### Write Terraform configuration

Build Docker image:
```
$ docker build . -t blacktwig/dockerwebapp
```

Created image will now be listed by Docker:
```
$ docker images
```

Run docker image with options:
```
$ docker run -p 80:8080 --cpus=1 -m="96m" -d blacktwig/dockerwebapp
```
-d - run container in the detached mode
-p - maps ports in container to Docker host port (in this case it maps port 80 on container to 8080 on Docker host)
-m - the maximum amount of memory the container can use
--cpus - specify how much of the available CPU resources a container can use

Check if container is running and get container ID:
```
$ docker ps
```

Print app output:
```
$ docker logs <container id>
```

This Docker image is mapped the 8080 port inside of the container to the port 80 on your machine.
Now we can test our Node-js app just opening http://localhost/ in the browser.

Or, you can call your app using `curl` (install if needed via: `sudo apt-get install curl`):
```
$ curl -i localhost:80
```

In order to shut down the started web-app use the kill command. This uses the container's ID:
```
# Kill the running container
$ docker kill <container_id>
```

The docker kill subcommand kills one or more containers. The main process inside the container is sent SIGKILL signal (default), or the signal that is specified with the --signal option. You can reference a container by its ID, ID-prefix, or name.

Resources:

https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

https://www.simplilearn.com/tutorials/docker-tutorial
