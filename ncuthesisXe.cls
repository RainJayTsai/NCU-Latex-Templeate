%-------------------------------------------------------------
% This class file is for thesis/dissertation of
% National Central University, TW, adapted from 
%
% (1) ociamthesis v2.2 (22/11/2010) By Keith A. Gillow 
% <gillow@maths.ox.ac.uk>. Version 1.0 released 26/11/1997
% (2) also from "Minutes in less than Hours: 
% Using \LaTeX Resources" by Jim Hefferon,
% <ftpmaint@tug.ctan.org>
%
% By Jesse LO, Mechanical Engineering, NCU
%   
% For usages limited to personal and within an organization.
% If you modified this file, you should keep this section 
% and MOST importantly DO NOT use the same file name 
% as the file name is for this file EXCLUSIVELY.
%--------------------------------------------------------------
\def\fileversion{1.41}
\def\filedate{2013/08/31}%{2011/01/10}
\typeout{}
\typeout{Document Class: ncuthesisXe.cls 
        \filedate \space v\fileversion \space (Jesse LO)}
\typeout{for National Central University, TW.}
\typeout{}

%-------------------------- identification -------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ncuthesisXe}[2013/08/31 v1.41 NCU thesis class]
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%-------------------------- executation ---------------------
\ProcessOptions\relax
\LoadClass[a4paper,openright]{report}  % 單或雙面印刷 
\if@twoside\else\raggedbottom\fi 

\RequirePackage{xltxtra}            % may cause problem
\RequirePackage{fontspec}
%\RequirePackage[utf8]{inputenc}
\RequirePackage{xunicode}           % unicode character macros
\RequirePackage[CJKnumber]{xeCJK}   % 選用巨集
\RequirePackage{CJKnumb}
\setCJKmainfont{標楷體}
%\setCJKmainfont{微軟正黑體}             % 中文為主：新細明體或其他
\setmainfont{Times New Roman}
%\setmainfont{Noto Serif}
\XeTeXlinebreaklocale "zh"          % 一定要加，才能自動換行
\XeTeXlinebreakskip = 0pt plus 1pt  % 一定要加，才能自動換行

\RequirePackage{graphicx,fancyvrb,verbatim,showframe}
\RequirePackage{pdfpages,pdflscape,ifthen,printlen,calculator}
\RequirePackage[bookmarks=true,unicode=true,colorlinks=false, %把超連結顏色關閉地方
%linkcolor = blue,
%urlcolor  = blue,
%citecolor = blue,
%anchorcolor = blue,
pdfborder={0 0 0},pdfauthor={JCLO},linktoc=all,
pdftitle={An example in TeX/LaTeX/XeLaTeX}]{hyperref} % 超聯結
%  paper size

\setlength{\topmargin}{-0.5cm}
\setlength{\oddsidemargin}{0.5cm}
\setlength{\evensidemargin}{0.5cm}
\setlength{\textwidth}{16cm}
\setlength{\textheight}{24.7cm}

