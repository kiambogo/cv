% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2021/03/03 CV]

% Class options
\LoadClass{article}
\ProcessOptions\relax

% Package definitions
\RequirePackage{xcolor}
\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{ifthen}
\RequirePackage[quiet]{fontspec}
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{graphbox}
\RequirePackage[default,opentype]{sourcesanspro}


\graphicspath{ {imgs/} }
\newfontfamily\nameFont[Path=fonts/, LetterSpace=10]{ModerneSans}
\newfontfamily\sectionTitleFont[Path=fonts/, LetterSpace=10]{ModerneSans}
\newfontfamily\taglineFont[Path=fonts/]{ModerneSans}
\newfontfamily\monoFont[Path=fonts/]{SpaceMono}

\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

\def\myThemeColor{blue}
\newcommand*{\themeColor}[1]{\def\myThemeColor{#1}}
\newcommand*{\name}[1]{\def\myName{#1}}
\newcommand*{\tagline}[1]{\def\myTagline{#1}}
\newcommand*{\email}[1]{\def\myEmail{#1}}
\newcommand*{\web}[1]{\def\myWeb{#1}}
\newcommand*{\linkedin}[1]{\def\myLinkedin{#1}}
\newcommand*{\github}[1]{\def\myGithub{#1}}

\renewcommand*{\section}[2][L]{
  \ifthenelse{\equal{#1}{L}}{\RaggedLeft}{\RaggedRight}
  \sectionTitleStyle{#2}
  \vspace{-5pt}\\{\hrulefill}\vspace{10pt}\\
}

\newcommand*{\headerNameStyle}[1]{{\color{darkgray}\fontsize{28pt}{1em}\MakeUppercase{\nameFont{#1}}}}
\newcommand*{\taglineStyle}[1]{{\color{\myThemeColor!75}\fontsize{8pt}{1em}\MakeUppercase{\bodyfont{#1}}}}
\newcommand*{\sectionTitleStyle}[1]{{\color{\myThemeColor}\fontsize{10pt}{1em}\MakeUppercase{\sectionTitleFont{#1}}}}
\newcommand*{\subsectionTitleStyle}[1]{{\color{darkgray}\fontsize{9pt}{1em}{\textbf{\MakeUppercase{\bodyfont{#1}}}}}}
\newcommand*{\subsubsectionTitleStyle}[1]{{\fontsize{8pt}{1em}\bodyfont\textbf{\scshape\color{gray} #1}}}
\newcommand*{\locationStyle}[1]{{\color{\myThemeColor}\fontsize{8pt}{1em}\bodyfontlight\textit{#1}}}
\newcommand*{\datesStyle}[1]{{\color{darkgray}\fontsize{8pt}{1em}\bodyfontlight\textit{#1}}}
\newcommand*{\contactStyle}[1]{{\fontsize{8pt}{1em}\color{darkgray}\monoFont{#1}}}
\newcommand*{\bodyStyle}[1]{{\small\color{darkgray}{#1}}}
