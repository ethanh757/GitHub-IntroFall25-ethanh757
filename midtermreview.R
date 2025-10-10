

housingdir <- "C:/Users/17574/Desktop/SYS 3501/Data"
sourcedir <- "C:/Users/17574/Desktop/SYS 3501/Source"
setwd(housingdir)
safe_read <- function(file) {
  # Matches read.csv defaults from class, but robust NA handling
  read.csv(file, na.strings = c("", "NA", "N/A"," NA", "NA "), stringsAsFactors = FALSE)
}

# 1.4 Read the accident CSV ------------------------------------------------
# Update filename/date as needed
totacts <- safe_read("housing.csv")
totacts

#make a box plot for the housing data
boxplot(totacts$price, main="Boxplot of Housing Prices", ylab="Price")
#how many price outliers are there?
outliers <- boxplot.stats(totacts$price)$out
outliers
#what is the value of the upper whisker of price?
upper_whisker <- boxplot.stats(totacts$price)$stats[5]
upper_whisker
#make a scatterplot that shows which variable has the most linear relationship with price
plot(totacts$sqft, totacts$price, main="Scatterplot of Price vs. Sqft Living", xlab="Sqft Living", ylab="Price")
plot(totacts$bedrooms, totacts$price, main="Scatterplot of Price vs. Bedrooms", xlab="Bedrooms", ylab="Price")
plot(totacts$baths, totacts$price, main="Scatterplot of Price vs. Bathrooms", xlab="Bathrooms", ylab="Price")

#make a scatter plot matrix to identify the correlation coefficient between price and sqft
pairs(totacts[,c("price","sqft","bedrooms","baths")], main="Scatterplot Matrix of Housing Data")
#what is the correlation coefficient between price and sqft?
cor(totacts$price, totacts$sqft, use="complete.obs")
#what is the correlation coefficient between bathrooms and bedrooms?
cor(totacts$baths, totacts$bedrooms, use="complete.obs")
#Generate a boxplot of bedrooms
boxplot(totacts$bedrooms, main="Boxplot of Bedrooms", ylab="Bedrooms")
# what are rows have the three highest prices?
totacts[order(-totacts$price),][1:3,]
#what are all the homes located in oxnard?
totacts[totacts$city == "Oxnard",]
c <- 179000+180000+240000+408000
c
#How many levels are there for the City variable?
length(unique(totacts$city))

#Which city has the highest combined price?
aggregate(price ~ city, data=totacts, sum)

safe_read <- function(file) {
  # Matches read.csv defaults from class, but robust NA handling
  read.csv(file, na.strings = c("", "NA", "N/A"," NA", "NA "), stringsAsFactors = FALSE)
}

# 1.4 Read the accident CSV ------------------------------------------------
# Update filename/date as needed
totacts <- safe_read("pima-indians-diabetes.csv")
totacts
#What columns contain zeroes?
colSums(totacts == 0, na.rm = TRUE)
#replace all zeroes with NA in all the columns besides pregnancies and class
totacts[,c("plasmaglucose","dbp","tricep","insulin","bmi","diabetesped","age")] <- lapply(totacts[,c("plasmaglucose","dbp","tricep","insulin","bmi","diabetesped","age")], function(x) ifelse(x == 0, NA, x))
totacts
#how many missing values are there in total?
sum(is.na(totacts))
#What is the total percentage of missing values in the dataset?
sum(is.na(totacts))/(nrow(totacts)*ncol(totacts))*100
#How many rows have zero missing data?
nrow(na.omit(totacts))
