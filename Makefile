all: build

NOMS  := node_modules
BOCO  := bower_components
GRUNT := $(NOMS)/.bin/grunt
BOWER := $(NOMS)/.bin/bower

$(NOMS): package.json
	@npm install

$(BOCO): $(NOMS) bower.json
	@$(BOWER) install

build: $(NOMS) $(BOCO)
	@$(GRUNT) build

dev: $(NOMS) $(BOCO)
	@$(GRUNT) dev

deploy: $(NOMS) $(BOCO)
	@$(GRUNT) deploy

clean:
	@if [ -f $(GRUNT) ]; then $(GRUNT) clean ; fi

distclean: clean
	@rm -rf $(NOMS) $(BOCO)

.PHONY: all build dev deploy clean distclean
