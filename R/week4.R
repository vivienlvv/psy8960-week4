# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl = read_delim("../data/week4.dat", delim = "-", col_names = c("casenum", "parnum","stimver","datadate", "qs"), show_col_types = FALSE)
glimpse(import_tbl)
wide_tbl = separate(data = import_tbl, col = qs, into = paste0("q", 1:5), sep = " - ")



