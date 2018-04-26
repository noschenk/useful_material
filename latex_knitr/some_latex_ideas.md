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
