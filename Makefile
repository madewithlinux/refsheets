TEX     := pdflatex
# shell escape is needed for minted latex package
TEXOPTS := --halt-on-error -shell-escape
SOURCES := $(wildcard *.tex)
OUTPUTS := $(SOURCES:%.tex=%.pdf)

all: $(OUTPUTS) 

clean:
	rm  -f *.pdf
	rm -rf .latex
	mkdir -p .latex

%.pdf: %.tex
	mkdir -p .latex
	# cd into folder so all the latex garbage goes there
	cd .latex && $(TEX) $(TEXOPTS) ../$<
	# this compresses the output pdf file
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ .latex/$@
	# cp .latex/$@ $@
