ECRIT = travail-crypto

${ECRIT}.pdf: ${ECRIT}.rst
	rst2latex --tab-width=4 ${ECRIT}.rst ${ECRIT}.tex
	pdflatex ${ECRIT}.tex
	rm ${ECRIT}.out ${ECRIT}.aux ${ECRIT}.log ${ECRIT}.tex

pandoc: ${ECRIT}.rst
	pandoc -o ${ECRIT}.pdf -f rst --reference-links -S --toc -V geometry:a4paper -V geometry:"top=1.5cm, bottom=1.5cm, left=1cm, right=1cm" -V mainfont="Times New Roman" -V fontsize=12pt ${ECRIT}.rst

docx: ${ECRIT}.rst
	pandoc -V fontsize=12pt -S -f rst ${ECRIT}.rst -o ${ECRIT}.docx

odt: ${ECRIT}.rst
	pandoc -V fontsize=12pt -S -f rst ${ECRIT}.rst -o ${ECRIT}.odt

clean:
	rm ${ECRIT}.pdf

images:
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Skytale.png/640px-Skytale.png

view: ${ECRIT}.pdf
	evince ${ECRIT}.pdf

all: clean images ${ECRIT}.pdf view
