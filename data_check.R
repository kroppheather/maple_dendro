library(dplyr)
library(lubridate)
library(ggplot2)

dataDir <- "/Users/hkropp/Library/CloudStorage/GoogleDrive-hkropp@hamilton.edu/My Drive/research/projects/dendrometer"
files <- list.files(dataDir)
######## sensor 1 ######
s1 <- read.table(paste0(dataDir,"/",files[1]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7))
hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=244.6667)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[1]))


######## sensor 2 ######
s1 <- read.table(paste0(dataDir,"/",files[2]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7))
hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=244.6667)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[2]))

######## sensor 3 ######
s1 <- read.table(paste0(dataDir,"/",files[3]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7))
hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=244.6667)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[3]))

######## sensor 4 ######
s1 <- read.table(paste0(dataDir,"/",files[4]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7))
hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=244.6667)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[4]))

######## sensor 5 ######
s1 <- read.table(paste0(dataDir,"/",files[5]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7))

hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=244.6667)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[5]))

######## sensor 6 ######
s1 <- read.table(paste0(dataDir,"/",files[6]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7))

hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=244.6667)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[6]))

######## sensor 7 ######
s1 <- read.table(paste0(dataDir,"/",files[7]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7))

hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=244.6667)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[7]))

