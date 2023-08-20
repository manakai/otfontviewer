WGET = wget
SAVEURL = $(WGET) -O

all: build

build: opentype.js components.js

opentype.js:
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