\uselengthunit{cm}
\newcommand{\printpagesize}{
\begin{tabular}{l@{ : }r}
The top margin is       & \printlength{\topmargin}\\
The odd side margin is  & \printlength{\oddsidemargin}\\
The even side margin is & \printlength{\evensidemargin}\\
The text height is      & \printlength{\textheight}\\
The text width is       & \printlength{\textwidth}\\
The paper height is     & \printlength{\paperheight}\\
The paper width is      & \printlength{\paperwidth}
\end{tabular}
}
% ------------------------------- new definition from book.cls
\let\latexps@plain\ps@plain
\newcommand{\frontmatter}{%
\let\ps@plain\latexps@plain\pagestyle{plain}
\clearpage  %\latexps@plain=ps@empty for no numbering
\pagenumbering{roman}}
\newcommand{\mainmatter}{%
\let\ps@plain\latexps@plain\pagestyle{plain}%
\clearpage
\pagenumbering{arabic}}
%---------------------------- 中文化章節
\def\@chapter[#1]#2{%  \@chapter first for TOC entry
\ifnum \c@secnumdepth >\m@ne
  \refstepcounter{chapter}
  \typeout{\@chapapp\space\thechapter.}%
  \renewcommand\thechapter{ \CJKnumber{\arabic{chapter}} }
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter、}#1}
\else
  \addcontentsline{toc}{chapter}{#1}%
\fi
\chaptermark{#1}%
\addtocontents{lof}{\protect\addvspace{10\p@}}% space to lof
\addtocontents{lot}{\protect\addvspace{10\p@}}% space to lot
\if@twocolumn
     \@topnewpage[\@makechapterhead{#2}]%
\else
     \@makechapterhead{#2}%
     \@afterheading
\fi
}
\renewcommand{\thesection}{\arabic{chapter}-\arabic{section}}
\renewcommand{\thesubsection}{\thesection-\arabic{subsection}}

\def\thickhrule{\leavevmode \leaders \hrule height 0ex  
\hfill \kern \z@} % add an horizonal line if needed
\def\position{\centering}
\renewcommand{\@makechapterhead}[1]{% then for running head
\vspace*{10\p@}% some top margin
{
\parindent \z@ \position \reset@font
{\Huge \bfseries \thechapter 、\quad  #1\par\nobreak }  %thechapter左邊可以加入 "第" 右邊可加入 章 改變為 第一章這種模式
\interlinepenalty\@M
\thickhrule   
\vskip40\p@  % vertical distances between title and text
 }
\renewcommand\thechapter{\arabic{chapter}}% back to default setting
}


%----------------------------
\renewcommand{\indexname}{\protect \centering \bf 索~引}
\renewcommand{\bibname}{\protect \centering \bf 參~考~文~獻}
\renewcommand{\listfigurename}{\protect\centering\bf 圖~目~錄}
\renewcommand{\listtablename}{\protect\centering\bf 表~目~錄}
\renewcommand{\contentsname}{\protect \centering \bf 目~錄}
\renewcommand{\figurename}{\protect \centering \bf 圖}
\renewcommand{\tablename}{\protect \centering \bf 表}
\renewcommand*\l@chapter{\@dottedtocline{0}{1em}{6em}}
\renewcommand*\l@section{\@dottedtocline{1}{2em}{5em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{3em}{4em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{4.3em}{4em}}
% DECLARATIONS  宣告
\let\@sprofi\@empty\let\@sprofii\@empty
%\def\@logo{\includegraphics[width=32mm]{NCUlogo}}  % 預設校徽
\let\@logo\@empty
\def\degreedate#1{\gdef\@degreedate{#1}}           % 畢業時間       
\def\degree#1{\gdef\@degree{#1}}                   % 學位
\def\dept#1{\gdef\@dept{#1}}                       % 系所
\def\mprof#1{\gdef\@mprof{#1}}                     % 指導教授
\def\sprofi#1{\gdef\@sprofi{#1}}                   % 共同指導
\def\sprofii#1{\gdef\@sprofii{#1}}                 % 共同指導
\def\logo#1{\gdef\@logo{\includegraphics[width=32mm]{#1}}}% 校徽
\def\copyyear#1{\gdef\@copyyear{#1}}               % 版權
\def\subtitle#1{\gdef\@subtitle{#1}}               % 英文題目   
\SUBTRACT{\number\year}{1911}{\roc}                % roc=民國
\def\today{%
\CJKnumber{\roc} 年\space\CJKnumber{\number\month}
月\space\CJKnumber{\number\day}日}
\DeclareOption{draft}{%
\renewcommand\@oddhead{%
\today \hfil 未完稿 v1.41 \hfil \copyright\ \@author}
}
\DeclareOption{noframe,twoside}{}
\ProcessOptions\relax
\hypersetup{final}

% Environments
\newenvironment{alwayssingle}{%
   \@restonecolfalse
   \if@twocolumn\@restonecoltrue\onecolumn
   \else\if@openright\cleardoublepage\else\clearpage\fi
   \fi}%
   {%
   \if@restonecol\twocolumn
   \else\newpage\thispagestyle{empty}\fi}

% --------define title page layout for thesis
\newboolean{printcopyright}
\setboolean{printcopyright}{false}

\renewcommand{\maketitle}
{\begin{alwayssingle}
\thispagestyle{empty}
\null\vfill
\begin{center}
{\Huge\textbf{國\quad 立\quad 中\quad 央\quad 大\quad 學}\par}
\vspace*{30mm}
{\Huge {\@dept} \par}
\vspace*{2ex}
{\Huge {\@degree}論文\par}	
\vspace*{20mm}
{\Huge {\@title} \par}
\vspace*{5mm}
{\Huge {\@subtitle} \par}
\vspace*{10mm}
{\ifx \@logo\@empty\else\@logo \par\fi}
\vspace*{10mm}
\begin{tabular}{l@{ }l@{\quad}r}
研$\!$究$\!$生: & \@author &       \\[1ex]
指導教授:         & \@mprof & 博士     \\[1ex]
\ifx \@sprofi\@empty  
\else  共同指導: & \@sprofi & 博士\fi \\[1ex] 
\ifx \@sprofii\@empty 
\else  & \@sprofii & 博士 \fi
\end{tabular}\par
\vspace*{5ex}
{\Huge {\@degreedate} \par}
\vspace*{2ex}
\ifthenelse{\boolean{printcopyright}}
{{{版權所有\copyright\ \@author\ \@copyyear} \par}}
{\hspace{5cm}}
\end{center}
%\renewcommand\bg@material{}     % Suppress watermark
\null\vfill
\end{alwayssingle}}
%--------end of title page for thesis

% 先定義一單欄式的新環境(onecol) 需輸入一標題變數。
\newenvironment{onecol}[1]
{\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{#1}
\begin{alwayssingle}
\begin{center}
{\huge  \bfseries #1\par \vspace{1ex}}
{\Large \@title     \par \vspace*{1ex}}
{\Large \@subtitle  \par \vspace*{1ex}}
\end{center}}
{\null \vfill
\end{alwayssingle}}
%----------- No thesis title on the top
\newenvironment{onecolnotitle}[1]
{\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{#1}
\begin{alwayssingle}
\begin{center}
{\huge \bfseries #1}
\end{center}}
{\null \vfill
\end{alwayssingle}}

\newenvironment{acknowledgements}
{\begin{onecol}{謝誌}} 
{\end{onecol}}

\newenvironment{abstracten}
{\begin{onecol}{英文摘要}}
{\end{onecol}}

\newenvironment{abstractcn} 
{\begin{onecol}{中文摘要}} 
{\end{onecol}}

\newenvironment{appendA} 
{\setcounter{section}{0}
\renewcommand\thesection{A-\arabic{section}}
\renewcommand\theequation{A.\arabic{equation}}
\begin{onecolnotitle}{附錄一}}
{\end{onecolnotitle}}

\newenvironment{appendB} 
{\setcounter{section}{0}
\renewcommand\thesection{B-\arabic{section}}
\renewcommand\theequation{B.\arabic{equation}}
\begin{onecolnotitle}{附錄二}} 
{\end{onecolnotitle}}

\newenvironment{symbols}
{\begin{onecol}{符號說明}}
{\end{onecol}}

%---------- To generate a short bookbone
\newcommand{\bookbone}
{\thispagestyle{empty}
\begin{landscape}
\noindent
{
\hspace{1cm}
{\rotatebox{90}{\makebox{100}}}\hspace{0.5cm}
\begin{tabular}{c}
國立中央大學\\
\@dept
\end{tabular}
\hspace{0cm}
\LARGE{{\@degree}論文\hspace{0.5cm}
{\@title}\hspace{0.5cm}
{\@author}撰\hspace{1cm}}}
\end{landscape}
}
%------------- Indentation
\leftskip 0cm
\parindent 1cm   % 內縮
\makeatletter
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
\makeatother
%-------------end of ncuthesis 
\endinput            % totaling 283 lines