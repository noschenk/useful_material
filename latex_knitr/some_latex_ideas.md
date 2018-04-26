# include .pdf in your latex document or beamer
Have you ever considered reading in figures from a paper directly from the paper in pdf? No? Do it, it is really nice and prevents you from hanving thousands of small files with screenshots of the paper's figures!

## Here is how it goes in latex beamer:
```latex
\begin{frame}{<Nameofyourframe>}
\begin{figure}
    \includegraphics[page=1,clip, trim={50 100 50 130},width=\textwidth]{<pathtoyourpaper>/<yourpaper.pdf>}
    \caption*{<yourcaption>}
\end{figure}
\end{frame}
```
notice that : ` trim={<left> <lower> <right> <upper>}`.

To be even more convenient, put a frame around your image, so you see much better where the image boarders are (and where the white background of your latex file begins). Therefore, you can just

`\frame{\includegraphics[page=1,clip, trim={50 100 50 130},width=\textwidth]{<pathtoyourpaper>/<yourpaper.pdf>}`

# Work with excel to make your latex tables
If I have large tables with long entries, I find it quite useful to first create it in an excel document. Once the table is finished, I create a new "latex-style" table with the excel function `CONCATENATE` witch does string concatenation, for example:
´´´
=CONCATENATE(B4, " & ")
´´´
The result looks like this: 