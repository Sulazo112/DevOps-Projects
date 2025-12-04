# Working with Docker Containers

### Introduction to Docker Containers

Docker containers are lightweight, portable, and executable units that encapsulate an application and its dependencies. In the previous step, we worked a little with docker contaier. We would dive deep into the basics of working with Docker containers, from launching and running containers to managing their lifecycle.

### Running Containers

To run a container, you use the docker run command followed by the name of the image you want to use.

Reacall that we pulled an ubuntu image from the official ubuntu repository on docker hub. Let's create a container from the ubuntu image. This command launches a container based on the Ubuntu image.

docker run ubuntu

![Docker run ubuntu](./img/Docker%20run%20ubuntu1.png)

The image above shows that the container is created but not running. We can start the container by running

docker start CONTAINER_ID

![Docker start](./img/Docker%20start.png)

### Launching Containers with Different Options

Docker provides various options to customize the behavior of containers. For example, we can specify environment variables, map ports, and mount volumes. Here's an example of running a container with a specific environment variable:

docker run -e "MY_VARIABLE=my-value" ubuntu

### Running Containers in the Background

By default, containers run in the foreground, and the terminal is attached to the container's standard input/output. To run a container in the background, use the -d option:

docker run -d ubuntu

This command starts a container in the background, allowing us to continue using the terminal.

### Container Lifecycle

Containers have a lifecycle that includes creating, starting, stopping, and restarting. Once a container is created, it can be started and stopped multiple times.

### Starting, Stopping, and Restarting Containers

1. To start a stopped container:

docker start container_name

2. To stop a running container:

docker stop container_name

3. To restart a container:

docker restart container_name

#### Removing Containers

To remove a container, you use the docker rm command followed by the container's ID or name:

docker rm container_name

This deletes the container, but keep in mind that the associated image remains on your system.

In this module, we've learned the basics of working with Docker containers—launching them, customizing their behavior, managing their lifecycle, and removing them. Understanding these fundamentals is crucial for effectively using Docker in our development and deployment workflows.

### Side Hustle Task: Docker Container Operations

1. Start a Container and Run a Simple Command:

Use an official Ubuntu image to start a container. If you don't have the image, you can pull it from docker hub

docker run ubuntu

![docker run ubuntu](./img/docker%20run%20ubuntu.png)

Run a simple command within the container, such as displaying the system information.

docker ps -a

![docker ps -a](./img/docker%20run%20ubuntu.png)

2. Stop the Container and Verify Its Status:

Stop the running container

docker stop container_name

Verify that the container is stopped

![Docker stop](./img/Docker%20stop.png)

![Verify the container is stopped](./img/Verify%20the%20container%20is%20stopped.png)

Note the status column to confirm the container's status.

![confirm container status](./img/confirm%20container%20status.png)

3. Restart the Container and Observe Changes:

Restart the stopped container

docker restart container_name

![Docker restart](./img/Docker%20restart.png)

Verify the container's status again to ensure it's running

docker ps -a

![Verifying container status](./img/Verifying%20container%20status.png)

Observe any changes or differences in the container's behavior after the restart.

![After restart](./img/After%20restart.png)

4. Remove the Container:

Stop the running container (if it's still running)

![Docker stop running](./img/Docker%20stop%20running.png)

Remove the container

docker rm container_name

![Docker remove](./img/Docker%20remove.png)

Verify that the container is removed

![Verifying removed container](./img/Verifying%20removed%20container.png)

Confirm that the container is no longer listed.

![Confirm container no longer listed](./img/Confirm%20container%20no%20longer%20listed.png)

End.

