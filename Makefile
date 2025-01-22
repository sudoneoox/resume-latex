# Variables
LATEX = pdflatex
FILE = resume
VIEWER = xdg-open

# target 
all: generate clean-aux

# generate pdf
generate: $(FILE).tex
	$(LATEX) -interaction=nonstopmode $(FILE).tex

clean-aux:
	-rm -f *.aux *.log *.out *.synctex.gz
	-rm -f *.fls *.fdb_latexmk *.rubbercache
	-rm -f *.toc *.lof *.lot *.bbl *.blg


# clean aux and pdf file
clean: clean-aux
	-rm -f $(FILE).pdf

# view pdf
view: generate
	$(VIEWER) $(FILE).pdf || true 

# force build
force: generate clean

.PHONY: all clean view force generate
