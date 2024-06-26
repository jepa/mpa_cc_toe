# mpa_cc_toe
Repository to explore the temperature of emergence of the global marine protected areas

# Authors

Juliano Palacios Abrantes1, Sarah M. Roberts2, William W.L. Cheung1

1 Changing Ocean Research Unit, The University of British Columbia, Vancouver CA
2 Duke University Sanford School of Public Policy, Durham NC


# Objectives

Understand the changes in performance of global marine reserves under climate change in terms of biomass

# Steps

1.- Take the world’s MPA dataset

2.- Use both pre-industrial climatology and projected scenarios (2 runs) with fishing effort

3.- Compute the “temperature of emergence”

4.- Temperature by witch compound projected signal will emerge in each marine reserve

# Repository structure

- *Data*, repository containing data needed for analysis
  - *Spatial*, related to spatial analysis

- *Funtions*, global functions needed for analysis

- *Results*, partial results from analysis

- *Scripts*, main analysis scripts
   - *data_preparation.Rmd*, works on the MPA shapefile 
   - *test_dbem_runs.Rmd*, test runs in the MPA to make sure all is working
