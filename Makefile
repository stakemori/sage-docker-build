BIN_PKG_PATH := $(HOME)/binary-pkg
VOLUME := '$(BIN_PKG_PATH):/home/docker/binary-pkg'

binary-pkg-clone:
	if [ ! -d $(BIN_PKG_PATH) ]; then cd && git clone https://github.com/sagemath/binary-pkg.git; fi
docker-build:
	docker build -t sage-build .
build-sage:
	docker run -v $(VOLUME) -m 4096m sage-build
docker-login:
	docker run -it -v $(VOLUME) -m 4096m sage-build
