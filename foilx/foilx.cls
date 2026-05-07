\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{foilx}[2026/05/06 Minimal slide class]

\newif\iffoilx@lecture
\newif\iffoilx@appendix
\DeclareOption{lecture}{\foilx@lecturetrue}
\ProcessOptions\relax

\RequirePackage{fix-cm}
\LoadClass{article}

\RequirePackage{enumitem}
\RequirePackage{graphicx}

% Page layout: FoilTeX landscape letter defaults used by this template.
\setlength{\paperwidth}{11in}
\setlength{\paperheight}{8.5in}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}
\setlength{\topmargin}{-1.5cm}
\setlength{\headheight}{15pt}
\setlength{\headsep}{14pt}
\setlength{\footskip}{1in}
\addtolength{\footskip}{-\headsep}
\addtolength{\footskip}{-\headheight}
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-2in}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-3in}
\addtolength{\textheight}{3cm}
\setlength{\pdfpagewidth}{\paperwidth}
\setlength{\pdfpageheight}{\paperheight}
\AtBeginDocument{%
  \vsize\textheight
  \hsize\textwidth
  \linewidth\textwidth
  \columnwidth\textwidth
  \@colroom\textheight
  \@colht\textheight}

% FoilTeX font-size names and scaled Computer Modern families.
\newcommand{\foilx@xxxpt}{29.86}
\newcommand{\foilx@xxxvipt}{35.83}
\newcommand{\foilx@xliiipt}{43}
\newcommand{\foilx@lipt}{51.60}
\newcommand{\foilx@xii@ipt}{12.1}
\newcommand{\foilx@xiv@vpt}{14.5}
\newcommand{\foilx@xvii@iiipt}{17.38}
\newcommand{\foilx@textsizerange}{%
  <12><14.4><17.28><20.74><24.88><29.86><35.83><43.00><51.60>}
\newcommand{\foilx@smallmathrange}{<12.1><14.5><17.38>}
\newcommand{\foilx@largemathrange}{<20.74><24.88><29.86><35.83><43.00><51.60>}

