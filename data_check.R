library(dplyr)
library(lubridate)
library(ggplot2)
library(patchwork)

plotDir <- "/Users/hkropp/Library/CloudStorage/GoogleDrive-hkropp@hamilton.edu/My Drive/research/projects/dendrometer/plots/09_26_2025"

dataDir <- "/Users/hkropp/Library/CloudStorage/GoogleDrive-hkropp@hamilton.edu/My Drive/research/projects/dendrometer/09_26_2025"
files <- list.files(dataDir)
fileNames <- gsub(".csv","",files)
startDay <- 256

weather <- read.csv("/Users/hkropp/Library/CloudStorage/GoogleDrive-hkropp@hamilton.edu/My Drive/research/projects/dendrometer/weather/z6-10463(z6-10463)-1759414179/z6-10463(z6-10463)-Configuration 1-1759414179.1743975.csv",
                    header=FALSE, skip=3)
weather$date <- mdy_hms(weather$V1)
weather$doy <- yday(weather$date)
weather$hour <- hour(weather$date)
hourlyWeather <- weather %>%
  group_by(doy, hour) %>%
  summarize(PRCP = sum(V3))%>%
  filter(doy > startDay & doy < 270)
hourlyWeather$date <- as.Date(hourlyWeather$doy-1, origin="2025-01-01")
hourlyWeather$datetime <- ymd_hm(paste(hourlyWeather$date,hourlyWeather$hour,":00"))

######## make basic QA plots ######
for(i in 1:7){
  s1 <- read.table(paste0(dataDir,"/",files[i]),header=FALSE, sep=";")
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
  
  hourFacet <- data.frame(datetime=c(hourData$datetime, hourData$datetime, hourlyWeather$datetime),
                          data=c(hourData$WT, hourData$Temp, hourlyWeather$PRCP),
                          type=c(rep("delta T", nrow(hourData)),
                                 rep("Temp", nrow(hourData)),
                                 rep("Precip", nrow(hourlyWeather))))
  
  dendro <- ggplot(hourData, aes(datetime,WT))+
    geom_line()+
    labs(title = paste("sensor",fileNames[i]))+
    scale_x_datetime(date_breaks= "1 day")
  
  temp <- ggplot(hourData, aes(datetime,Temp))+
    geom_line()+
    labs(title = paste("sensor",fileNames[i]))+
    scale_x_datetime(date_breaks= "1 day")
  
  precip <- ggplot(hourlyWeather, aes(datetime,PRCP))+
    geom_col()+
    labs(title = paste("sensor",fileNames[i]))+
    scale_x_datetime(date_breaks= "1 day")
  
  panels <- dendro / temp / precip
  png(paste0(plotDir,"/",fileNames[i],".png"),width=11,height=11, res=200, units="in")
    print(panels)
  dev.off()
}



