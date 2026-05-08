# FoilX

`foilx` is a minimal FoilTeX-inspired LaTeX slide class. It is built on
the standard `article` class and provides a small slide-deck API with
landscape letter pages, large sans-serif typography, section and foil title
pages, appendix numbering, and a bibliography helper.

## Installation

For local use, place `foilx/foilx.cls` where LaTeX can find it. The simplest
project layout is:

```text
my-talk/
  talk.tex
  foilx.cls
```

Then use the class from `talk.tex`:

```latex
\documentclass{foilx}
```

For repeated use, install `foilx.cls` into a directory searched by your TeX
distribution, such as a local `texmf` tree.

## Quick Start

```latex
\documentclass{foilx}

\title{A Short Talk}
\author{Firstname Lastname}
\date{\today}
\info{Example Slides}

\begin{document}
\maketitle

\makesection{First section}
\begin{itemize}
  \item First topic
  \item Second topic
\end{itemize}

\makefoil{A first foil}
\begin{itemize}
  \item FoilX uses large slide-friendly type.
  \item Each foil starts on a new landscape page.
  \item Footers show the current section and page number.
\end{itemize}

\makefoil{A second foil}
\[
  E = mc^2
\]

\makeappendix

\makefoil{Backup material}
Appendix foils are numbered A1, A2, and so on.
\end{document}
```

Compile with your usual LaTeX engine, for example:

```sh
pdflatex talk.tex
```

## Class Options

`lecture`
: Reset page numbering at each section and print foil numbers as
  `section--page`, for example `2--3`. When `hyperref` is loaded, FoilX also
  disables duplicate hyperref page anchors for lecture-style numbering.

## Public Commands

`\info{<text>}`
: Set small metadata text printed on section title pages.

`\maketitle`
: Make the deck title page from `\title`, `\author`, and `\date`.

`\makesection{<title>}`
: Start a new numbered section. In `lecture` mode, the page counter is reset
  to `1` for the section.

`\makefoil{<title>}`
: Start a new foil with a centered title. The footer uses the current section
  title and the current page number.

`\makeappendix`
: Start the appendix and switch subsequent foil numbering to `A1`, `A2`, and
  so on.

`\makereference[<size>]{<bib-file>}`
: Start an unnumbered bibliography page using the `alpha` bibliography style.
  The optional size defaults to `\small`.

`\vf`
: Insert stretchable vertical space with `\vspace*{\fill}`.

## Manual

A practical LaTeX manual is available at `doc/foilx.tex`. Compile it with:

```sh
pdflatex doc/foilx.tex
```

## Example

A sample deck adapted from the classic FoilTeX sample topics is available at
`examples/foilx-sample.tex`. Compile it from
the repository root with:

```sh
TEXINPUTS=foilx: pdflatex -output-directory examples examples/foilx-sample.tex
```

## License

FoilX is licensed under the Apache License 2.0. See [LICENSE](./LICENSE).
