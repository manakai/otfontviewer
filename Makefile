GIT = git
CURL = curl
WGET = wget
SAVEURL = $(WGET) -O

all: build

updatenightly: build #local/bin/pmbp.pl
	#$(CURL) -s -S -L https://gist.githubusercontent.com/wakaba/34a71d3137a52abb562d/raw/gistfile1.txt | sh
	#$(GIT) add modules
	#perl local/bin/pmbp.pl --update
	$(GIT) add config opentype.js components.js
	$(CURL) -sSLf https://raw.githubusercontent.com/wakaba/ciconfig/master/ciconfig | RUN_GIT=1 REMOVE_UNUSED=1 perl

deps:

build: opentype.js components.js

build-github-pages:

opentype.js: local/generated
	$(SAVEURL) $@ https://raw.githubusercontent.com/manakai/opentypejs/master/dist/opentype.js

components.js: local/page-components.js local/time.js local/unit-number.js
	cat local/page-components.js local/time.js > $@
	cat local/unit-number.js >> $@

local/page-components.js: local/generated
	$(SAVEURL) $@ https://raw.githubusercontent.com/wakaba/html-page-components/master/src/page-components.js
local/time.js: local/generated
	$(SAVEURL) $@ https://raw.githubusercontent.com/wakaba/timejs/master/src/time.js
local/unit-number.js: local/generated
	$(SAVEURL) $@ https://raw.githubusercontent.com/wakaba/html-unit-number/master/src/unit-number.js

local/generated:
	mkdir -p local

## License: Public Domain.
