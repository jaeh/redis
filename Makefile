REDIS_DIR = ./redis
VENDOR_DIR = vendor
CONTAINER_NAME = magic/redis

.PHONY: \
	build \
	run \
	all \
	;

# build the docker container
# see the ./Dockerfile for further information
build:
	docker build -t="${CONTAINER_NAME}" ${REDIS_DIR};

# run the built docker container
run:
	docker run ${CONTAINER_NAME};

# first build, then run container
all: build run
