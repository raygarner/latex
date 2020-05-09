DOC=article.tex
NAME=article

all: build clean

build: wc
	pdflatex $(DOC)
	bibier $(NAME)
	pdflatex $(DOC)
	pdflatex $(DOC)

clean:
	rm -f *.log *.aux *.toc *.bcf *.blg *.bbl *.xml


wc:
	texcount $(DOC) > wc.txt
	wc -w src/* >> wc.txt
