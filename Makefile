
# See https://plugins.getnikola.com/v8/orgmode/


css:
	mkdir -p files/assets/css
	pygmentize -S emacs -a .highlight -f html >> files/assets/css/custom.css

build:
	nikola build
