VERSION := 0.2.1
NAME := Gloom

all: clean build install_mod

build:
	mkdir build/
	mkdir build/$(NAME)_$(VERSION)
	cp info.json info.json.temp
	sed -i -e 's/@VERSION@/$(VERSION)/' info.json
	cp -R LICENSE README.md info.json control.lua libs build/$(NAME)_$(VERSION)
	cd build && zip -r $(NAME)_$(VERSION).zip $(NAME)_$(VERSION)
	mv info.json.temp info.json

clean:
	rm -rf build/
	
install_mod:
	if [ -L factorio_mods ] ; \
	then \
		cp -R build/$(NAME)_$(VERSION) factorio_mods ; \
	fi;
