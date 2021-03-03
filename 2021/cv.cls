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
\RequirePackage{import}

% Layout setup
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}
\thispagestyle{empty}

% Font setup
\graphicspath{ {imgs/} }
\newfontfamily\nameFont[Path=fonts/, LetterSpace=10]{ModerneSans}
\newfontfamily\sectionTitleFont[Path=fonts/, LetterSpace=10]{ModerneSans}
\newfontfamily\taglineFont[Path=fonts/]{ModerneSans}
\newfontfamily\monoFont[Path=fonts/]{SpaceMono}

\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

% Colour definitions
\definecolor{cvOrange}{RGB}{242,74,7}
\definecolor{cvBlue}{RGB}{7,82,242}
\definecolor{cvRed}{RGB}{214, 4, 4}
\definecolor{cvGreen}{RGB}{88,171,5}
\colorlet{cvDarkOrange}{cvOrange!70!black}
\colorlet{cvDarkBlue}{cvBlue!70!black}
\colorlet{cvDarkRed}{cvRed!70!black}
\colorlet{cvDarkGreen}{cvGreen!70!black}

\def\myThemeColor{blue}
\newcommand*{\themeColor}[1]{\def\myThemeColor{#1}}
\newcommand*{\name}[1]{\def\myName{#1}}
\newcommand*{\tagline}[1]{\def\myTagline{#1}}
\newcommand*{\email}[1]{\def\myEmail{#1}}
\newcommand*{\web}[1]{\def\myWeb{#1}}
\newcommand*{\linkedin}[1]{\def\myLinkedin{#1}}
\newcommand*{\github}[1]{\def\myGithub{#1}}

\newcommand*{\skills}[1]{\def\cvSkills{#1}}
\newcommand*{\projects}[1]{\def\cvProjects{#1}}
\newcommand*{\contact}[1]{\def\cvContact{#1}}
\newcommand*{\experience}[1]{\def\cvExperience{#1}}
\newcommand*{\education}[1]{\def\cvEducation{#1}}

\newcommand*{\headerNameStyle}[1]{{\color{darkgray}\fontsize{28pt}{1em}\MakeUppercase{\nameFont{#1}}}}
\newcommand*{\taglineStyle}[1]{{\color{\myThemeColor!75}\fontsize{8pt}{1em}\MakeUppercase{\bodyfont{#1}}}}
\newcommand*{\sectionTitleStyle}[1]{{\color{\myThemeColor}\fontsize{10pt}{1em}\MakeUppercase{\sectionTitleFont{#1}}}}
\newcommand*{\subsectionTitleStyle}[1]{{\color{darkgray}\fontsize{9pt}{1em}{\textbf{\MakeUppercase{\bodyfont{#1}}}}}}
\newcommand*{\subsubsectionTitleStyle}[1]{{\fontsize{8pt}{1em}\bodyfont\textbf{\scshape\color{gray} #1}}}
\newcommand*{\locationStyle}[1]{{\color{\myThemeColor}\fontsize{8pt}{1em}\bodyfontlight\textit{#1}}}
\newcommand*{\datesStyle}[1]{{\color{darkgray}\fontsize{8pt}{1em}\bodyfontlight\textit{#1}}}
\newcommand*{\contactStyle}[1]{{\fontsize{8pt}{1em}\color{darkgray}\monoFont{#1}}}
\newcommand*{\bodyStyle}[1]{{\small\color{darkgray}{#1}}}


% a section within the cv (skills/education/experience/etc)
% args:
% #1: section title [skills]
% #2: section content
\newcommand*{\mkSection}[2]{
  \RaggedRight{
    \sectionTitleStyle{#1}
    \vspace{-5pt}\\
    {\hrulefill}
    \vspace{7pt}\\
    {#2}
    \vspace{7pt}
  }
}

% an entry within the contact section
% args:
% #1: URL to hyperlink to
% #2: value to display
% #3: icon (font awesome) to include
\newcommand*{\contactItem}[3]{
  \hspace{-11pt}
  \contactStyle{
    \href{#1}{\raisebox{-3.5pt}{
        \begin{tikzpicture}
          \node at (0,0) [draw,fill=\myThemeColor!30] {\fontsize{9pt}{1em}{#3}};
        \end{tikzpicture}
      } \hspace{-10pt} #2}
    \vspace{6pt}
  }\\
}

% an entry within the skills section
% args:
% #1: skill to list [scala]
\newcommand*{\skillsItem}[1]{
  \bodyStyle{#1}\vspace{5pt}\\
}

% an entry within a section
% args:
% #1: optional title (leave blank for nesting entries) [company A]
% #2: location [vancouver]
% #3: subtitle [software engineer]
% #4: date(s) of entry [Jan. 2019 - PRESENT]
% #5: body
\newcommand{\cvEntry}[5]{
  \ifthenelse{\equal{#1}{}}{\vspace{-15pt}}{
    \subsectionTitleStyle{#1} \hfill \locationStyle{#2}\\
  }
  \vspace{3pt}
  \subsubsectionTitleStyle{#3} \hfill \datesStyle{#4}\\
  {#5}
  \vspace{8pt}
}

% a list residing within a cvEntry
% args:
% #1: the set of \item entries for listing [\item A \\ \item B]
\newcommand{\entryItems}[1]{
  \bodyStyle{
  \begin{itemize}[leftmargin=*]
    {#1}
  \end{itemize}
  }
}

% mkHeader will construct the header of the document
% this includes the name and the tagline
\newcommand*{\mkHeader}{
    \begin{minipage}[t]{\linewidth}
      \RaggedLeft{
        \headerNameStyle{\myName}\\
        \taglineStyle{\myTagline}
      }
    \end{minipage}
    \vspace{30pt}
}

% mkBody constructs the body of the cv
% this includes the left side, split, and right side
\newcommand{\mkBody}{
  \newcommand{\mkLeft}{
    \begin{minipage}[t]{0.25\linewidth}
      \mkSection{Skills}{{\cvSkills}}
      \mkSection{Projects}{{\cvProjects}}
      \mkSection{Contact}{{\cvContact}}
    \end{minipage}
  }
  \newcommand{\mkSplit}{
    \hspace{5pt}
    \color{\myThemeColor!80!black}\vrule width 1pt
    \hspace{5pt}
  }
  \newcommand{\mkRight}{
    \begin{minipage}[t]{0.75\linewidth}
      \mkSection{Experience}{{\cvExperience}}
      \mkSection{Education}{{\cvEducation}}
    \end{minipage}
  }

  {\mkLeft}
  {\mkSplit}
  {\mkRight}
}
