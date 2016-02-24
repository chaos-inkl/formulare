pdflatex=pdflatex
bibtex=bibtex

SRC=$(wildcard *.tex) 
SRC_ADDITIONAL=
BIB=
AUX=$(SRC:.tex=.aux)
PDF=$(SRC:.tex=.pdf)

default: all

all: pdf
	echo $(SRC)
	echo $(PDF)

pdf: $(PDF)

%.pdf: %.tex $(SRC_ADDITIONAL) $(BIB)
	-rm -f $(AUX)
	$(pdflatex) $<
#	$(bibtex) $(AUX)
	$(pdflatex) $<
#	$(pdflatex) $<

view: pdf
	xdg-open $(PDF)

clean:
	-rm -f *~
	-rm -f *.toc
	-rm -f $(AUX)
	-rm -f *.log
	-rm -f *.bbl
	-rm -f $(PDF)
	-rm -f *.out
	-rm -f *.blg

.PHONY: default all clean

