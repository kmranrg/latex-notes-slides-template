# LaTeX Notes & Slides Template

A clean, modern LaTeX template for **lecture notes**, **books of notes** and **Beamer slides**, all sharing one style.

It uses the IBM Plex Mono typeface and includes colored theorem boxes, Obsidian-style callouts, syntax-highlighted code, striped tables and plots. Anything you write for your notes can be pasted into a slide without changes.

| Notes | Slides | User guide |
|:---:|:---:|:---:|
| [example-notes.pdf](examples/example-notes.pdf) | [example-slides.pdf](examples/example-slides.pdf) | [guide.pdf](examples/guide.pdf) |

A book-style example (chapters and table of contents) is in [example-book.pdf](examples/example-book.pdf).

---

## Features

- **One look, three formats.** A single note (`article`), a book of notes (`book`) and a 16:9 talk (`beamer`).
- **Numbered boxes.** Definition, theorem, lemma, proposition, corollary, example, exercise and remark, with a title and a label for `\cref`. Proof and solution environments are included, and solutions can be hidden with one switch.
- **18 callouts** in the style of Obsidian (`note`, `tip`, `warning`, `danger`, `question`, …). You can define your own with one line.
- **Code.** Python blocks with highlighting and a file-name title, whole files included with `\pyfile`, terminal output, and any language supported by `listings`.
- **Tables and figures stay where you write them.** They are not floats. Tables get a header row and striped rows automatically.
- **Plots** with `pgfplots`, using the template's colors.
- **Cross-references** with `cleveref`: `\cref{thm:main}` prints *Theorem 2.1*, as a clickable link in notes.
- **Slides.** A navigation bar, title and closing slides, optional section slides, and compact boxes that fit more on each slide.
- **Customizable.** Change colors in the preamble. Options are `classicmath`, `sectionframes` and `nonavigation`.

## Quick start

### Overleaf

1. Open the template in the Overleaf gallery and click **Open as Template**.
   Or download this repository as a ZIP (**Code → Download ZIP**) and use **New Project → Upload Project** on Overleaf.
2. Open **Menu** (top left) and set **Compiler** to **XeLaTeX**.
3. In the same menu, set **Main document** to the file you want to build: `note.tex`, `main.tex`, `slides.tex` or `guide.tex`.
4. Click **Recompile**.

### Local (TeX Live / MacTeX / MiKTeX)

```sh
git clone https://github.com/kmranrg/latex-notes-slides.git
cd latex-notes-slides
latexmk note.tex        # build one document
latexmk                 # build note, main, slides and guide
latexmk -c              # remove auxiliary files
```

> **XeLaTeX (or LuaLaTeX) is required.** pdfLaTeX is not supported because the template loads its fonts with `fontspec`. Every main file starts with `% !TEX program = xelatex`, so VS Code (LaTeX Workshop), TeXShop and TeXstudio pick the correct engine automatically.

## Minimal examples

**A note**

```latex
% !TEX program = xelatex
\documentclass[11pt]{article}
\usepackage{mynotes}
\notesetup{Short Title}{Author Name}{https://example.com}  % header & footer

\begin{document}
\notetitle{Full Title of the Note}

\section{Introduction}
\begin{definition}[Title of the definition][def:key]
  A precise statement, with math: $f(x) = x^2$.
\end{definition}

\begin{tip}
  Refer back to it with \cref{def:key}.
\end{tip}
\end{document}
```

**Slides**

```latex
% !TEX program = xelatex
\documentclass[aspectratio=169, 9pt, t, notheorems]{beamer}
\usetheme{mynotes}
\title[Short title]{Full Title}
\author{Author Name}
\website{https://example.com}
\institute{Department Name, University Name}
\date{\today}

\begin{document}
\titleframe
\section{Introduction}
\begin{frame}{First slide}
  \begin{theorem}[Main result] ... \end{theorem}
\end{frame}
\closingframe
\end{document}
```

## Starting your own document

