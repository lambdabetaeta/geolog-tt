\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nice-article}[2024/02/26 Nice Article Template]

%% KOMA options
\LoadClass{scrartcl}

\KOMAoptions{numbers=endperiod}
\setkomafont{disposition}{\bfseries}
\setkomafont{title}{\normalfont\Huge}
\setkomafont{section}{\centering\normalfont\scshape\large}

%% Font stuff

\usepackage[T1]{fontenc}
\usepackage{mlmodern}
\renewcommand{\bfdefault}{b}
% \usepackage[adobe-utopia]{mathdesign}
\usepackage{microtype}

%% Various nice packages 

\RequirePackage{breakcites}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{wasysym}
\RequirePackage{stmaryrd}
\RequirePackage{fontawesome}
\RequirePackage{jmsdelim}
\RequirePackage{mathtools}
\RequirePackage{thmtools}
\RequirePackage[pdfusetitle,hyperfootnotes=false]{hyperref}
\RequirePackage[capitalize,nameinlink]{cleveref}

%% Cleverref options

\crefname{equation}{}{}
\crefname{chapter}{\S\!\!}{\S\!\!}
\crefname{section}{\S\!\!}{\S\!\!}
% Create counter for diagrams
\newcounter{diagram}
% Create diagram environment
\newenvironment{diagram}[1][]{%
    \begin{equation}%
    \begin{tikzpicture}[#1, baseline=(current  bounding  box.center)]%
    \setcounter{diagram}{\theequation}
    \addtocounter{diagram}{-1}
    \refstepcounter{diagram}
}{%
    \end{tikzpicture}%
    \end{equation}%
}
\crefname{diagram}{Diagram}{Diagrams}

%% Make description and labelling environments nicer
\setkomafont{descriptionlabel}{\normalfont\bfseries}
\setkomafont{labelinglabel}{\normalfont\bfseries}
\setkomafont{labelingseparator}{\normalfont}

%% AMS Theorem options

\theoremstyle{definition}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{rul}[theorem]{Rule}

\newtheorem{definition}[theorem]{Definition}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{construction}[theorem]{Construction}

%% With longer examples and remarks, it's nice to have an end clearly defined, particularly when
%% there's a page break involved.
\newtheorem{examplex}[theorem]{Example}
\newenvironment{example}
  {\pushQED{\qed}\renewcommand{\qedsymbol}{$\lhd$}\examplex}
  {\popQED\endexamplex}
\newtheorem{remarkx}[theorem]{Remark}
\newenvironment{remark}
  {\pushQED{\qed}\renewcommand{\qedsymbol}{$\lhd$}\remarkx}
  {\popQED\endremarkx}

\theoremstyle{remark}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{convention}[theorem]{Convention}


%% From https://tex.stackexchange.com/questions/42726/align-but-show-one-equation-number-at-the-end
\NewDocumentCommand{\TagEq}{o}{\IfValueTF{#1}{\tag{#1}}{\stepcounter{equation}\tag{\theequation}}}

\allowdisplaybreaks%
