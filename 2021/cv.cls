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

\newcommand*{\mkHeader}{
    \begin{minipage}[t]{\linewidth}
      \RaggedLeft{
        \headerNameStyle{\myName}\\
        \taglineStyle{\myTagline}
      }
    \end{minipage}
    \vspace{1cm}
}

\newcommand*{\mkSection}[2]{
  \section[R]{#1}\vspace{-3pt}{#2}\vspace{10pt}
}

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
  \ifthenelse{\equal{#1}{}}{\vspace{-5pt}}{
    \subsectionTitleStyle{#1} \hfill \locationStyle{#2}\\
  }
  \vspace{3pt}
  \subsubsectionTitleStyle{#3} \hfill \datesStyle{#4}\\
  {#5}
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

\newcommand{\mkProjects}{
  \mkSection{Projects}{
    \cvEntry{Scrava}{}{\href{https://github.com/kiambogo/scrava}{\faGithubSquare \hspace{0.5mm} kiambogo/scrava}}{}{
      \entryItems{
        \item{Community recognized, open-source Scala client for the Strava API}
      }
    }
    \vspace{5pt}
    \cvEntry{Road Quality}{}{\href{https://github.com/trifectalabs/roadquality}{\faGithubSquare \hspace{0.5mm} trifectalabs/roadquality}}{}{
      \entryItems{
        \item{Crowdsourced road quality and traffic safety data for cyclists}
        \item{Allows cyclists to rate sections of a road or path to build a
          cmmunity driven topology of the safest cycling routes}
        \item{API and pathing logic implemented in Scala; custom mapping engine built with Rust}
      }
    }
  }
}

\newcommand{\mkEducation}{
  \mkSection{Education}{
    \cvEntry{University of Waterloo}{Waterloo, Canada}{BASc. Computer Engineering}{2011-2016}{}{}
  }
}

\newcommand{\mkContact}{
  \mkSection{Contact}{
    \contactItem{mailto:\myEmail}{\myEmail}{\faEnvelope}
    \contactItem{https://\myWeb}{\myWeb}{\faHome}
    \contactItem{https://www.linkedin.com/in/\myLinkedin}{\myLinkedin}{\faLinkedin}
    \contactItem{https://github.com/\myGithub}{\myGithub}{\faGithub}
  }
}

\newcommand{\mkSkills}{
  \mkSection{Skills}{
    \skillsItem{Scala}
    \skillsItem{Go}
    \skillsItem{Haskell}
    \skillsItem{Java}
    \skillsItem{AWS + Heroku}
    \skillsItem{Postgres}
    \skillsItem{Redis}
    \skillsItem{Cassandra}
    \skillsItem{MongoDB}
  }
}

\newcommand{\mkLeft}[1][0.25]{
  \begin{minipage}[t]{#1\linewidth}
    {\mkSkills}
    {\mkProjects}
    {\mkContact}
  \end{minipage}
}

\newcommand{\mkExperience}{
  \mkSection{Experience}{
    \cvEntry{MasonHub}{Los Angeles, CA (Remote)}{Software Engineer}{Jan. 2019 - Jan. 2021}{
      \entryItems{
        \item{Third engineer, responsible for designing, building, and owning multiple core systems that scaled the company from 0 clients to 35+ within 2 years}
        \item{Constructed Shopify integration, reducing technical client onboarding time to minutes}
        \item{Architected fault-tolerant, scalable printer management system allowing for custom supply chain documents. Successfully printed over 250,000+ documents}
        \item{Refactored critical, production database schema reducing average inventory ledger query times to 2.5ms and bulk order processing time to 160ms}
      }
    }
    \vspace{10pt}
    \cvEntry{Hudson's Bay Company}{New York, NY (Remote)}{Lead Software Engineer}{Aug. 2018 - Jan. 2019}{
      \entryItems{
        \item {Engineering lead of a team of 4 intermediate and senior level developers}
        \item {Directed team towards adopting a functional code base with Scala Cats + FS2}
        \item {Architected a multi-service initiative to optimize safety stock levels and reduce order shorting}
      }
    }
    \cvEntry{}{}{Software Engineer II}{Nov. 2017 - Aug. 2018}{
      \entryItems{
        \item {Conflated inventory management systems across banners as part of
            the shared selling initiative, driving double-digit growth for the Gilt banner}
      }
    }
    \cvEntry{}{}{Software Engineer}{July 2016 - Nov. 2017}{
      \entryItems{
        \item {Refactored mission critical service to use Postgres instead of Mongo; strategized deployment resulting in zero downtime}
        \item {Modified website delivery window calculation to include customer location, improving checkout conversion across many US states}
      }
    }
    \vspace{10pt}
    \cvEntry{Strava}{San Francisco, CA}{Platform Engineer Intern}{Aug. 2015 - Dec. 2015}{
      \entryItems{
        \item{Optimized user characteristics processing with development of Scala service leveraging Spark}
        \item{Designed and deployed Spark cluster to production atop of Apache Mesos}
      }
    }
    \vspace{10pt}
    \cvEntry{Gilt Groupe}{New York, NY}{Software Engineering Intern}{Jan. 2015 - Apr. 2015}{
      \entryItems{
        \item {Designed and built a public API with Scala + Play as part of the global redistribution team to provide inventory and catalog information to redistribution partners, increasing global incremental revenue by more than 40\%}
      }
    }
  }
}

\newcommand{\mkRight}[1][0.75]{
  \begin{minipage}[t]{#1\linewidth}
    {\mkExperience}
    {\mkEducation}
  \end{minipage}
}

\newcommand{\mkSplit}{
    \hspace{5pt}
    \color{\myThemeColor!80!black}\vrule width 1pt
    \hspace{5pt}
}
