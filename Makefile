all: build

NOMS  := node_modules
BOCO  := bower_components
GRUNT := $(NOMS)/.bin/grunt
BOWER := $(NOMS)/.bin/bower

$(NOMS): package.json
	@npm install

$(BOCO): bower.json
	@$(BOWER) install

build: $(NOMS) $(BOCO)
	@$(GRUNT) build

test: $(NOMS) $(BOCO)
	@$(GRUNT) test

dev: $(NOMS) $(BOCO)
	@$(GRUNT) dev

deploy: $(NOMS) $(BOCO)
	@$(GRUNT) deploy

clean:
	@if [ -f $(GRUNT) ]; then $(GRUNT) clean ; fi

distclean: clean
	@rm -rf $(NOMS) bower_components

.PHONY: all build test dev deploy clean distclean
