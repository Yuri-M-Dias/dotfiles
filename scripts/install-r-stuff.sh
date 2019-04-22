#!/bin/bash

# Install R
#sudo apt update
#sudo apt install gdebi libxml2-dev libssl-dev libcurl4-openssl-dev libopenblas-dev r-base r-base-dev

# Install RStudio
#cd ~/Downloads
#wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.1335-amd64.deb
#sudo gdebi rstudio-1.2.1335-amd64.deb
#printf '\nexport QT_STYLE_OVERRIDE=gtk\n' | sudo tee -a ~/.profile

# Install common packages
R --vanilla << EOF
install.packages(c("tidyverse","data.table","dtplyr","devtools","roxygen2","bit64","readr"), repos = "https://cran.rstudio.com/")
q()
EOF

# Install TDD packages
R --vanilla << EOF
install.packages("testthis")
q()
EOF

# Export to HTML/Excel
R --vanilla << EOF
install.packages(c("htmlTable","openxlsx"), repos = "https://cran.rstudio.com/")
q()
EOF

# Blog tools
R --vanilla << EOF
install.packages(c("knitr","rmarkdown"), repos='http://cran.us.r-project.org')
q()
EOF
sudo apt install python-pip
sudo apt install python3-pip
sudo -H pip install markdown rpy2==2.7.1 pelican==3.7.1
sudo -H pip3 install markdown rpy2==2.9.3 pelican==3.7.1 

# PDF extraction tools
sudo apt install libpoppler-cpp-dev default-jre default-jdk r-cran-rjava
sudo R CMD javareconf
R --vanilla << EOF
library(devtools)
install.packages("pdftools", repos = "https://cran.rstudio.com/")
install_github("ropensci/tabulizer")
q()
EOF

# TTF/OTF fonts usage
sudo apt install libfreetype6-dev
R --vanilla << EOF
install.packages("showtext", repos = "https://cran.rstudio.com/")
q()
EOF

# Cairo for graphic devices
sudo apt install libgtk2.0-dev libxt-dev libcairo2-dev
R --vanilla << EOF
install.packages("Cairo", repos = "https://cran.rstudio.com/")
q()
EOF

# Various development things
R --vanilla << EOF
library(devtools)
devtools::install_github("jalvesaq/colorout")
devtools::install_github('rstudio/rmarkdown')
install.packages("tinytex")
tinytex::install_tinytex()
remotes::install_github('yihui/xaringan')
devtools::install_github("rstudio/blogdown")
remotes::install_github("rstudio/bookdown")
remotes::install_github("ismayc/thesisdown")
q()
EOF

