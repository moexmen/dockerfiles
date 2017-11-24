# Socat

Yet another socat container

## Usage

Direct traffic from the $CONTAINER_PORT to the $HOST_PORT
```
docker run --rm -e CONTAINER_PORT=$CONTAINER_PORT -e HOST_PORT=3000 moexmen/socat
```

By default, socat will forward all the traffic to the host machine.

Use the $TARGET_HOST variable to redirect to a specific host instead

```
docker run --rm -e CONTAINER_PORT=$CONTAINER_PORT -e HOST_PORT=$HOST_PORT -e TARGET_HOST=$TARGET_HOST moexmen/socat
```
