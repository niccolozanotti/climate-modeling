#!/bin/bash

# Name of the main LaTeX file (without .tex extension)
MAIN_FILE="main"

# Clean up old auxiliary and output files
echo "Cleaning up old auxiliary files..."
rm -f ${MAIN_FILE}.{aux,bbl,bcf,blg,log,lot,out,toc,run.xml,synctex.gz}
