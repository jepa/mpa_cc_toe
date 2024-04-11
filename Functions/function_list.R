# Personalized functions needed for the data analysis


load_pkg <- function(pkg_list){
  new.pkg <- pkg_list[!(pkg_list %in% installed.packages()[, 
                                                           "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE, repos = "http://cran.us.r-project.org")
  sapply(pkg_list, require, character.only = TRUE)
}


load_dbem <- function(scenario, cat = "Catch"){
  
  # List of modeled species
  files_to_read <- list.files(MyFunctions::my_path("D","Raw/",scenario),pattern = cat)
  
  
  for(s in 1:length(files_to_read)){
  # for(s in 1:5){
    
    load(paste0("/Users/jepa88/Library/CloudStorage/OneDrive-UBC/Data/mpa_cc_toe/Data/Raw/",scenario,"/",files_to_read[s]))
    
    taxon <- str_sub(files_to_read[s],1,6)
    print(taxon)
    
    mpa_df <- as.data.frame(data)
    colnames(mpa_df) <- seq(1851,2100,1)
    rm(data)
    
    dbem_df <- mpa_df %>% 
      rowid_to_column("index") %>% 
      gather("year","value",`1851`:`2100`) %>% 
      mutate(taxon_key = taxon)
    
    
    if(s == 1){
      final_df <- dbem_df
    }else{
      final_df <- bind_rows(final_df,dbem_df)
    }
    
  }
  
  
  return(final_df)
  
}
