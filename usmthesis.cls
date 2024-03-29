%%
%% usmthesis.cls 2007/11/15 version V1.2
%% 
%% NOTE: This text file uses UNIX line feed conventions. When (human)
%% reading this file on other platforms, you may have to use a text
%% editor that can handle lines terminated by the UNIX line feed
%% character (0x0A).
%% 
%% 
%% This is the unofficial USM thesis LaTeX class for postgraduate research
%% students of Universiti Sains Malaysia, Penang, Malaysia, formatted
%% according to the Guide to the Preparation, Submission and Examination
%% of Theses, published by IPS USM.  It supercedes usmthesis.sty: much of
%% the code is essentially the same, although usmthesis is now a class
%% extending from the book class instead of a style.  usmthesis also provides
%% some class options for font choice for body text and url, as well as 
%% boxed (or not) figures.
%% 
%% 
%% The latest version and documentation of usmthesis can be obtained at...
%% err... we'll see how to go about this in the long term.  For the moment,
%% contact liantze AT cs DOT usm DOT my if you have any questions or
%% assistance or feedback.  Apologies if I can't respond immediately, but
%% I'll always try.
%%
%%
%% Copyright (c) 2005-2009 by Lim Lian Tze
%%
%% Current maintainer: Lim Lian Tze (liantze@gmail.com)
%
%  BRIEF CHANGELOG
%  ===============
%  v1.2 Nov 15 2007
%     - New thesis format in force as of 16 November 2007!
%     - There is now no times, helvet or cm options. Body font is now 
%       Times Roman for serif type, Helvetica for sans serif type, and
%       TX Typewriter for typewriter font.
%     - Bottom page margin increased to 4.0cm.
%     - Page number now placed 1.0cm from botom edge of paper.
%     - All text on title page are now in bold.
%     - Title of bibliography/references is now "REFERENCES".
%     - Introduced new "plate" float and "List of Plates".
%     - List of Publications is now moved to *after* appendices.
%     - Re-formatting of the table of contents:
%       * all text are unformatted (chapter headings are neither in bold nor
%         using larger font size
%       * dotted leader between titles and page number
%       * larger separation between (sub)section numbers and titles to resemble
%         the sample in the guidelines more closely
%     - Fixed bug in definition of \chapter to honour short title in 
%       \chapter[short title]{full title}
%
%  v1.1 May 20 2007
%     - re-definition of \chapter, therefore eliminating the need for \mychapter.
%       Various GUI LaTeX editors will now recognise the chapter divisions.
%     - added \RequirePackage[T1]{fontenc}.
%     - updated quickstart.tex: removed note about \mychapter.
%
%  v1.0 June 1 2006
%     - usmthesis is now provided as a document class (usmthesis.cls).
%     - introduced class options for:
%         * body font scheme (on suggestion by Dr Dhanesh)
%         * style of URLs
%         * whether figures are framed by default (on feedback from Anusha and
%           Seng Soon).
%     - updated usmthesis.tex to describe how to do common tasks in LaTeX
%     - new quickstart.tex to describe how to use usmthesis.cls and accompanying
%       template files.
%
%  v0.1 Nov 29 2005
%     - first stab at usmthesis as a package (usmthesis.sty).
%
%
% Available class options 
% (e.g., \documentclass[urlsf,boxfig,txtt]{usmthesis} 
% 
%             *** choose only one from each category ***
%
% urlrm, urlsf, urltt
%   determines the font family to be used for typesetting URLs -- You may
%   want to select one that shows up URLs clearly with respect to the main
%   thesis font that you chose.  urlrm will cause URLs to be typeset with a
%   serif font (CM Roman or Times Roman); urlsf with a sans serif
%   font (CM Serif or Helvetica); and urltt with a typewriter font (CM
%   Typewriter or Courier).
%   The default is urltt.
%
% boxfig, noboxfig
%   determines if figures will have a visible bounding box.
%
%   The default is noboxfig.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usmthesis}[2007/05/20 LaTeX2e class for USM Thesis]

% switches for URL font
\newif\if@urltt
\newif\if@urlsf
\newif\if@urlrm

% switch for border around figures
\newif\if@boxfig

\DeclareOption{urltt}{\@urltttrue\@urlrmfalse\@urlsffalse}
\DeclareOption{urlsf}{\@urlsftrue\@urlttfalse\@urlrmfalse}
\DeclareOption{urlrm}{\@urlrmtrue\@urlttfalse\@urlsffalse}

\DeclareOption{boxfig}{\@boxfigtrue}
\DeclareOption{noboxfig}{\@boxfigfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ExecuteOptions{urltt,noboxfig}
\ProcessOptions

\LoadClass[12pt,a4paper,oneside]{book}

%\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{ifpdf}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page Boundaries and graphics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\RequirePackage[a4paper,top=25mm,bottom=25mm,left=40mm,right=25mm,footskip=1.5cm]{geometry}

\ifpdf
\pdfcompresslevel=9
\else
\fi

\RequirePackage[listofformat=parens]{subfig}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% When "bahasa" is specified last, all the sectioning 
% commands become Malay (Indonesian?) e.g. "Bab", 
% "Dafter Isi" etc.  "english" is the main language
% here; I just included bahasa so that hyphenations in 
% the Malay abstract wouldn't be messed up.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[french,bahasa,english]{babel}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default spacing is double.  In your actual content,
% whenever you need a paragraph to be single-spaced,
% do this:
%
% \begin{singlespace}
% This is your paragraph using single-spacing.
% \end{singlespace}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}
\linespread{2}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These packages will help you in typesetting 
% mathematical symbols, formulae and equations.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amssymb,textcomp}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sets up the fonts: Load the Times, Helvetica and 
%% Courier (or TX Typewriter) fonts for serif, sans serif
%% and typewriter respectively.
%% (Helvetica is loaded in lieu of Arial, which is
%% commercial.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{mathptmx}\RequirePackage[scaled=.92]{helvet}\renewcommand{\rmdefault}{ptm}\renewcommand{\sfdefault}{phv}
\renewcommand{\ttdefault}{txtt}
\normalfont\selectfont
%\RequirePackage{txfonts}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For including the TOC in the TOC.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tocbibind}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formatting of the various sectioning headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
% chapters
\titleformat{\chapter}[display]{\filcenter\bfseries}{\Large\MakeUppercase{\chaptername{} \thechapter}}{-1.7pc}{\begin{singlespace}\bfseries\LARGE\MakeUppercase}[\end{singlespace}]
\titlespacing*{\chapter}{0pt}{*-4.5}{*6}
% section e.g. 4.1
\titleformat{\section}[hang]{\bfseries\Large}{\thesection}{6pt}{}
\titlespacing*{\section}{0pt}{*3}{*-3}
% subsection e.g. 4.1.1
\titleformat{\subsection}[hang]{\bfseries\large}{\thesubsection}{6pt}{}
\titlespacing*{\subsection}{0pt}{*3}{*-3}
% subsubsection e.g. 4.1.1(a)
\renewcommand\thesubsubsection{\thesubsection(\alph{subsubsection})}
\titleformat{\subsubsection}[hang]{\bfseries}{\thesubsubsection}{6pt}{}
\titlespacing*{\subsubsection}{0pt}{*3}{*-3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formatting of the TOC, LOF and LOT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{lofdepth}{2}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\RequirePackage[titles,subfigure]{tocloft}

% Introducing: List of Plates
\newcommand{\listplatename}{List of Plates}
\newlistof[chapter]{plate}{lop}{\listplatename}
\newcommand\listofplates{\begingroup
\tocfile{\listplatename}{lop}
\endgroup}

\renewcommand\cftdotsep{1}
\cftsetrmarg{2.6pc plus1fil}
\cftsetpnumwidth{2pc}

\setlength\cftbeforepartskip{3pc}
\setlength\cftbeforechapskip{1pc}
\setlength\cftbeforesecskip{1pc}
\setlength\cftbeforesubsecskip{1pc}
\setlength\cftbeforesubsubsecskip{1pc}
\setlength\cftbeforefigskip{1pc}
\setlength\cftbeforesubfigskip{1pc}
\setlength\cftbeforetabskip{1pc}
\setlength\cftbeforeplateskip{1pc}

\cftsetindents{sec}{0pt}{2.5pc}
\cftsetindents{subsec}{2.5pc}{3.05pc}
\cftsetindents{subsubsec}{5.45pc}{4.05pc}

\renewcommand\cftpartfont{}
\renewcommand\cftpartpagefont{\normalfont\normalsize}
\renewcommand\cftpartdotsep{1}
\renewcommand\cftpartleader{\normalfont\cftdotfill{\cftpartdotsep}}

\renewcommand\cftchapfont{}
\renewcommand\cftchappagefont{\normalfont\normalsize}
\renewcommand\cftchapdotsep{1}
\renewcommand\cftchapleader{\normalfont\cftdotfill{\cftchapdotsep}}
\renewcommand\cftchappresnum{\MakeUppercase{\chaptername} }
\renewcommand\cftchapaftersnum{\; -- }
\setlength\cftchapnumwidth{6.5pc}


\renewcommand\cftfigpresnum{Figure }
\cftsetindents{fig}{0pt}{6.2pc}
\renewcommand\cftfigdotsep{\cftnodots}
\renewcommand\cftfigpagefont{\bfseries}

\renewcommand\cftsubfigpresnum{Figure }
\cftsetindents{subfig}{0pt}{6.2pc}
\renewcommand\cftsubfigdotsep{\cftnodots}
\renewcommand\cftsubfigpagefont{\bfseries}

\renewcommand\cfttabpresnum{Table }
\cftsetindents{tab}{0pt}{6.2pc}
\renewcommand\cfttabdotsep{\cftnodots}
\renewcommand\cfttabpagefont{\bfseries}

\renewcommand\cftplatepresnum{Plate }
\cftsetindents{plate}{0pt}{6.2pc}
\renewcommand\cftplatedotsep{\cftnodots}
\renewcommand\cftplatepagefont{\bfseries}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and Footer formatting: empty header, and
% page number at the bottom center.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\renewcommand\headrulewidth{0pt}
\fancyfoot{}
\fancyfoot[C]{\thepage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For customising floats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{rotfloat}
\floatstyle{plaintop}\restylefloat{table}
\if@boxfig\floatstyle{boxed}\else\floatstyle{plain}\fi
\restylefloat{figure}

\newfloat{plate}{htbp}{lop}[chapter]
\floatname{plate}{Plate}
\floatstyle{plain}\restylefloat{plate}
\def\theHplate{\arabic{plate}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For more compact-looking lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{paralist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For typesetting algorithms.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{algorithmic}
\renewcommand{\algorithmiccomment}[1]{\qquad\textrm{\small /**#1**/}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For typesetting code as-is.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyvrb}
\RequirePackage{listings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This package will help you in typesetting urls!
% If you just type a URL like 
%    http://cs.usm.my/~abc/cgi/index.php?q=bye%20%bye
% something is going to get VERY wrong sooner or later.
% Typeset your URL like this instead: 
% \url{http://cs.usm.my/~abc/cgi/index.php?q=bye%20%bye}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}
\if@urlrm\urlstyle{rm}\else\if@urltt\urlstyle{tt}\else\urlstyle{sf}\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For typesetting the list of abbreviations and maybe help 
% control their expansion in the text.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{acronym}
\renewcommand*{\acfsfont}[1]{\rmfamily #1}
\renewcommand*{\acsfont}[1]{\rmfamily #1}
\renewcommand*{\acffont}[1]{\rmfamily #1}

\renewenvironment{AC@deflist}[1]%
        {\ifAC@nolist%
         \else%
            \raggedright\begin{list}{}%
                {\settowidth{\labelwidth}{\textbf{\textrm{#1}}}%
                \setlength{\leftmargin}{\labelwidth}%
                \addtolength{\leftmargin}{\labelsep}%
                \renewcommand{\makelabel}{\bflabel}}%
          \fi}%
        {\ifAC@nolist%
         \else%
            \end{list}%
         \fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table-related packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tabularx,colortbl,dcolumn}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For flexible bibliographic citations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage[numbers]{natbib}
\RequirePackage{natbib}
\addto\captionsenglish{%
\renewcommand{\bibname}{References}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multiple bibliographics, used to hack up a list of 
% own publications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[resetlabels]{multibib}

%% Title of the thesis in Malay
\def\titlems#1{\gdef\@titlems{#1}}
\def\@titlems{\@latex@warning@no@line{No \noexpand\titlems given}}

%% Degree type: MSc or PhD
\def\degreetype#1{\gdef\@degreetype{#1}}
\def\@degreetype{\@latex@warning@no@line{No \noexpand\degreetype given}}

%% Month and year in which thesis was submitted
\def\submitmonth#1{\gdef\@submitmonth{#1}}
\def\@submitmonth{\@latex@warning@no@line{No \noexpand\submitmonth given}}
\def\submityear#1{\gdef\@submityear{#1}}
\def\@submityear{\@latex@warning@no@line{No \noexpand\submityear given}}

%% overrides \chapter, to allow for all-caps in text but as-is in TOC
%\newcommand\mychapter[1]{\chapter[\texorpdfstring{\uppercase{#1}}{#1}]{#1}}

% May 20: re-defined \@chapter so \mychapter is not needed anymore. This
% allows IDEs such as TeXnicCenter to properly recognise the chapters and
% display them correctly in the Structure/Navigator.
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}\texorpdfstring{\uppercase{#1}}{#1}}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{#1}}{#1}}%
                    \fi
                    \chaptermark{\texorpdfstring{\uppercase{#1}}{#1}}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \addtocontents{lop}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{\texorpdfstring{\uppercase{#2}}{#1}}]%
                    \else
                      \@makechapterhead{\texorpdfstring{\uppercase{#2}}{#1}}%
                      \@afterheading
                    \fi}



%% Creates the first two cover pages
\newcommand\makecover{%
\begin{titlepage} \centering {\LARGE \bfseries%
\vspace*{10mm}
%
\begin{singlespace}
\MakeUppercase{\@title}\par
\end{singlespace}
%
\vspace*{\stretch{1}}

\MakeUppercase{\@author}\par

\vspace*{\stretch{1}}

UNIVERSITI SAINS MALAYSIA\par

\@submityear 
%
\vspace*{20mm}
}

\end{titlepage}


\thispagestyle{empty}{\centering\bfseries
\vspace*{15mm}

{\MakeUppercase{\LARGE \@title}\par}

\vspace*{\stretch{2}}

{\Large by}\par

\vspace*{\stretch{2}}

\MakeUppercase{\LARGE \@author}\par

\vspace*{\stretch{2}}

\begin{singlespace}
\Large Thesis submitted in fulfilment of the requirements\\
for the degree of\\
\Large \@degreetype\par
\end{singlespace}

\vspace*{\stretch{2}}

{\LARGE \@submitmonth \ \@submityear }\par

\vspace*{20mm}
}
\clearpage}


%% English environment
\newenvironment{EnAbstract}
  {\chapter[Abstract]{\@title}%
    \begin{center}{\Large\bfseries ABSTRACT}\end{center}}
  {}

%% Malay abstract environment
\newenvironment{MsAbstract}
  {\begin{otherlanguage}{bahasa}%
    \chapter[Abstrak]{\@titlems}%
    \begin{center}{\Large\bfseries ABSTRAK}\end{center}}
  {\end{otherlanguage}}
