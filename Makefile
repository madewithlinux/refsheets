TEX     := pdflatex
# TEX     := xelatex
# shell escape is needed for minted latex package
TEXOPTS := --halt-on-error -shell-escape
TEX_SOURCES := $(wildcard *.tex)
MD_SOURCES := $(wildcard *.md)
OUTPUTS := \
	$(TEX_SOURCES:%.tex=%.pdf) \
	$(MD_SOURCES:%.md=%.md.pdf)\
	$(MD_SOURCES:%.md=%.md.html)

all: $(OUTPUTS) 

clean:
	rm  -f *.pdf
	rm -rf .latex
	mkdir -p .latex

%.pdf: %.tex
	mkdir -p .latex
	# cp into folder so all the latex garbage goes there
	# on some systems, we must build in the same folder as the
	# .tex document for minted to work
	cp $< .latex/
	cd .latex/ && $(TEX) $(TEXOPTS) $<
	# this compresses the output pdf file
	gs -sDEVICE=pdfwrite \
		-dCompatibilityLevel=1.4 \
		-dNOPAUSE \
		-dQUIET \
		-dBATCH \
		-sOutputFile=$@ .latex/$@
	# cp .latex/$@ $@

%.md.pdf: %.md
	pandoc $< -o $@

%.md.html: %.md pandoc.css
	pandoc -s --self-contained $< --css pandoc.css -o $@


csce314_reference_sheet.pdf: csce314_reference_sheet.tex
	# special case to use xelatex for custom fonts
	mkdir -p .latex
	cp $< .latex/
	cd .latex/ && xelatex $(TEXOPTS) $<
	# cd .latex/ && pdflatex $(TEXOPTS) $<
	gs -sDEVICE=pdfwrite \
		-dCompatibilityLevel=1.4 \
		-dNOPAUSE \
		-dQUIET \
		-dBATCH \
		-sOutputFile=$@ .latex/$@
