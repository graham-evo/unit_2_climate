# Graham C. McLaughlin
# 2023-02-02
###--------------------

#Finishing up Loops:
#While loops:

x <- 1
while (x>0) {
  x = x+1  
}
#Above we created an 'infinite' loop, where the condition never becomes FALSE.

x <- 4
while (x > 0) {
  x = x - 1
  print(x)
}

#Fishing game:
total_catch_lb <- 0
n_fish <- 0
while (total_catch_lb < 50) {
  n_fish = n_fish + 1
  new_fish_weight = rnorm(n = 1, mean = 2, sd = 1)
  total_catch_lb = total_catch_lb + new_fish_weight
}

n_fish
total_catch_lb

###----------------------------------------------------------------------
# Arctic Sea Ice
library("lubridate")

url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url,
                        skip=2,
                        sep=",",
                        header=FALSE,
                        col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))
head(arctic_ice)

#Changing date formatting:
arctic_ice$date = make_date(year = arctic_ice$Year, month = arctic_ice$Month, day = arctic_ice$Day)
head(arctic_ice) # We now have a date variable column that has concatonated the year month and date variable columns into a single column.

plot(Extent ~ date,
     data = arctic_ice,
     type = "l", 
     ylab = "Arctic Sea Ice Extent (x10^6 km^2",
     xlab = "Year") #Plotting the extent of ice in millions of km^2 from 1980 to present.

#Creating annual averages:

tail(arctic_ice)

#Initialized results data frame
arctic_ice_averages <- data.frame(Year=seq(min(arctic_ice$Year)+1, max(arctic_ice$Year)-1),
                                  extent_annual_avg = NA,
                                  extent_5yr_average = NA)
head(arctic_ice_averages)
tail(arctic_ice_averages)
#mean(arctic_ice$Extent[arctic_ice$Year == 1979]) #Give me only the rows where the year is 1979, and for all those rows give me the extent and then take the mean of all those rows.
#dim(arctic_ice_averages) #the data frame has 44 rows and 3 columns
#seq(dim(arctic_ice_averages)[1])
for(i in seq(from=1, to=dim(arctic_ice_averages)[1])){
  arctic_ice_averages$extent_annual_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$Year[i]])
}
head(arctic_ice_averages)

plot(extent_annual_avg~Year, data = arctic_ice_averages, type = "l")

# 5 yr average ice extent
dim(arctic_ice_averages)[1]-2

i=3
for(i in seq(from = 3, to = dim(arctic_ice_averages)[1]-2)){
  years = seq(from = arctic_ice_averages$Year[i]-2, to = arctic_ice_averages$Year[i]+2)
  arctic_ice_averages$extent_5yr_average[i] = mean(arctic_ice$Extent[arctic_ice$Year %in% years])
}

plot(extent_annual_avg~Year, data = arctic_ice_averages, type = "l")
  lines(x = arctic_ice_averages$Year, y = arctic_ice_averages$extent_5yr_average, col = "red")
  