%%% Local Variables:
%%% coding: utf-8
%%% mode: latex
%%% TeX-engine: xetex
%%% End:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsuir-std}[2024/09/20 Class conforming to BSUIR standard]


\LoadClass[a4paper,14pt]{extarticle}

%%%%%%%%%%
% Пакеты %
%%%%%%%%%%

% Чтобы сделать отступы по СТП-2024 приложение Л
\RequirePackage{geometry}

% Добавляем polyglossia, с ним же добавиться fontspec и можем
% использовать шрифт Times New Roman в XeLaTeX
% При том одним только fontspec не обойтись, потому что в
% polyglossia ещё команда setdefaultlanguage, которая позволяет
% установить русский язык в качестве основного, без чего
% не будут нормально в русском переносы работать.
\RequirePackage{polyglossia}

% Чтобы более гибко настроить межстрочный интервал в списках и перечислениях
\RequirePackage{enumitem} % https://tex.stackexchange.com/a/519982

\RequirePackage{graphicx} % Картинки^W Иллюстрации

% Картинки и другие float'ы там где написал инклюд через  H
\RequirePackage{float}

% Подписи к картинкам.
\RequirePackage{caption}

% titles
\RequirePackage{titlesec}

\RequirePackage{amsmath}
\RequirePackage{unicode-math}

\RequirePackage{url}

\RequirePackage{tocbasic}

\RequirePackage{setspace}

%%%%%%%
% СТП %
%%%%%%%

% интервал между строк
% В СТП-2017 не оговорен, просто сказано в пункте 2.1.1
% В СТП-2024 интервал уже оговорен и равен единице
% «межстрочный интервал – 1,0 (18 пунктов),»
% 40 +- 3 строки на страницу
\singlespacing

\setstretch{1}

% Содержание по СТП
% Look at comadocs for setting up toc
% https://mirror.datacenter.by/pub/mirrors/CTAN/macros/latex/contrib/koma-script/doc/scrguide-en.pdf
\DeclareTOCStyleEntries[
  beforeskip=0pt, % интервал
  linefill=\dotfill,
]{tocline}{section,subsection,subsubsection}



% Приложение Л. СТП-2024
\geometry{left=30mm, top=20mm, right=15mm, bottom=20mm}

% СТП-2024 Пункт 2.1.1
% «абзацный отступ – 1,25 см»
\setlength{\parindent}{12.5mm}

\setlist[enumerate, 1]{
  label = \arabic*.\arabic* , % Поставить номер без точки
  nosep,   % У списков по СТП такой межстрочный интервал
  listparindent = \parindent,
  itemindent =!,
  leftmargin = -\parindent,
}

\AddEnumerateCounter{\asbuk}{\russian@asbuk@alph}{щ} % section 8.1

\setlist[enumerate, 2]{ % Второй уровень в нумерованных перечислениях
  label = \arabic*.\arabic*.\arabic* ,
  nosep,   % У списков по СТП такой межстрочный интервал
  labelindent = \parindent,
  leftmargin = *,
}

\setlist[itemize, 1]{ % Первый уровень в нумерованных перечислениях
  label = \textendash,
  nosep,   % У списков по СТП такой межстрочный интервал
  labelindent = \parindent,
  leftmargin = *,
}

% Считать рисунки и таблицы в пределах глав.
\counterwithin{figure}{section}
\counterwithin{table}{section}

% Оглавление секций:
% Отсуствие точек у номеров
% Верхний регистр
%
% https://tex.stackexchange.com/a/324041
% https://mirror.datacenter.by/pub/mirrors/CTAN/macros/latex/contrib/titlesec/titlesec.pdf
\titleformat{\section}[block]
{\normalfont\Large}{\thesection}{0.4em}{\MakeUppercase}

\titleformat{name=\section,numberless}[block]
{\normalfont\Large}{}{0.4em \centering}{\MakeUppercase}


\titleformat{\subsection}
{\normalfont}{\thesubsection}{0.4em}{}

\titleformat{\subsubsection}
{\normalfont}{\thesubsubsection}{0.4em}{}




%%%%%%%%%%%%%%%%%%%
% ifxetex section %
%%%%%%%%%%%%%%%%%%%

\RequirePackage{iftex}
% Я использую XeLaTeX потому что это позволяет использовать системный
% Times New Roman
\ifXeTeX
  %% устанавливает главный язык документа
  \setdefaultlanguage[spelling=modern]{russian}
  %% устанавливает второй язык документа
  \setotherlanguage{english}

  % СТП-2024 пункт 2.1.1
  % Устанавливаем основным шрифтом системный Times new Roman
  \setmainfont{Times New Roman}
  \newfontfamily{\cyrillicfont}{Times New Roman}[Script=Cyrillic]
  \newfontfamily{\cyrillicfontsf}{Times New Roman}[Script=Cyrillic]
 % Выставляем в качестве моноширинного шрифта системный Courier
  \setmonofont{Courier New}
  \newfontfamily{\cyrillicfonttt}{Courier New}

  \providecommand{\No}{\textnumero}

  %% Убираем предупреждение о использовании команды \cyr из eskdx
  \RequirePackage{xecyr}
  % Почему раньше был использован класс eskdx?
  % Главным образом потом что он позволяет
  % - Делать секции по ГОСТ 2.105-95
  % - Писать спецификацию
  % - Не подгружать пакет geometry, отступы уже в соответсвии с приложением Л СТП 


  % \setmathfont{Cambria Math}

\fi

