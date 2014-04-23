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
	rm -rf presentation-crypto20
	rm atbash-table.html
	rm table-verite-xor.html

carre-vigenere.svg: carre-vigenere.html
	wkhtmltoimage --width 650 carre-vigenere.html carre-vigenere.svg

640px-Skytale.png:
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Skytale.png/640px-Skytale.png

319px-FOSDEM_2008_Key_signing_party.jpg:
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/FOSDEM_2008_Key_signing_party.jpg/319px-FOSDEM_2008_Key_signing_party.jpg 

509px-Enigma_machine4.jpg:
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Enigma_machine4.jpg/509px-Enigma_machine4.jpg

633px-Enigma-action.svg.png:
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Enigma-action.svg/633px-Enigma-action.svg.png

atbash-table.html: atbash-table.rst
	rst2html atbash-table.rst atbash-table.html

atbash-table.svg: atbash-table.html
	wkhtmltoimage --width 640 atbash-table.html atbash-table.svg

table-verite-xor.html: table-verite-xor.rst
	rst2html table-verite-xor.rst table-verite-xor.html

table-verite-xor.svg: table-verite-xor.html
	wkhtmltoimage --width 350 table-verite-xor.html table-verite-xor.svg

message-xor.html: message-xor.rst
	rst2html message-xor.rst message-xor.html

message-xor.svg: message-xor.html
	wkhtmltoimage --width 700 message-xor.html message-xor.svg

images: carre-vigenere.svg 640px-Skytale.png 319px-FOSDEM_2008_Key_signing_party.jpg 509px-Enigma_machine4.jpg 633px-Enigma-action.svg.png atbash-table.svg table-verite-xor.svg message-xor.svg

livre-comedie-humaine.txt:
	wget http://www.gutenberg.org/ebooks/41211.txt.utf-8 -O livre-comedie-humaine.txt

livre-histoires-extraordinaires.txt:
	wget http://www.gutenberg.org/files/20761/20761-0.txt -O livre-histoires-extraordinaires.txt

livres: livre-comedie-humaine.txt livre-histoires-extraordinaires.txt

analyse.png: livres
	python freqhisto.py

view: ${ECRIT}.pdf
	evince ${ECRIT}.pdf

fonts:
	./getfonts.sh

presentation: presentation.css
	hovercraft -c presentation.css crypto20.rst presentation-crypto20

presentation-light: presentation-light.css
	hovercraft -c presentation-light.css crypto20.rst presentation-crypto20

all: clean images analyse.png ${ECRIT}.pdf presentation view
