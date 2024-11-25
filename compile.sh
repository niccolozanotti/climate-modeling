#!/bin/bash

# Name of the main LaTeX file (without .tex extension)
MAIN_FILE="main"
OUTPUT_PDF="notes.pdf"


# Clean up old auxiliary and output files
echo "Cleaning up old auxiliary files..."
rm -f ${MAIN_FILE}.{aux,bbl,bcf,blg,log,lot,out,toc,run.xml,synctex.gz,fls,fdb_latexmk}

# Compile LaTeX document (first pass)
echo "Running pdflatex (first pass)..."
pdflatex -interaction=nonstopmode ${MAIN_FILE}.tex

# Run biber for bibliography management
if [ -f "${MAIN_FILE}.bcf" ]; then
    echo "Running biber..."
    biber ${MAIN_FILE}
else
    echo "Biber backend not found, skipping bibliography step."
    exit 1
fi

# Compile LaTeX document (second pass)
echo "Running pdflatex (second pass)..."
pdflatex -interaction=nonstopmode ${MAIN_FILE}.tex

# Compile LaTeX document (third pass for references)
echo "Running pdflatex (third pass)..."
pdflatex -interaction=nonstopmode ${MAIN_FILE}.tex

# Rename the output PDF
if [ -f "${MAIN_FILE}.pdf" ]; then
    echo "Renaming output PDF to ${OUTPUT_PDF}..."
    mv ${MAIN_FILE}.pdf ${OUTPUT_PDF}
    echo "Compilation completed successfully! Output PDF: ${OUTPUT_PDF}"
else
    echo "Compilation failed: Output PDF not found."
    exit 1
fi
echo "Cleaning up"

# Clean up old auxiliary and output files
echo "Cleaning up old auxiliary files..."
rm -f ${MAIN_FILE}.{aux,bbl,bcf,blg,log,lot,out,toc,run.xml,synctex.gz}
