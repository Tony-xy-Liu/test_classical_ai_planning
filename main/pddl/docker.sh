
docker run -it \
    --mount type=bind,source="./",target="/ws" \
    --workdir="/ws" \
    --privileged aiplanning/planutils:latest \
    bash
