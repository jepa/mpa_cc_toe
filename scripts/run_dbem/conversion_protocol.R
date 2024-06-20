# Settings file for converting DBEM
# .txt files to .Rdata files
# Juliano Palacios

# Load required functions
library(here)
library(tidyverse)

# Variables to be converted (Abundace or Catch)
variables <- c("Abd")

# Partial fix for not working species
# spplist <- dplyr::filter(spplist, V1 %in% c("603310","604708"))

# Determine the start and end year you want to include
stryr <- 1851
endyr <- 2100

# Scenario to call (Note this will determine the results directory)
scen <- "c6gfdl26f1mpanow"

# Include here the path of your DBEM raw outputs BEFORE the scenario
dbem_outputs <- list.files("/home/jepa/scratch/Results/c6gfdl26f1mpanow/")

# Load required functions
# source(here("support_fx/convert_fx.R")) # Load a bunch of packages
source("/home/jepa/projects/def-wailung/dbem/support_fx/convert_fx.R")

# Call function for scenarios in Settings file
lapply(variables,
       convert_fx,
       year_one = stryr,
       year_end = endyr,
       scen = scen,
       csv_path = dbem_outputs
)
