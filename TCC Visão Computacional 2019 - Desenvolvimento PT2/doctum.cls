\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{doctum}
              [2005/09/16 v1.4f
 Standard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}
    \setlength\paperwidth  {210mm}}
   {\setlength\paperheight {10.5in}
    \setlength\paperwidth  {7.25in}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}

\ExecuteOptions{letterpaper,10pt,twoside,onecolumn,final,openright}
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

\def\ps@headings{
	\let\@oddfoot\@empty
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}
  \let\@mkboth\markboth
  \def\chaptermark##1{
  	\markright {\MakeUppercase{
    \@chapapp\ \thechapter. \ 
    ##1}}}}

\newcommand*\chaptermark[1]{}

\setcounter{secnumdepth}{3} % profundidade - numeracao das secoes

\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

\renewcommand\thechapter {\@arabic\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\refstepcounter{chapter}
                    \typeout{\@chapapp\space\thechapter.}
                    % formatacao titulo capitulo no sumario                         
                    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}\bfseries\uppercase{#1}} 
                    %\bfseries coloca os titulos principais do sumario em negrito. Colocar antes do \uppercase
                    \chaptermark{#1}
                    \@makechapterhead{#2}
                    \@afterheading}

\def\@makechapterhead#1{
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \thechapter\hspace{.2cm} % formatacao titulo capitulo no texto - numeracao
      \fi
    \fi
    \interlinepenalty\@M
    \bfseries \uppercase{#1}\par\nobreak % formatacao titulo capitulo no texto - titulo
    $\!$\\ % pula 2 linhas apos titulo do capitulo no texto
  }}
  
% formatacao titulo de lista  
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]
                 \else
                   \@makeschapterhead{#1}
                   \@afterheading
                 \fi}								 

% formatacao titulo de lista  
\def\@makeschapterhead#1{
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \bfseries  \center{#1}\par\nobreak % centraliza titulo na pagina
    $\!$\\ % pula 2 linhas
    $\!$\\ % pula 2 linhas
  }}


% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE} 
%    BEFORESKIP : Absolute value = skip to leave above the heading.  
%                 If negative, then paragraph indent of text following 
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading,
%                       else - skip to leave to right of run-in heading.
\newcommand\section{\@startsection {section}{1}{\z@}
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%before skip
                                   {2.7ex \@plus.2ex}%after skip
                                   {\normalfont\normalsize}}
                                                                       
\newcommand\subsection{\@startsection{subsection}{2}{\z@}
                                     {-3.25ex\@plus -1ex \@minus -.2ex}
                                     {2.7ex \@plus .2ex}
                                     {\normalfont\normalsize}}
                                     
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}
                                     {-3.25ex\@plus -1ex \@minus -.2ex}
                                     {2.7ex \@plus .2ex}
                                     {\normalfont\normalsize}}
                                     
%\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}
%                                    {3.25ex \@plus1ex \@minus.2ex}
%                                    {-1em}
%                                    {\normalfont\normalsize\bfseries}}
%                                    
%\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}
%                                       {3.25ex \@plus1ex \@minus .2ex}
%                                       {-1em}
%                                      {\normalfont\normalsize\bfseries}}
                                      
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi

\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}

\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi

\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\if@compatibility
\newenvironment{titlepage}
    {
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}
      \setcounter{page}\z@
    }
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}
      \setcounter{page}\@ne
    }
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\@addtoreset{equation}{}% numeracao sequencial das equacoes
\renewcommand\theequation
{\@arabic\c@equation}

\newcounter{figure}% numeracao sequencial das figuras
\def\figurename{Figure}
\renewcommand \thefigure{\figurename\space\@arabic\c@figure}% hifen apos numero da figura

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\nobreakspace\thefigure}

\newenvironment{figure}{\@float{figure}}{\end@float}
\newenvironment{figure*}{\@dblfloat{figure}}{\end@dblfloat}

\newcounter{table}% numeracao sequencial das tabelas
\def\tablename{Tabela}
\renewcommand \thetable{\tablename\space\@arabic\c@table} % hifen apos numero da tabela

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\nobreakspace\thetable}

\newenvironment{table}
               {\@float{table}}
               {\end@float}

\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
               
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

\long\def\@makecaption#1#2{
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2} % legenda das figuras e tabelas
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par % legenda das figuras e tabelas
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}
  \fi
  \vskip\belowcaptionskip}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em} 
\newcommand\@dotsep{1} % SEPARACAO ENTRE OS PONTINHOS NA LISTAS DE TABELAS E FIGURAS

\setcounter{tocdepth}{3} % controla profundidade da TOC

\newcommand\tableofcontents{
    \chapter*{\contentsname\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \thispagestyle{empty} % paginacao - sem numeracao antes da introducao
    \@starttoc{toc}
    \thispagestyle{empty} % paginacao - sem numeracao antes da introducao
   }
    
\newcommand*\l@chapter[2]{ % chapter entry at summary
	\addpenalty{-\@highpenalty}
  \vskip -0.5cm \@plus\p@ % separação entre capítulos no sumário
 	\begingroup
  	\parindent \z@ \rightskip \@pnumwidth
    \parfillskip -\@pnumwidth
    \advance\leftskip\@tempdima
    \hskip -\leftskip
  	\@dottedtocline{0}{0em}{1.7cm}{#1}{\hss#2}
    \penalty\@highpenalty
  \endgroup}

\newcommand*\l@section[2]{\@dottedtocline{1}{0em}{4.1em}{#1}{\hss#2}} % noindent at summary
\newcommand*\l@subsection[2]{\@dottedtocline{2}{0em}{4.1em}{#1}{\hss#2}} % noindent at summary
\newcommand*\l@subsubsection{\@dottedtocline{3}{0em}{4.1em}} % noindent at summary

\newcommand\listoffigures{
    \chapter*{\listfigurename}
    \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}
    \thispagestyle{empty} % paginacao - sem numeracao antes da introducao  
    \@starttoc{lof}
    \thispagestyle{empty} % paginacao - sem numeracao antes da introducao
    \if@restonecol\twocolumn\fi}

\newcommand*\l@figure{\@dottedtocline{1}{0em}{2cm}}

\newcommand\listoftables{
	  \chapter*{\listtablename}\@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}
    \@starttoc{lot}
    \thispagestyle{empty} % paginacao - sem numeracao antes da introducao
    \if@restonecol\twocolumn\fi}

\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}

\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
      \list{\@biblabel{\@arabic\c@enumiv}}
           {\settowidth\labelwidth{\@biblabel{#1}}
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}
      \endlist}

\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\newcommand\@idxitem{\par\hangindent 40\p@}

\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

%\renewcommand\footnoterule{
%  \kern-3\p@
%  \hrule\@width.4\columnwidth
%  \kern2.6\p@}
%\@addtoreset{footnote}{chapter}

\newcommand\@makefntext[1]{
    \parindent 1em
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}

\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\endinput