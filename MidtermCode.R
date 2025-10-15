
#utn3mn

housingdir <- "C:/Users/17574/Desktop/SYS 3501/Data"
sourcedir <- "C:/Users/17574/Desktop/SYS 3501/Source"

setwd(housingdir)
housing <- read.csv("housing-prices.csv")
housing
#what is the row index of the least exspencive house?
which.min(housing$price)
#What is the square footage of the most expensive house?
which.max(housing-prices$price)
housing[which.max(housing$price), "sqft"]
#make a box plot for Size
boxplot(housing$Size, main="Boxplot of Square Footage", ylab="Size")
#how many Size outliers are there?
outliers <- boxplot.stats(housing$Size)$out
outliers
#create new dataframe only including the outliers
size_outliers <- housing[housing$Size %in% outliers, ]
size_outliers
#what is the mean size of the outliers
mean(size_outliers$Size)
#what is the mean price of the outliers
mean(size_outliers$Price)
#create a box plot for bath in the size_outliers dataframe
boxplot(size_outliers$Baths, main="Boxplot of Bathrooms in Size Outliers", ylab="Baths")
#Use a scatter plot matrix or individual scatter plots to determine the variable in the data set that has the strongest linear relationship with Size with the housing dataframe
pairs(housing[,c("Rooms","Baths","Size","Age", "Price")], main="Scatterplot Matrix of Housing Data")
#what is the correlation coefficient between Size and Price
cor(housing$Size, housing$Price, use="complete.obs")
#what is the correlation coefficient between Size and Rooms
cor(housing$Size, housing$Rooms, use="complete.obs")
#what is the correlation coefficient between Size and Baths
cor(housing$Size, housing$Baths, use="complete.obs")
#what is the correlation coefficient between Size and Age
#create a histogram of Size
hist(housing$Size, main="Histogram of Square Footage", xlab="Size", breaks=20)
# sum of Price for all Old homes in the data set
sum(housing[housing$Age == "Old", "Price"])
#Make a frequency heat map of Baths and Rooms, convert both Rooms and Baths to a categorical variable.
library(ggplot2)
housing$Rooms <- as.factor(housing$Rooms)
housing$Baths <- as.factor(housing$Baths)
ggplot(housing, aes(x=Rooms, y=Baths)) + geom_bin2d() + scale_fill_gradient(low="white", high="blue") + labs(title="Frequency Heat Map of Rooms and Baths", x="Rooms", y="Baths")


# Install It
install.packages("VIM")
# Load the VIM library
library(VIM)

# Load the airquality dataset
data("airquality")

# "airquality" loaded into your working environment. Display the first few rows of the dataset
head(airquality)
# Does Wind have any NA values
sum(is.na(airquality$Wind))
#Does Ozone have any NA values
sum(is.na(airquality$Ozone))
#Does Temp have any NA values
sum(is.na(airquality$Temp))
#Does Month have any NA values
sum(is.na(airquality$Month))
#Does Day have any NA values
sum(is.na(airquality$Day))
#Which month has the highest average temperature over all days
aggregate(Temp ~ Month, data=airquality, mean, na.rm=TRUE)
#Create a histogram for Solar.R in the dataset
hist(airquality$Solar.R, main="Histogram of Solar Radiation", xlab="Solar Radiation", breaks=20)
#what is the maximum value of Solar.R
max(airquality$Solar.R, na.rm=TRUE)
#How many values are less than 100 for Solar.R
sum(airquality$Solar.R < 100, na.rm=TRUE)
#is Solar.R normally distributed
shapiro.test(airquality$Solar.R)
#Draw scatterplot matrix for "Ozone", "Solar.R", "Wind", "Temp" 
pairs(airquality[,c("Ozone","Solar.R","Wind","Temp")], main="Scatterplot Matrix of Air Quality Data")
#what is the correlation between Wind and Solar.R
cor(airquality$Wind, airquality$Solar.R, use="complete.obs")
#what is the correlation between Temp and Ozone
cor(airquality$Temp, airquality$Ozone, use="complete.obs")
#what is the correlation between Wind and Ozone
cor(airquality$Wind, airquality$Ozone, use="complete.obs")
#what is the correlation between Temp and Wind
cor(airquality$Temp, airquality$Wind, use="complete.obs")
#what is the correlation between Wind and Ozone
cor(airquality$Wind, airquality$Ozone, use="complete.obs")
#What has the strongest correlation with Wind
cor(airquality$Wind, airquality$Solar.R, use="complete.obs")
cor(airquality$Wind, airquality$Ozone, use="complete.obs")
cor(airquality$Wind, airquality$Temp, use="complete.obs")
#Make a histogram of Ozone
hist(airquality$Ozone, main="Histogram of Ozone", xlab="Ozone", breaks=20)
#make a histogram of Temp
hist(airquality$Temp, main="Histogram of Temperature", xlab="Temperature", breaks=20)
#make a histogram of wind
hist(airquality$Wind, main="Histogram of Wind", xlab="Wind", breaks=20)
#make a histogram of Solar.R
hist(airquality$Solar.R, main="Histogram of Solar Radiation", xlab="Solar Radiation", breaks=20)
#Create box plots for "Wind" by "Month" to visualize the distribution of Wind across different Months
boxplot(Wind ~ Month, data=airquality, main="Boxplot of Wind by Month", xlab="Month", ylab="Wind")
# Does Solar.R follow a normal distribution
shapiro.test(airquality$Solar.R)
# Does Temp follow a normal distribution
shapiro.test(airquality$Temp)
# Does Ozone follow a normal distribution
shapiro.test(airquality$Ozone)
#Make a Solar.R histogram
hist(airquality$Solar.R, main="Histogram of Solar Radiation", xlab="Solar Radiation", breaks=20)
#what does skew mean
#Skewness is a measure of the asymmetry of the probability distribution of a real-valued random variable about its mean. In simpler terms, it indicates whether the data points are more concentrated on one side of the mean than the other. A distribution can be:
# Positively skewed (right-skewed): The right tail (higher values) is longer or fatter than the left tail. In this case, the mean is typically greater than the median.
# Negatively skewed (left-skewed): The left tail (lower values) is longer or fatter than the right tail. In this case, the mean is typically less than the median.
#if a histogram is skewed to the left, what does that look like?
#If a histogram is skewed to the left (negatively skewed), it means that the left tail of the distribution is longer or fatter than the right tail. In this case, the majority of the data points are concentrated on the higher end of the scale, with fewer data points on the lower end. The mean is typically less than the median in a left-skewed distribution.
