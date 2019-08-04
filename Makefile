.PHONY: clean build

clean:
	scripts/clean.sh

build:
	scripts/build.sh ${VERSION}
