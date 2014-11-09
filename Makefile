#all: _SDL _SDL_image _SDL_ttf
all: _SDL _SDL_image


PWD=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SYSROOT=$(PWD)/../sysroot

_SDL:
	cd SDL && sh ./configure --prefix=$(SYSROOT) \
		&& make && make install

_SDL_image:
	cd SDL_image && sh ./configure --prefix=$(SYSROOT) \
		&& make && make install

_SDL_ttf:
	cd SDL_ttf && sh ./configure --prefix=$(SYSROOT) \
		&& make && make install

_SDL_mixer:
	cd SDL_mixer && sh ./configure --prefix=$(SYSROOT) \
		--enable-music-mod=n \
		--enable-music-midi=n \
		&& make && make install


