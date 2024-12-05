scripts := $(wildcard *.py)
notebooks := $(patsubst %.py,%.ipynb,$(scripts))
notebooks-rendered := $(patsubst %.py,%.html,$(scripts))


.PHONY: all clean notebooks notebooks-rendered

all: notebooks

notebooks: $(notebooks)

notebooks-rendered: $(notebooks-rendered)

%.ipynb: %.py
	jupytext $< --output $@

%.html: %.ipynb
	jupyter nbconvert $< --execute --to html

clean:
	rm -f *.ipynb
	rm -f *.html
