#Before running this code set the working directory to the folder
#which contains the "specdata"

corr <- function(directory = "specdata", threshold = 10){

cur_dir <- getwd()
	dir_name <- paste(cur_dir,"/",directory, sep = "")

#list of file names
	file_list <- list.files(path = dir_name)
	id = 1:332
#define a vector to store each correlation value
	cor_dat <- NULL

  	for (n in id){
    		file_name <- file_list[n]
		file_path <- paste(dir_name,"/",file_name,sep="")
		
     		file_dat <- read.csv(file_path)

#count the total number of rows which are complete
		com_rows <- sum(complete.cases(file_dat))
		if (com_rows > threshold){
			sulf_vec <- file_dat$sulfate
			nit_vec <- file_dat$nitrate
#compute correlation
			cor_val <- cor(sulf_vec, nit_vec, use = "complete.obs")
			cor_dat <- rbind(cor_dat, cor_val)
			
		}
	}
rqd_sol <- cor_dat
 }
