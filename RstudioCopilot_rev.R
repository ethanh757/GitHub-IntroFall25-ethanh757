#The goal of this assignment Verify you can use Microsoft Copilot / GitHub Copilot Chat alongside RStudio 
#to accelerate—but not replace—your coding.

# ------------------------------
# 1) Paths & file I/O
# ------------------------------

# 1.1 Set working directories -------------------------------------------------
# EDIT THESE for your environment
traindir <- "C:/Users/17574/Desktop/SYS 3501/Data"
sourcedir <- "C:/Users/17574/Desktop/SYS 3501/Source"

stopifnot(dir.exists(traindir))
setwd(traindir)
message("Working directory set to: ", getwd())

# 1.3 Safe CSV read helper ----------------------------------------------------
safe_read <- function(file) {
  # Matches read.csv defaults from class, but robust NA handling
  read.csv(file, na.strings = c("", "NA", "N/A"," NA", "NA "), stringsAsFactors = FALSE)
}

# 1.4 Read the accident CSV ------------------------------------------------
totacts <- safe_read("Railroad_Equipment_Accident_Incident_Source_Data__Form_54__20250907.csv")
# ------------------------------
#Filter the data to include only accidents that occurred between the years 2021 and 2024 and name the new dataframe totacts2124
totacts2124 <- subset(totacts, YEAR >= 2021 & YEAR <= 2024)
totacts2124
#Yes it worked as directed. It filtered the data to only inlcudes year 2021 to 2024 and named it correctly
#Create a new column in the totacts2124 dataframe that sums TOTINJ + TOTKLD for each accident. Call the column CASINJ.
totacts2124$CASINJ <- totacts2124$TOTINJ + totacts2124$TOTKLD
#print
totacts2124
#No, it did not work as intended, it created a new column but it did not sum the two columns, it just copied the values from TOTINJ, and did not create a new variable.
#Convert the two-digit IYR year column to a four-digit year column. Call the new column YEAR.
totacts2124$YEAR <- ifelse(totacts2124$IYR >= 50, 1900 + totacts2124$IYR, 2000 + totacts2124$IYR)
#print
totacts2124
#Yes, it worked as intended, it converted the two-digit year to a four-digit year correctly.
#What are the new dimensions of the dataframe totacts2124?
dim(totacts2124)
#Yes, it worked as intended, it described the dimensions of the the dataframe.