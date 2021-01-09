pollutantmean <- function(directory = "specdata", pollutant, id =1:1){
	cur_dir <- getwd()
	dir_name <- paste(cur_dir,"/",directory, sep = "")
	file_list <- list.files(path = dir_name)
	##avg_track <-0
	##counter = 0
	ac_data <- NA

  	for (n in id){
    		file_name <- file_list[n]
		file_path <- paste(dir_name,"/",file_name,sep="")
		##print(file_name)
     		file_dat <- read.csv(file_path)
		ac_data <- rbind(ac_data,file_dat)
		##pm_avg <- mean(file_dat[[pollutant]], na.rm = TRUE)
		##print(pm_avg)
    		##avg_track <- avg_track + pm_avg
		##print(avg_track)
		##counter = counter + 1
		##print(counter)
 	 }
	##print(avg_track/counter) 
	print(mean(ac_data[[pollutant]], na.rm = TRUE))

}