\newcommand{\foilx@family}[5]{%
  \DeclareFontShape{#1}{#2}{#3}{#4}
    {\foilx@textsizerange #5}{}}
\newcommand{\foilx@oddfamily}[6]{%
  \DeclareFontShape{#1}{#2}{#3}{#4}
    {\foilx@smallmathrange #5
     \foilx@textsizerange #6}{}}
\newcommand{\foilx@mathfamily}[6]{%
  \DeclareFontShape{#1}{#2}{#3}{#4}
    {\foilx@smallmathrange #5
     \foilx@largemathrange #6}{}}
\newcommand{\foilx@subfamily}[5]{%
  \DeclareFontShape{#1}{#2}{#3}{#4}{<->ssub * #5}{}}

\DeclareFontFamily{OT1}{fcmr}{}
\foilx@oddfamily{OT1}{fcmr}{m}{n}{cmr7}{cmr10}
\foilx@family{OT1}{fcmr}{m}{it}{cmti10}
\foilx@family{OT1}{fcmr}{m}{sc}{cmcsc10}
\foilx@family{OT1}{fcmr}{bx}{n}{cmbx10}
\foilx@family{OT1}{fcmr}{bx}{sl}{cmbxsl10}
\foilx@subfamily{OT1}{fcmr}{b}{n}{fcmr/bx/n}
\foilx@subfamily{OT1}{fcmr}{m}{sl}{fcmss/m/sl}
\foilx@subfamily{OT1}{fcmr}{bx}{it}{fcmr/bx/sl}
\DeclareFontFamily{OT1}{fcmss}{\fontdimen3\font=1.7\fontdimen3\font}
\foilx@family{OT1}{fcmss}{m}{n}{cmss10}
\foilx@family{OT1}{fcmss}{m}{sl}{cmssi10}
\foilx@family{OT1}{fcmss}{b}{n}{cmssbx10}
\foilx@family{OT1}{fcmss}{bx}{n}{cmssbx10}
\foilx@subfamily{OT1}{fcmss}{m}{it}{fcmr/m/it}
\foilx@family{OT1}{fcmss}{m}{sc}{cmcsc10}
\foilx@subfamily{OT1}{fcmss}{b}{n}{fcmss/bx/n}
\foilx@subfamily{OT1}{fcmss}{bx}{it}{fcmr/bx/it}
\DeclareFontFamily{OT1}{fcmtt}{\hyphenchar\font\m@ne}
\foilx@family{OT1}{fcmtt}{m}{n}{cmtt10}
\foilx@subfamily{OT1}{fcmtt}{bx}{n}{fcmtt/m/n}
\DeclareFontFamily{OML}{fcmm}{\skewchar\font'177}
\foilx@mathfamily{OML}{fcmm}{m}{it}{cmmi7}{cmmi10}
\foilx@mathfamily{OML}{fcmm}{b}{it}{cmmib7}{cmmib10}
\foilx@subfamily{OML}{fcmm}{bx}{it}{fcmm/b/it}
\DeclareFontFamily{OMS}{fcmsy}{\skewchar\font'60}
\foilx@mathfamily{OMS}{fcmsy}{m}{n}{cmsy7}{cmsy10}
\foilx@mathfamily{OMS}{fcmsy}{b}{n}{cmbsy7}{cmbsy10}
\foilx@subfamily{OMS}{fcmsy}{bx}{n}{fcmsy/b/n}
\DeclareFontFamily{OMX}{fcmex}{}{}
\foilx@mathfamily{OMX}{fcmex}{m}{n}{cmex7}{cmex10}

\def\rmdefault{fcmr}
\def\sfdefault{fcmss}
\def\ttdefault{fcmtt}
\def\bfdefault{bx}
\SetSymbolFont{operators}{normal}{OT1}{fcmr}{m}{n}
\SetSymbolFont{letters}{normal}{OML}{fcmm}{m}{it}
\SetSymbolFont{symbols}{normal}{OMS}{fcmsy}{m}{n}
\SetSymbolFont{largesymbols}{normal}{OMX}{fcmex}{m}{n}
\SetSymbolFont{operators}{bold}{OT1}{fcmr}{bx}{n}
\SetSymbolFont{letters}{bold}{OML}{fcmm}{b}{it}
\SetSymbolFont{symbols}{bold}{OMS}{fcmsy}{b}{n}
\SetSymbolFont{largesymbols}{bold}{OMX}{fcmex}{m}{n}
\DeclareMathAlphabet{\mathrm}{OT1}{fcmr}{m}{n}
\DeclareMathAlphabet{\mathbf}{OT1}{fcmr}{bx}{n}
\DeclareMathAlphabet{\mathsf}{OT1}{fcmss}{m}{n}
\DeclareMathAlphabet{\mathit}{OT1}{fcmr}{m}{it}
\DeclareMathAlphabet{\mathtt}{OT1}{fcmtt}{m}{n}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand\em{\@nomath\em
  \ifdim\fontdimen\@ne\font>\z@\upshape\else\slshape\fi}
\DeclareRobustCommand*\cal{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*\mit{\@fontswitch{\relax}{\mathnormal}}

% FoilTeX 20pt text sizes, display skips, and list defaults.
\DeclareMathSizes{\@xiipt}{\foilx@xii@ipt}{\foilx@xii@ipt}{\foilx@xii@ipt}
\DeclareMathSizes{\@xivpt}{\foilx@xiv@vpt}{\foilx@xii@ipt}{\foilx@xii@ipt}
\DeclareMathSizes{\@xviipt}{\foilx@xvii@iiipt}{\foilx@xii@ipt}{\foilx@xii@ipt}
\DeclareMathSizes{\@xxpt}{\@xxpt}{\foilx@xiv@vpt}{\foilx@xii@ipt}
\DeclareMathSizes{\@xxvpt}{\@xxvpt}{\foilx@xvii@iiipt}{\foilx@xiv@vpt}
\DeclareMathSizes{\foilx@xxxpt}{\foilx@xxxpt}{\@xxpt}{\foilx@xvii@iiipt}
\DeclareMathSizes{\foilx@xxxvipt}{\foilx@xxxvipt}{\@xxvpt}{\@xxpt}
\DeclareMathSizes{\foilx@xliiipt}{\foilx@xliiipt}{\foilx@xxxpt}{\@xxvpt}
\DeclareMathSizes{\foilx@lipt}{\foilx@lipt}{\foilx@xxxvipt}{\foilx@xxxpt}

\setlength\partopsep{2pt plus 1pt minus 1pt}
\newcommand\@listIa{\leftmargin\leftmargini
  \topsep 14pt plus 2pt minus 4pt
  \parsep 14pt plus 4pt minus 4pt
  \itemsep 14pt plus 4pt minus 2pt}
\newcommand\@listIb{\leftmargin\leftmargini
  \topsep 8pt plus 2pt minus 2pt
  \parsep 2pt plus 1pt minus 1pt
  \itemsep \parsep}
\newcommand\@listIc{\leftmargin\leftmargini
  \topsep 6pt plus 1pt minus 1pt
  \parsep 2pt plus 1pt minus 1pt
  \itemsep \parsep}
\newcommand\@listId{\leftmargin\leftmargini
  \topsep 4pt plus 1pt minus 1pt
  \parsep 2pt plus 1pt minus 1pt
  \itemsep \parsep}
\renewcommand\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii\advance\labelwidth-\labelsep
  \topsep\z@
  \parsep\z@
  \itemsep\parsep}
\renewcommand\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
  \partopsep 1pt plus 0pt minus 1pt
  \topsep\z@
  \parsep\z@
  \itemsep\topsep}
\renewcommand\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}
\renewcommand\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv\advance\labelwidth-\labelsep}
\renewcommand\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}

\renewcommand{\familydefault}{\sfdefault}
\DeclareFontShape{OT1}{cmss}{m}{it}{<->ssub*cmss/m/sl}{}
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@xxpt\@xxvpt
  \abovedisplayskip 30pt plus 3pt minus 9pt%
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 0pt plus 3pt%
  \belowdisplayshortskip 7pt plus 3pt minus 4pt%
  \let\@listi\@listIa}
\renewcommand{\small}{%
  \@setfontsize\small\@xviipt{22}%
  \abovedisplayskip 20pt plus 3pt minus 4pt%
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 0pt plus 2pt%
  \belowdisplayshortskip 4pt plus 2pt minus 2pt%
  \let\@listi\@listIb}
\renewcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@xivpt{18}%
  \abovedisplayskip 16pt plus 2pt minus 4pt%
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip 0pt plus 1pt%
  \belowdisplayshortskip 3pt plus 1pt minus 2pt%
  \let\@listi\@listIc}
\renewcommand{\scriptsize}{%
  \@setfontsize\scriptsize\@xiipt{15}%
  \let\@listi\@listId}
\let\tiny\scriptsize
\renewcommand{\large}{\@setfontsize\large\@xxvpt{32}}
\renewcommand{\Large}{\@setfontsize\Large\foilx@xxxpt{38}}
\renewcommand{\LARGE}{\@setfontsize\LARGE\foilx@xxxvipt{45}}
\renewcommand{\huge}{\@setfontsize\huge\foilx@xliiipt{54}}
\renewcommand{\Huge}{\@setfontsize\Huge\foilx@lipt{62}}
\normalsize
\raggedright
\sloppy
\setlength{\parindent}{0pt}
\setlength{\parskip}{18pt plus 4pt minus 4pt}
\setlength{\jot}{10pt}
\setlength{\parsep}{0pt}
\setlength{\itemsep}{0pt}
\setlength{\labelsep}{10pt}
\setlength{\arraycolsep}{10pt}
\setlength{\tabcolsep}{12pt}
\setlength{\arrayrulewidth}{1pt}
\setlength{\doublerulesep}{3pt}
\setlength{\tabbingsep}{\labelsep}
\setlength{\fboxsep}{10pt}
\setlength{\fboxrule}{1pt}
\setlist{labelsep=10pt, topsep=0pt, partopsep=0pt, itemsep=0pt}
\setlist[1]{leftmargin=25pt, labelwidth=15pt, parsep=14pt plus 4pt minus 4pt}
\setlist[2]{leftmargin=22pt, parsep=0pt}
\setlength{\topsep}{0pt}
\renewcommand{\labelitemi}{$\m@th\bullet$}
\renewcommand{\labelitemii}{{\normalfont\bfseries --}}
\renewcommand{\labelitemiii}{$\m@th\ast$}
\renewcommand{\labelitemiv}{$\m@th\cdot$}
\renewcommand{\descriptionlabel}[1]{\hspace\labelsep\normalfont\bfseries #1}
\renewenvironment{description}{%
  \list{}{\labelwidth\z@\itemindent-\leftmargin
  \let\makelabel\descriptionlabel}}{\endlist}
\renewenvironment{verse}{%
  \let\\=\@centercr
  \list{}{\itemsep\z@\itemindent -1.5em\listparindent\itemindent
  \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}{\endlist}
\renewenvironment{quotation}{%
  \list{}{\listparindent 1.5em\itemindent\listparindent
  \rightmargin\leftmargin\parsep 0pt plus 1pt}\item[]}{\endlist}
\renewenvironment{quote}{%
  \list{}{\rightmargin\leftmargin}\item[]}{\endlist}
\renewcommand{\arraystretch}{1.2}

% Template commands.
\newcommand{\vf}{\vspace*{\fill}}
\newlength{\foilheadskip}
\setlength{\foilheadskip}{-\baselineskip}

\newcommand{\insertinfo}{}
\newcommand{\info}[1]{\renewcommand{\insertinfo}{#1}}

\newcommand{\insertsection}{}
\newcommand{\foilxsectiontitle}{}
\newcounter{foilxsection}
\newcounter{foilxappendixpage}
\newcommand{\foilxfooterlabel}{%
  \iffoilx@appendix\else
    \insertsection
  \fi}
\newcommand{\foilxpagenumber}{%
  \iffoilx@appendix
    A\arabic{foilxappendixpage}%
  \else\iffoilx@lecture
    \arabic{foilxsection}--\thepage
  \else
    \thepage
  \fi\fi}
\newcommand{\foilx@stepappendixpage}{%
  \iffoilx@appendix\stepcounter{foilxappendixpage}\fi}

\newcommand{\ps@foilx}{%
  \renewcommand{\@oddhead}{\hfil}%
  \renewcommand{\@evenhead}{\@oddhead}%
  \renewcommand{\@oddfoot}{%
    \ifnum\value{page}>0
      \tiny\foilxfooterlabel\hfil\foilxpagenumber
    \else
      \hfil
    \fi}%
  \renewcommand{\@evenfoot}{\@oddfoot}%
}
\pagestyle{foilx}
\AtBeginDocument{%
  \iffoilx@lecture
    \@ifpackageloaded{hyperref}{%
      \hypersetup{hypertexnames=false}%
    }{}%
  \fi}

\renewcommand{\today}{%
  \ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

\newlength{\abovetitleskip}
\newlength{\titleauthorskip}
\newlength{\authorauthorskip}
\newlength{\authordateskip}
\setlength{\abovetitleskip}{41.48pt}
\addtolength{\abovetitleskip}{1.5cm}
\setlength{\titleauthorskip}{31.11pt}
\setlength{\authorauthorskip}{1cm}
\setlength{\authordateskip}{2cm}

\newcommand{\foilx@zerolistvertdimens}{%
  \parskip0pt\topsep0pt\partopsep0pt\parsep0pt\itemsep0pt}

\renewcommand{\maketitle}{%
  \begingroup
    \setcounter{page}{0}%
    \renewcommand{\insertsection}{}%
    \thispagestyle{foilx}%
    \foilx@zerolistvertdimens
    \advance\abovetitleskip-\baselineskip
    \null\vskip\abovetitleskip
    \begin{center}
      {\Large\bfseries\@title\par}%
      \vskip\titleauthorskip
      {\lineskip\authorauthorskip
        \begin{tabular}[t]{c}\@author\end{tabular}\par}%
      \vskip\authordateskip
      {\@date}%
    \end{center}
    \par\vfil\newpage
  \endgroup
  \setcounter{footnote}{0}%
}

\newcommand{\makesection}[1]{%
  \clearpage
  \refstepcounter{foilxsection}%
  \iffoilx@lecture\setcounter{page}{1}\fi
  \foilx@stepappendixpage
  \renewcommand{\insertsection}{}%
  \renewcommand{\foilxsectiontitle}{#1}%
  \thispagestyle{foilx}%
  \begin{flushright}\tiny\insertinfo\end{flushright}%
  \begin{center}\Large\bfseries\arabic{foilxsection}.\ #1\end{center}%
}

\newcommand{\makefoil}[1]{%
  \clearpage
  \foilx@stepappendixpage
  \renewcommand{\insertsection}{\foilxsectiontitle}%
  \thispagestyle{foilx}%
  {\large\bfseries\centering #1\par\null}%
  \vspace{\foilheadskip}%
}

\newcommand{\makeappendix}{%
  \clearpage
  \foilx@appendixtrue
  \setcounter{foilxappendixpage}{0}%
  \setcounter{page}{1}%
  \renewcommand{\insertsection}{Appendix}%
  \renewcommand{\foilxsectiontitle}{Appendix}%
  \thispagestyle{empty}%
  \null\vfil
  \begin{center}\Large\bfseries Appendix\end{center}%
  \vfil\newpage}

\bibliographystyle{alpha}
\newcommand{\makereference}[2][\small]{%
  \clearpage
  \pagestyle{empty}%
  \thispagestyle{empty}%
  \begingroup
    #1%
    \bibliography{#2}%
  \endgroup
}
\renewenvironment{thebibliography}[1]{%
  \vskip 3.5ex plus -1ex minus -.2ex
  \noindent{\large\bfseries\refname}%
  \vskip 2.3ex plus .2ex
  \list{\@biblabel{\arabic{enumiv}}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
     \leftmargin\labelwidth
     \advance\leftmargin\labelsep
     \usecounter{enumiv}%
     \let\p@enumiv\@empty
     \renewcommand\theenumiv{\arabic{enumiv}}}%
  \renewcommand\newblock{\hskip .11em plus .33em minus .07em}%
  \sloppy\clubpenalty4000\widowpenalty4000%
  \sfcode`\.=\@m\relax
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}
