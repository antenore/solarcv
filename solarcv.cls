\ProvidesClass{solarcv}[2015/05/09 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%
% License and copyright %
%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}
\RequirePackage{hyperxmp}
\hypersetup{%
    pdftitle={SolarCV},
    pdfauthor={Antenore Gatta},
    pdfcopyright={Copyright (C) 2015, Antenore Gatta},
    pdfsubject={pdf CV generated with LaTeX},
    pdfkeywords={cv, resume, solarized},
    pdflicenseurl={http://creativecommons.org/licenses/by-sa/4.0/},
    pdfcontacturl={http://github.com/antenore/solarcv},
    pdflang={en}
}

%%%%%%%%%%%%%%%%%%%%%%%%
% Dummy text generator %
%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[english]{babel}
\RequirePackage{blindtext}

%%%%%%%%%%%%%%%%%%%%
% Global Variables %
%%%%%%%%%%%%%%%%%%%%

\global\let\@firstname\@empty
\global\let\@lastname\@empty
\global\let\@fullname\@empty
\global\let\@phone\@empty
\global\let\@address\@empty
\global\let\@email\@empty
\global\let\@website\@empty
\global\let\@portrait\@empty


%%%%%%%%%%%%
% Portrait %
%%%%%%%%%%%%
\RequirePackage{graphicx}

\DeclareGraphicsExtensions{.png,.jpg,.pdf}
\setkeys{Gin}{width=0.90\textwidth}

\newcommand{\portrait}[1]{\IfFileExists{#1}{\includegraphics*{#1}}{\includegraphics*{./img/portrait.png}}}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor-solarized}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
    \colorlet{green}{solarized-base01}
    \colorlet{orange}{solarized-base01}
    \colorlet{purple}{solarized-base01}
    \colorlet{yellow}{solarized-base01}
    \colorlet{red}{solarized-base01}
    \colorlet{blue}{solarized-base01}
    \colorlet{purple}{solarized-base01}
    \colorlet{fillheader}{white}
    \colorlet{header}{solarized-base02}
    \colorlet{gray}{solarized-base02}
    \colorlet{darkgray}{solarized-base03}
    \colorlet{lightgray}{solarized-base01}
\else
    \colorlet{darkgray}{solarized-base02}
    \colorlet{gray}{solarized-base00}
    \colorlet{lightgray}{solarized-base1}
    \colorlet{green}{solarized-green}
    \colorlet{orange}{solarized-orange}
    \colorlet{yellow}{solarized-yellow}
    \colorlet{purple}{solarized-magenta}
    \colorlet{red}{solarized-red}
    \colorlet{blue}{solarized-blue}
    \colorlet{fillheader}{darkgray}
    \colorlet{header}{white}
\fi
\colorlet{textcolor}{darkgray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX]{unicode-math}
%\usepackage[T1]{fontenc}
\usepackage{stix}
\usepackage{csquotes}

\newfontfamily\bodyfont[]{Source Code Pro}
\newfontfamily\thinfont[]{Source Code Pro ExtraLight}
\newfontfamily\headingfont[]{Source Code Pro Bold}
%\newfontfamily\bodyfont[]{Raleway Medium}
%\newfontfamily\thinfont[]{Raleway Light}
%\newfontfamily\headingfont[]{Raleway Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Source Code Pro Light}

%\setmathfont{STIX Math}

%%%%%%%%%%
% PAGE %
%%%%%%%%%%

\pagecolor{white}
\ifdefined\@cv@print
  \pagecolor{white}
\fi

%%%%%%%%%%
% Header %
%%%%%%%%%%


\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        yellow\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{enumitem,changepage}

\setlist[description]{%
    topsep=0pt,              % space before start / after end of list
    leftmargin=*,            %
    nolistsep,               % space between items
    font={\bfseries\color{gray}}, % set the label font
      %  font={\bfseries\sffamily\color{red}}, % if colour is needed
}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
}{%
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \parbox[t]{2.0cm} {%
    #1
  }
  \hfill
  \parbox[t]{11.8cm}{%
    \textbf{\color{lightgray}#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=solarized-base03} #3}
  }
  \begin{adjustwidth}{0.5cm}{0.5cm}
    \small #4
  \end{adjustwidth}
}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \small
  \begin{textblock}{4.2}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%
% Footer %
%%%%%%%%%%

\RequirePackage{fancyhdr}

\renewcommand{\footrule}{{\color{blue}%
\vskip-\footruleskip\vskip-\footrulewidth
\hrule width\headwidth height\footrulewidth\vskip\footruleskip}}
\pagestyle{fancy}
\fancyfoot[LE,LO]{\lastname\textcopyright\ \the\year}
\fancyfoot[CE,CO]{built with \LaTeX}
\fancyfoot[RE,RO]{Fork me on \href{http://github.com/antenore/solarcv}{GitHub}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \nameparts{#1}\ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingTemplate{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}

% vim: ft=tex
