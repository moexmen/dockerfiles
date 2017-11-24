#!/bin/ash

if [[ $# -ne 0 ]]; then
    exec "$@"
else
    if [[ -z "$TARGET_HOST" ]]; then
        # On the mac, the `docker.for.mac.localhost` resolves
        # to the host ip
        getent hosts docker.for.mac.localhost > /dev/null
        if [[ $? -eq 0 ]]; then
            TARGET_HOST=docker.for.mac.localhost
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
