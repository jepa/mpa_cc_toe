# Settings file for converting DBEM
# .txt files to .Rdata files
# Juliano Palacios

# Load required functions
library(here)
library(tidyverse)

# Variables to be converted (Abundace or Catch)
category <- c("Abd")

# Partial fix for not working species
# spplist <- dplyr::filter(spplist, V1 %in% c("603310","604708"))

# Determine the start and end year you want to include
stryr <- 1851
endyr <- 2100

# Scenario to call (Note this will determine the results directory)
scenario <- "c6gfdl26f1mpanow"

# Include here the path of your DBEM raw outputs BEFORE the scenario
taxon_list <- list.files("~/scratch/Results/c6gfdl26f1mpanow/",full.names = F)

# path to save R data
r_path <- "~/scratch/Results/R/"#output_path

# Load required functions
source("~/projects/def-wailung/jepa/dbem/support_fx/txt_to_rdata_fx.R")


# Call function for scenarios in Settings file
lapply(taxon_list, 
       dbem_txt_to_rdata, 
       year_one = stryr,
       year_end = endyr,
       scenario = scenario,
       output_path = r_path,
       category = category)
