#!/usr/bin/env sh
# Build the example PDFs shown in README.md and move them to examples/.
# Requires a TeX distribution with XeLaTeX and latexmk.
set -e
cd "$(dirname "$0")"
latexmk note.tex main.tex slides.tex guide.tex
mkdir -p examples
mv note.pdf   examples/example-notes.pdf
mv main.pdf   examples/example-book.pdf
mv slides.pdf examples/example-slides.pdf
mv guide.pdf  examples/guide.pdf
latexmk -c
echo "Done: PDFs are in examples/"
