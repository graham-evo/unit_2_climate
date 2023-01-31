# Graham C. McLaughlin
# 2023-01-26
# Logical, boolean, if/else

vec <- c(1,0,2,1)
vec[c(TRUE, FALSE, TRUE, FALSE)] #only spits out the values from the vector for which the logical operator expressed TRUE.

x = 3 # is an assignment, I want x to be assigned the value 3.
x == 3 # is a test, is x equal to 3.

#Practice logical operators
1 > 2 #?
1 > c(0, 1, 2) #Evaluates all numbers in the vector and spits out a logical vector

c(1,2,3) > c(3,2,1) #Evaluates first index to first index, second index, third index

c(1,2,3) == c(3,2,1)

1 %in% c(1,2,3) #Does the value 1 exist somewhere within the vector 1,2,3? Yes.

c(1,3,5,7) %in% c(1,2,3) #Does 1 exist in the second vector? yes. Does 3 exist in the second vector? yes.Does 5 exist in the second vector? no.

#Loading in test data frame
world_oceans = data.frame(oceans = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))

world_oceans$avg_depth_m > 4000 #Are the 5 oceans contained in the data frame greater than 4000 meters. Only two are --> pacific and southern

deep_oceans <- world_oceans[world_oceans$avg_depth_m > 4000, ] #Creates a subset of just the oceans that meet the criteria of > 4000 meters
#Remember subsetting with the [] goes rows, columns.

sum(world_oceans$avg_depth_m > 4000) #Sum() coerces the logical vector into 0's and 1's. In this case there are 2 TRUE's (2 1's = 2).

#Imprecise numerics
(1+2) == 3 #TRUE
0.1+0.2 == 0.3 #All numbers in machine code are stored in binary. In this case 0.1 is not exactly 0.1
0.3 - (0.1+0.2) #Almost equal but not quite

any() #If any of these conditions are true within a vector, it evaluates a TRUE
all() #all of these conditions must be true within a vector to evaluate a TRUE

#Boolean operator practice
x <- 5

x > 3 & x < 15 #yes, 5 > 3 and 5 < 15

x < 3 | x > 15 #no, 5 is not less than 3 nor is 5 greater than 15

x < 10 & x %in%c(1,2,3)

#subset
world_oceans[world_oceans$avg_depth_m>4000 & world_oceans$area_km2<50e6, ]


z <- c(TRUE, FALSE, FALSE)
any(z) #Are any of the indices in z TRUE, yes.
all(z) #Are all of teh indices in z TRUE, no. 

#Handling missing data
NA == NA
is.na(z) #Asks is there any missing data within my data.frame, vector, matrix, list, etc.

vec <- c(0,1,2,NA,4)
is.na(vec) #outputs a vector of TRUE / FALSES
any(is.na(vec)) #Tells you, are there any NA's in my data? yes.


#-------------------------------------------------------------------
#------Starting if/else statements----------------------------------
#-------------------------------------------------------------------


if {this} {
  that
}

num <- -2

if (num < 0) {
  print("oh no, num is negative!!")
  num = num*-1
  print("Dont worry i made it positive")
}
num #Since num was -2 which was less than 0, it multiplied -2 by -2 and returned a 2

#Exercise 3.1
temp <- 98.4

if(temp > 98.4) {
  print(temp - 98.6)
  print("You have a fever") {
    if(temp > 101) {
      print("You have a high fever!")
    }
  }

if (this) {
  Plan A
  else () {
    Plan B
  }
}
grade <- 44
if(grade >= 60) {
  print("You Pass!")
} else {
  print("You FAIL")
}

#Exercise
n_donuts <- 11
if(n_donuts < 12) {
  print("You have less than one dozen donuts!")
} if else(n_donuts == 12) {
  print("You have a dozen donuts!")
  if else(donuts == 13) {
  print("You have a baker's dozen of donuts!")
    else {"You have more than a bakers dozen of donuts!"}
  }
}
  
#ifelse()
a <- 0.00
ifelse(a!=0, 1/a, NA)  
  