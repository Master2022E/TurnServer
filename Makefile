CONTAINER_NAME=turn-server

all: run

logs:
	docker logs $(CONTAINER_NAME) -f -n 100

run:
	docker run -d --network=host -v $(pwd)/my.conf:/etc/coturn/turnserver.conf --name $(CONTAINER_NAME) coturn/coturn

stop:
	docker stop $(CONTAINER_NAME)
