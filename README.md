# Drawio & latex

___

image docker para la elaboración de documentación. Se exportan los diagramas a image _*.png_ y se añade la referencia al fichero _*.tex_.

## Directory for _drawio_ files

    ./diagrams/


## Example

Create a single document in root directory, for example:

    document.tex

With content:

```latex
\documentclass{article}
\usepackage{graphicx}
\graphicspath{ {diagrams/img/} }

\title{Documentation - Example}

\begin{document}

    \textit{Large Example document}

    \begin{figure}
      \centering
        \includegraphics[scale=0.9]{example1}
    \end{figure}
    
\end{document}
```

Run:

```
docker-compose -f docker/docker-compose.yml run --rm drawio_and_latex document.tex
```