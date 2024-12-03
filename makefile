#!/usr/bin/make -f
default:
		./compile.sh
pdf:
		./compile.sh
		open notes.pdf -a skim
format:
		latexindent -w main.tex \
        latexindent -w chapters/*.tex
clean:
	    ./cleanup.sh
