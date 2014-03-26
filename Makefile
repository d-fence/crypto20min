ECRIT = travail-crypto

${ECRIT}.pdf: ${ECRIT}.rst
	pandoc -o ${ECRIT}.pdf -f rst -S --toc -V geometry:a4paper -V geometry:"top=1.5cm, bottom=1.5cm, left=1cm, right=1cm" -V mainfont="Times New Roman" -V fontsize=12pt ${ECRIT}.rst
