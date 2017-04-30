VOLUME := '$HOME/binary-pkg:/home/docker/binary-pkg'

docker-build:
	docker build -t sage-build .
build-sage:
	docker run -v $(VOLUME) sage-build
docker-login:
	docker run -it -v $(VOLUME) -m 4096m sage-build
