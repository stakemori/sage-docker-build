VOLUME := $(shell echo `pwd`/binary-pkg':'/home/buildbot/binary-pkg)

docker-build:
	docker build -t sage-build .
build-sage:
	docker run -v $(VOLUME) sage-build
