SRC = $(wildcard *.md)
HTML = $(SRC:.md=.html)
FLAGS = -s --highlight-style=breezedark
#FLAGS = -s --highlight-style=breezedark --katex='https://yourdomain/path-to-katex'
TEMPLATE = template.html
CSS = theme.css
REMOTE = user@yourdomain 
REMOTE_DIR = /var/www/html
PORT = 22

.PHONY: all clean index
#.PHONY: all clean upload index

all: index $(HTML) 

%.html: %.md
	pandoc $(FLAGS) $< -c $(CSS) --template=$(TEMPLATE) -o $@

clean:
	rm -f $(HTML)

upload:
	scp -P $(PORT) $(HTML) $(CSS) $(REMOTE):$(REMOTE_DIR)

index:
	./generate-index.sh > index.md
