# Function to aggregate data per year

aggr_data <- function(yr,spplist,scen,var){
  
  # for looping per species
  for(s in 1:length(spplist)){
    # for(s in 1:3){ # for testing
    
    
    taxa_to_read <- paste0(dbem_path,scen,"/",spplist[s],"/",spplist[s],var,yr,".txt")
    # print(taxa_to_read)
    if(file.exists(taxa_to_read) && file.size(taxa_to_read) >0){
      
      dbem_data <- fread(taxa_to_read)
      colnames(dbem_data) <- c("index","value")
      
      partial_df <- dbem_cords %>% 
        left_join(dbem_data,
                  by = "index") %>% 
        select(index,value) %>% 
        mutate(value = ifelse(is.na(value),0,value))
      
      # head(partial_df)
      # length(partial_df)
      # nrow(partial_df)
      # sum(partial_df$value,na.rm = T)
      if(nrow(partial_df)==0){
        
        next()
        
      }else{
        
        # Aggregate all spp 
        
        if(exists("final_df") == FALSE){
          
          final_df <- partial_df %>%  
            rename(total = value)
          
        }else{
          
          final_df <- left_join(final_df, # original name Final_Data_10
                                partial_df,
                                by = "index") %>% 
            mutate(total = total+value) %>% 
            select(index,total)
          
          if(s %in% c(10,50,100,250,500)){
            
            # print(paste(yr,sum(final_df$total,na.rm = T)))
          }
          
          # head(final_df)
          # length(final_df)
          # nrow(final_df)
          # sum(final_df$total,na.rm = T)
          
        } # Closes else from aggregation
        
        # Check is adding up accordingly
        # print(
        #   data.frame(c(
        #     sum(partial_df$value),
        #     sum(final_df$total),
        #     sum(final_df$total)-sum(partial_df$value)
        #   )
        #   )
        # )
        
      } # close else from spp list
    }
  } # closes spp list
  
  ## Save final data
  tcb_data_name <- paste(result_path,"agg_",var,"_",yr,".csv",sep="")
  
  save_df <- final_df %>% 
    ungroup() %>% 
    select(total)
  
  names(save_df) <- NULL
  
  fwrite(x = save_df, 
         file = tcb_data_name, 
         append = TRUE)
  
  
  print(paste("Completed year",yr, "with",nrow(save_df),"rows"))
  
} # Close function
