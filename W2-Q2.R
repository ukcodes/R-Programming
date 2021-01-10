#Before running this code set the working directory to the folder
#which contains the "specdata"
complete <- function(directory = "specdata", id =1:332){
	cur_dir <- getwd()
	dir_name <- paste(cur_dir,"/",directory, sep = "")
	file_list <- list.files(path = dir_name)
	
	id_val <- NULL
	count_val <- NULL
	
  	for (n in id){
    		file_name <- file_list[n]
		file_path <- paste(dir_name,"/",file_name,sep="")
		
     		file_dat <- read.csv(file_path)

#count the total number of rows which are complete
		com_rows <- sum(complete.cases(file_dat))
		id_val <- rbind(id_val, n)
		
		count_val <- rbind(count_val, com_rows)

	
 	 }
#create a data frame with the 'id' and 'nobs' columns
	x <- data.frame("id" = id_val, "nobs" = count_val)
	x	 
	

}

