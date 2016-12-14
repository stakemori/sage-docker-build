VOLUME := '/home/sho/app/binary-pkg:/home/buildbot/binary-pkg'

docker-build:
	docker build -t sage-build .
build-sage:
	docker run -v $(VOLUME) sage-build
docker-login:
	docker run -it -v $(VOLUME) -m 8192m sage-build