- **A note:** copy `note.tex`, change `\notesetup{…}` and `\notetitle{…}`, and replace the `\input{chapters/…}` lines with your own text.
- **A book:** copy `main.tex` and put one chapter per file in `chapters/` (each starting with `\chapter{…}`), then list them with `\include{…}`.
- **A talk:** copy `slides.tex`, change the title block, and replace the frames.

The files in `chapters/` and `code/` are sample content only; delete them once your own documents no longer use them.

## Repository structure

```
.
├── note.tex                 # single-topic note       → start here
├── main.tex                 # book of notes (chapters)
├── slides.tex               # Beamer talk
├── guide.tex                # full user guide (source + result for every feature)
├── mynotes.sty              # notes layout: page, headings, header & footer
├── beamerthememynotes.sty   # slides layout: Beamer theme
├── mynotes-core.sty         # shared: fonts, colors, boxes, callouts, code, tables
├── chapters/                # sample content (replace with your own)
│   ├── text.tex             #   text, lists, math
│   ├── boxes.tex            #   numbered boxes
│   ├── callouts.tex         #   callouts
│   ├── code.tex             #   code, tables, figures, algorithms
│   ├── chapter1.tex         #   chapter wrappers used by main.tex
│   └── chapter2.tex
├── code/example.py          # example source file shown with \pyfile
├── fonts/                   # IBM Plex Mono + Font Awesome (with licenses)
├── examples/                # pre-built PDFs of all four documents
├── latexmkrc                # build settings (XeLaTeX), also used by Overleaf
├── build-examples.sh        # rebuild the PDFs in examples/
├── LICENSE
└── README.md
```

The `fonts/` folder must stay next to your main `.tex` file.

## Documentation

The **[user guide](examples/guide.pdf)** covers every feature. Each feature is shown as LaTeX source followed by the rendered result. Topics:

text and lists · math and shortcuts · numbered boxes · callouts · tables · code · figures and plots · algorithms · cross-references · slides · options and colors · troubleshooting

### Cheat sheet

| What | How |
|---|---|
| Header / footer (notes) | `\notesetup{Short title}{Author}{URL}` |
| Title block (notes) | `\notetitle{Title}` |
| Box with title and label | `\begin{theorem}[Title][thm:key] … \end{theorem}` |
| Callout with custom title | `\begin{warning}[Careful] … \end{warning}` |
| New callout type | `\newcallout{idea}{co-orange}{F0EB}{Idea}` |
| Hide solutions | `\showsolutionsfalse` |
| Table | `\begin{datatable}[Caption][tab:key]{lcc} … \end{datatable}` |
| Full-width table | `\begin{widetable}[Caption][tab:key]{lLc} … \end{widetable}` |
| Figure | `\begin{notefigure}[Caption][fig:key] … \end{notefigure}` |
| Python | `\begin{python}[file.py] … \end{python}` · `\pyfile{code/file.py}` |
| Other language | `\begin{codeblock}{C++}[main.cpp] … \end{codeblock}` |
| Output | `\begin{terminal} … \end{terminal}` |
| Inline code | `\code{np.zeros(3)}` |
| Highlight | `\hl{important}` |
| Reference | `\cref{thm:key}` |
| Title / closing slide | `\titleframe` · `\closingframe` |
| Slide with code | `\begin{frame}[fragile]{Title}` |
| Change a color | `\definecolor{accent}{RGB}{120,40,140}` |

## Rebuilding the example PDFs

```sh
./build-examples.sh
```

This compiles all four documents with `latexmk`, moves the PDFs to `examples/` and removes the auxiliary files.

## License

- Template code (`.sty`, `.tex`, scripts): [MIT](LICENSE)
- IBM Plex Mono: [SIL Open Font License 1.1](fonts/OFL-IBMPlexMono.txt)
- Font Awesome Free fonts: [SIL Open Font License 1.1](fonts/LICENSE-FontAwesome.txt)

## Contributing

Issues and pull requests are welcome. If you report a bug, please include a minimal `.tex` file that reproduces it and the relevant part of the `.log` file.
