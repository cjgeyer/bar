\name{NEWS}
\title{BAR News}
\encoding{UTF-8}

\section{CHANGES IN bar version 0.3}{
    \itemize{
        \item License change to CC0
        \url{https://creativecommons.org/publicdomain/zero/1.0/legalcode}
        following discussion on the r-devel mailing list.  CRAN allows
        \dQuote{Unlimited} for license field in \code{DESCRIPTION} file
        (which is what we had before), but it is legally very unclear
        what that means.  CC0 expresses the intent with appropriate
        legalese.

        \item Moved unformatted \code{NEWS} file to to this file
        (\code{NEWS.Rd}).
    }
}


\section{CHANGES IN bar version 0.2-2}{
    \itemize{
        \item Fixed \code{NAMESPACE} file and \code{Imports} field
        of \code{DESCRIPTION} file
        to explicitly import stuff from base R but not in the 
        base package (in this case \code{lm}, \code{model.matrix},
        and \code{model.response} imported from package \code{stats}).
        New requirement in R-3.3.0
    }
}

