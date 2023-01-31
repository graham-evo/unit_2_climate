# 2020-01-31
# Graham McLaughlin
# CO2 Mauna Loa: Examining global atmospheric CO2 trends
# Skills: Reading in .txt files, plotting, saving figures, conditional statements, subsetting

#Lets begin by loading in the NASA melting global CO2 data.
#We can do this directly with this ftp url:

url <- 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
co2 <- read.table(url, col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonlized", "n_days", "st_dev_days", "monthly_mean_uncertainty"))

#Lets explore the data
class(co2)
head(co2) #prints the first 6 rows
summary(co2) #gives type-specific summary stats for each column

#We can find when the data started to be recorded and when it was stopped being recorded:
range(co2$decimal_date) # 1958-2002
max(co2$monthly_average)

plot(monthly_average ~ decimal_date, type = "l", data = co2, ylab = "CO2 ppm", xlab = "Year", main = "Keeling Curve") +
  lines(y = co2$deseasonlized, x = co2$decimal_date, col = "red")

#one of many ways to save a figure in R:
pdf('figures/keelingCurve.pdf', width=7, height=5)
plot(monthly_average ~ decimal_date, type="l", data=co2, ylab="CO2 ppm", xlab="Year", main="Keeling Curve") + 
  lines(y=co2$deseasonalized, x=co2$decimal_date, col="red")
dev.off()

#Closer look at the deseasonalized data:
#We can subtract the deseasonalized CO2 to look at the seasonal variation
co2$seasonal_cycle <- co2$monthly_average - co2$deseasonlized #Created a new column called 'seasonal_cycle' which is equal to monthly average - deseasonalized
head(co2) #Check to make sure column was added
plot(seasonal_cycle ~ decimal_date, type = "l", data=co2)

#Lets subset this plot to the most recent 5 years
co2[1,3] #option 1 to give us the third row of the first column
co2$year[3] #option 2

co2[,2] #Gives us the entire second column?
co2$month #gives us entire second column

co2[c(1:6),] #gives us the first 6 rows of every column

#We can also subset data using a boolean (T/F) statement:
summary(co2$decimal_date > 2016) #Gives us a vector of true and falses
summary(which(co2$decimal_date > 2016))

#subsetting using boolean expression:
co2_2017to2020 <- co2[co2$decimal_date > 2016,]

plot(seasonal_cycle ~ decimal_date, type = "l", data = co2_2017to2020)

co2_1959and2020 <- co2[co2$decimal_date < 1960 | co2$decimal_date > 2019,]
class(co2_1959and2020)
plot(seasonal_cycle ~ decimal_date, type="l", data = co2_1959and2020)

