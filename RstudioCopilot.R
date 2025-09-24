#The goal of this assignment Verify you can use Microsoft Copilot / GitHub Copilot Chat alongside RStudio 
#to accelerate—but not replace—your coding.

# ------------------------------
# 1) Paths & file I/O
# ------------------------------

# 1.1 Set working directories -------------------------------------------------
# EDIT THESE for your environment
traindir <- "~/Google Drive/UVA/Courses/ProgSIE/Data/TrainData/"
sourcedir <- "~/Google Drive/UVA/Courses/ProgSIE/Code/"

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


