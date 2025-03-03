# Hello World Cron Job

This is a simple Docker container that runs a Python script every minute to print "Hello World" with a timestamp.

## Requirements

- Docker installed on your system

## Building the Container

To build the Docker container, run:

```bash
docker build -t hello-world-cron .
```

## Running the Container

To run the container:

```bash
docker run -d hello-world-cron
```

The container will run in detached mode and will print "Hello World" with a timestamp every minute. You can check the logs using:

```bash
docker logs <container_id>
```

## How it Works

- The Python script (`hello_world.py`) prints "Hello World" with a timestamp
- The Dockerfile sets up a Python environment with cron installed
- A cron job is configured to run every minute (`* * * * *`)
- The output is logged to `/var/log/cron.log` inside the container
- The container runs cron in the foreground and tails the log file 