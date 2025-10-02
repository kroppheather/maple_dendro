library(dplyr)
library(lubridate)
library(ggplot2)

dataDir <- "/Users/hkropp/Library/CloudStorage/GoogleDrive-hkropp@hamilton.edu/My Drive/research/projects/dendrometer/09_26_2025"
files <- list.files(dataDir)
startDay <- 256

weather <- read.csv("/Users/hkropp/Library/CloudStorage/GoogleDrive-hkropp@hamilton.edu/My Drive/research/projects/dendrometer/weather/z6-10463(z6-10463)-1759414179/z6-10463(z6-10463)-Configuration 1-1759414179.1743975.csv",
                    header=FALSE, skip=3)
weather$date <- mdy_hms(weather$V1)
weather$doy <- yday(weather$date)
weather$hour <- hour(weather$date)
hourlyWeather <- weather %>%
  group_by(doy, hour) %>%
  summarize(PRCP = sum(V3))
hourlyWeather$date <- as.Date(hourlyWeather$doy-1, origin="2025-01-01")
hourlyWeather$datetime <- ymd_hm(paste(hourlyWeather$date,hourlyWeather$hour,":00"))
######## sensor 1 ######
s1 <- read.table(paste0(dataDir,"/",files[1]),header=FALSE, sep=";")
s1$date <- ymd_hm(s1$V2)
s1$doy <- yday(s1$date)
s1$hour <- hour(s1$date)


hourData <- s1 %>%
  group_by(doy,hour) %>%
  summarise(WT = mean(V7),
            Temp = mean(V4))
hourData$DD <- (hourData$doy-1) + (hourData$hour/24)
hourData <- hourData %>%
  filter(DD>=startDay)  
hourData$date <- as.Date(hourData$doy-1, origin="2025-01-01")
hourData$datetime <- ymd_hm(paste(hourData$date,hourData$hour,":00"))

ggplot(hourData, aes(datetime,WT))+
  geom_line()+
  labs(title = paste("sensor",files[1]))+
  scale_x_datetime(date_breaks= "1 day")


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
  filter(DD>=startDay)  

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
  filter(DD>=startDay)  

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
  filter(DD>=startDay)  

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
  filter(DD>=startDay)  

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
  filter(DD>=startDay)  

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
  filter(DD>=startDay)  

ggplot(hourData, aes(DD,WT))+
  geom_line()+
  labs(title = paste("sensor",files[7]))

