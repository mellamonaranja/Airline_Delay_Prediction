library(dplyr)
library(tidyr)
library(ggplot2)
install.packages('vioplot')
library(vioplot)
install.packages('ascii')
library(ascii)
install.packages('corrplot')
library(corrplot)
install.packages('descr')
library(descr)
install.packages('stat_binhex')

PSDS_PATH=file.path('/Users/joohyunyoon/workspace/Airline Delay Prediction/')
dfw=read.csv(file.path(PSDS_PATH, 'data', 'dfw_airline.csv'))
airline_stats=read.csv(file.path(PSDS_PATH, 'data', 'airline_stats.csv'), stringsAsFactors = FALSE)
airline_stats$airline=ordered(airline_stats$airline, levels=c('Alaska', 'American', 'Jet Blue', 'Delta', 'United', 'Southwest'))

#Explore Binary and Categorical data
barplot(as.matrix(dfw)/6, cex.axis = 0.8, cex.names = 0.7)
               
#Categorical Variable VS Numeric Variable
boxplot(pct_carrier_delay~airline, data=airline_stats,ylim=c(0,50)) 
##25% IQR of American is even higher than 75%IQR of Alaska, airline delay
               
ggplot(data=airline_stats, aes(airline, pct_carrier_delay))+
    ylim(0, 50) + 
    geom_violin() +
    labs(x="", y="Daily % of Delayed Flights")+
    geom_boxplot() 
##Alaska, Delta data is almost close to 0, it cannot figure out at boxplot

