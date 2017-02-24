TEX     := pdflatex
TEXOPTS := --halt-on-error -output-directory=.latex -aux-directory=.latex
SOURCES := $(wildcard *.tex)
OUTPUTS := $(SOURCES:%.tex=%.pdf)

all: $(OUTPUTS) 

clean:
	rm  -f *.pdf
	rm -rf .latex
	mkdir -p .latex

%.pdf: %.tex
	mkdir -p .latex
	$(TEX) $(TEXOPTS) $<
	# this compresses the output pdf file
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ .latex/$@
	# cp .latex/$@ $@
