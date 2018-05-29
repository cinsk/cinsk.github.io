
# See https://plugins.getnikola.com/v8/orgmode/


SUBSYSTEMS = cfaqs-ko
TOP_DIR := $(shell pwd)
export TOP_DIR

all: subsystem-all css build

css:
	mkdir -p files/assets/css
	pygmentize -S emacs -a .highlight -f html >> files/assets/css/custom.css

newpost:
	nikola new_post -f orgmode

build:
	nikola build
	find output -name '*.html' | xargs sed -i '' -e 's/\"ko\">영어</\"ko\">한국어</g'

subsystem-all:
	git submodule update --init
	$(MAKE) -C cfaqs-ko copy-parent

subsystem-clean:
	git submodule update --init
	$(MAKE) -C cfaqs-ko clean

clean: subsystem-clean
	rm -rf files/cfaqs
	rm -rf output

deploy:
	nikola github_deploy
