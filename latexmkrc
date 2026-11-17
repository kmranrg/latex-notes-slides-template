# latexmk settings (also read by Overleaf)
# Compile with XeLaTeX: the template needs fontspec / unicode-math.
$pdf_mode = 5;
$xelatex  = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

# Running plain `latexmk` builds all of these.
@default_files = ('note.tex', 'main.tex', 'slides.tex', 'guide.tex');

# Extra files to remove with `latexmk -c`
$clean_ext = 'listing nav snm vrb synctex.gz';
