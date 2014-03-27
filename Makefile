all: _SDL _SDL_image _SDL_ttf

_SDL:
	cd SDL && ./configure && make
_SDL_image:
	cd SDL_image && ./configure && make
_SDL_ttf:
	cd SDL_ttf && ./configure && make
