library(dplyr)

### DELIVERABLE 1 ###
mecha_car_mpg <- read.csv(file='MechaCar_mpg.csv',check.names = F, stringsAsFactors = F)

# Perform linear regression that predicts the mpg of MechaCar prototypes
linear <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_car_mpg)
summary(linear)

#Residual standard error: 8.774 on 44 degrees of freedom
#Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
#F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11


### DELIVERABLE 2 ###

sus_coil <- read.csv(file='Suspension_Coil.csv',check.names = F, stringsAsFactors = F)
lot_summary <- sus_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
#     Mean      Median   Variance       SD
#     1498.78   1500     62.29356     7.892627

lot_summary <- sus_coil %>% group_by(Manufacturing_Lot)  %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

#Manufacturing_Lot  Mean Median Variance     SD
#  <chr>             <dbl>  <dbl>    <dbl>  <dbl>
# Lot1              1500   1500     0.980  0.990
# Lot2              1500.  1500     7.47   2.73 
# Lot3              1496.  1498.  170.    13.0  


### DELIVERABLE 3 ###

# Calculate Independent (Two Sample) T-Test

population1 = subset(sus_coil, Manufacturing_Lot == 'Lot1')
mean(population1[['PSI']])

population2 = subset(sus_coil, Manufacturing_Lot == 'Lot2')
mean(population2[['PSI']])

population3 = subset(sus_coil, Manufacturing_Lot == 'Lot3')
mean(population3[['PSI']])


# Determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
t.test(sus_coil$PSI, mu = 1500)


t.test(population1$PSI, mu = 1500) 
# p-value = 1,t = 0,
t.test(population2$PSI, mu = 1500)
# p-value = 0.6072,t = 0.51745
t.test(population3$PSI, mu = 1500)
# p-value = 0.04168,t = -2.0916,