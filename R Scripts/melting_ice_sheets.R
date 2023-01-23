# Graham C. McLaughlin
# 2023-01-23
# Unit 2, Tutorial 1, Melting Ice Sheets

#First things first, we want to read in our data from NASA's website:
ant_ice_loss <- read.table("data/antarctica_mass_200204_202209.txt", skip = 31, sep = "", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt")) #Antarctica Ice Sheet Loss Data
grn_ice_loss <- read.table("data/greenland_mass_200204_202209.txt", skip = 31, sep = "", header = FALSE, col.names = c ("decimal_date", "mass_Gt", "sigma_Gt")) #Greenland Ice Mass Loss Data

