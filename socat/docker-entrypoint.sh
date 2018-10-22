#!/bin/ash

if [[ $# -ne 0 ]]; then
    exec "$@"
else
    if [[ -z "$TARGET_HOST" ]]; then
        # On windows and mac, the `host.docker.internal` resolves
        # to the host ip
        # Linux doesn't work properly yet, see below
        # https://github.com/docker/for-linux/issues/264
        getent hosts host.docker.internal > /dev/null
        if [[ $? -eq 0 ]]; then
            TARGET_HOST=host.docker.internal
        else
            TARGET_HOST=$(ip route | grep default | awk "{print \$3}")
        fi

    else
        TARGET_HOST=${TARGET_HOST}
    fi

    set -u

    echo "Listening ${CONTAINER_PORT}, forwarding to ${TARGET_HOST}:${HOST_PORT}"
    exec socat tcp-listen:${CONTAINER_PORT},fork tcp-connect:${TARGET_HOST}:${HOST_PORT}
fi
