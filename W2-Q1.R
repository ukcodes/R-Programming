#Set working directory to the folder containing "specdata"
pollutantmean <- function(directory = "specdata", pollutant, id =1:1){
	cur_dir <- getwd()
	dir_name <- paste(cur_dir,"/",directory, sep = "")
	file_list <- list.files(path = dir_name)
	ac_data <- NA

  	for (n in id){
    		file_name <- file_list[n]
		file_path <- paste(dir_name,"/",file_name,sep="")
		file_dat <- read.csv(file_path)
		ac_data <- rbind(ac_data,file_dat)
		
 	 }
	 
	print(mean(ac_data[[pollutant]], na.rm = TRUE))

}

