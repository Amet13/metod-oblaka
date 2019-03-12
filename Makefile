all: build run

build:
	latexmk -pdf -synctex=1 -jobname=metod-oblaka main.tex

run:
	# Я использую xreader для просмотра PDF
	xreader metod-oblaka.pdf &

clean:
	# Чистим временные файлы
	rm *.aux \
	*.fdb_latexmk \
	*.fls \
	*.log \
	*.out \
	*.synctex.gz \
	*.toc

docker:
	docker build -t docker-latex .
	docker run --rm -ti -v ${PWD}:/metod-oblaka:Z docker-latex bash -c "make build && make clean"
