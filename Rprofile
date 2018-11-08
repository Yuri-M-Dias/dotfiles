.First <- function() {
    options(
        repos = c(CRAN = "https://cran.rstudio.com/"),
        browserNLdisabled = TRUE,
        deparse.max.lines = 2
    )
}

if (interactive()) {
    suppressMessages(require(devtools))
    suppressMessages(require(colorout))
    suppressMessages(require(setwidth))
    library(nvimcom)
}

# Blogdown options
options(
    blogdown.ext = '.Rmd',
    blogdown.author = 'Yuri-M-Dias'
)

# This is hardcoded, but shouldn't be!!!!
Sys.setenv(
    RETICULATE_PYTHON = '/home/yuri/.pyenv/versions/anaconda3-5.2.0/envs/r-tensorflow/bin/python'
)

Sys.setenv("PKG_CXXFLAGS"="-std=c++11")
