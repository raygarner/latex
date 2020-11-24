DOC=article.tex
NAME=article

all: build

build: clean wc
	pdflatex $(DOC)
	biber $(NAME)
	pdflatex $(DOC)
	makeglossaries $(NAME)
	pdflatex $(DOC)
	pdflatex $(DOC)
	make clean

open: build
	zathura $(NAME).pdf

clean:
	rm -f *.log *.aux *.toc *.bcf *.blg *.bbl *.xml *.out *.acn *.acr *.alg *.glg *.glo *.gls *.glsdefs *.ist
wc:
	texcount $(DOC) > wc.txt
	wc -w src/* >> wc.txt
