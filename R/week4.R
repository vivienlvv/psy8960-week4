# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl = read_delim("../data/week4.dat", delim = "-", col_names = c("casenum", "parnum","stimver","datadate", "qs"), show_col_types = FALSE)
glimpse(import_tbl)
wide_tbl = separate(data = import_tbl, col = qs, into = c("q1","q2","q3","q4","q5"), sep = " - ")
wide_tbl[,5:9] = sapply(wide_tbl[,5:9], as.integer)
wide_tbl$datadate = as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %T")
wide_tbl[,5:9][wide_tbl[,5:9] == 0] = NA




wide_tbl = wide_tbl[!is.na(wide_tbl$q2),]
long_tbl = pivot_longer(wide_tbl, cols = starts_with("q"), names_to = "question", values_to = "response")


## Notes from class demo: 02/13/2023
## Anything in the base R package is fair game now 
## Line 8: now can use paste0("q",1:5)
## Line 9: wide_tbl[5:9] will also work because dataframes are lists 
## Example of getting only integer columns wide_tbl[,sapply(wide_tbl, is.integer)]
## I was originally thinking sapply(wide_tbl[,5:9], function(x) ifelse(x == 0, NA, x))
## Another useful function is na_if(x = vector to modify, y = value to replace with NA)
## replace_na(data, replace, ...)
## Line 16: drop_na(wide_tbl, q2)
