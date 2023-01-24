# Graham C. McLaughlin
# 2023-01-23
# Unit 2, Tutorial 1, Melting Ice Sheets From Grace Satellite Mission Data

#First things first, we want to read in our data from NASA's website:
ant_ice_loss <- read.table("data/antarctica_mass_200204_202209.txt", skip = 31, sep = "", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt")) #Antarctica Ice Sheet Loss Data
grn_ice_loss <- read.table("data/greenland_mass_200204_202209.txt", skip = 31, sep = "", header = FALSE, col.names = c ("decimal_date", "mass_Gt", "sigma_Gt")) #Greenland Ice Mass Loss Data

#Plot Data
plot(x = ant_ice_loss$decimal_date, ant_ice_loss$mass_Gt, type = "l", xlab = "Year", ylab = "Antarctic Ice Loss (Gt)") #Plotting X and Y manually by defining each variable
lines(mass_Gt~decimal_date, data = grn_ice_loss) #You can run this lines() funciton and it will add a line to your plot that is ALREADY open in your plot window.

min(grn_ice_loss$mass_Gt) #Gives me the min axis so i can know when exactly to specify the limits of the y-axis
range(grn_ice_loss$mass_Gt) #range() gives the max and min
plot(mass_Gt~decimal_date, data = ant_ice_loss, type = "l", xlab = "Year", ylab = "Antarctic Ice Loss (Gt)", ylim = range(grn_ice_loss$mass_Gt)) #Plotting X as a function of Y and defining the limits of the y-axis. I can use the range as a function within the ylim parameter.
lines(mass_Gt~decimal_date, data = grn_ice_loss, col = "red") 

#Add data break between Grace Satellite mission to be more transparent in my plot.
#Last first data point for first 
data_break <- data.frame(decimal_date = 2018.0, mass_Gt = NA, sigma_Gt = NA)

#Insert data_break into ice loss data frame:
ant_ice_loss_with_break <- rbind(ant_ice_loss, data_break)
grn_ice_loss_with_break <- rbind(grn_ice_loss, data_break)

dim(ant_ice_loss) #213 rows
dim(ant_ice_loss_with_break) #214 rows now, because we added the 2018 NA break.

order(ant_ice_loss_with_break$decimal_date)
ant_ice_loss_with_break <- ant_ice_loss_with_break[order(ant_ice_loss_with_break$decimal_date), ]

grn_ice_loss_with_break <- grn_ice_loss_with_break[order(grn_ice_loss_with_break$decimal_date), ]

#Lets try to plot this with the new break in data:

pdf('figures/ice_mass_trends.pdf', width = 7, height = 5) #Specifying device type
plot(mass_Gt~decimal_date, data = ant_ice_loss, type = "l", xlab = "Year", ylab = "Antarctic Ice Loss (Gt)", ylim = range(grn_ice_loss$mass_Gt)) 
lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data = ant_ice_loss_with_break, lty = "dashed")
lines((mass_Gt - 2*sigma_Gt) ~ decimal_date, data = ant_ice_loss_with_break, lty = "dashed")
dev.off() #Save

#Bar plot of total ice loss
tot_ice_loss_ant <- min(ant_ice_loss_with_break$mass_Gt, na.rm = TRUE) - max(ant_ice_loss_with_break$mass_Gt, na.rm = TRUE)
tot_ice_loss_grn <- min(grn_ice_loss_with_break$mass_Gt, na.rm = TRUE) - max(grn_ice_loss_with_break$mass_Gt, na.rm = TRUE)

barplot(height = -1*c(tot_ice_loss_ant, tot_ice_loss_grn), 
        names.arg = c("Antarctica", "Greenland"))
