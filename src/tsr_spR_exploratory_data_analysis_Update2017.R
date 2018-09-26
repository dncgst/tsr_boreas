# June 2017 Update

## Total Station database

### read data
totalstation2015 <- read.csv("~/Dropbox/TSR_database/tsr_totalstation_2015.csv", header=TRUE, sep=",", skip=0)
totalstation2016 <- read.csv("~/Dropbox/TSR_database/tsr_totalstation_2016.csv", header=TRUE, sep=",", skip=0)
totalstation2017 <- read.csv("~/Dropbox/TSR_database/tsr_totalstation_2017.csv", header=TRUE, sep=",", skip=0)

totalstation_all <- rbind(totalstation2015, totalstation2016)
totalstation2017$spit <- as.integer(totalstation2017$spit)
totalstation2017$dip <- as.factor(totalstation2017$dip)
totalstation_all <- rbind(totalstation_all, totalstation2017)

write.csv(totalstation_all, "~/Dropbox/TSR/tsr_totalstation_all.csv")

totalstation_all <- read.csv("~/Dropbox/TSR/tsr_totalstation_all.csv", header=TRUE, sep=",", skip=0)

## Fossil list

### read data
#library(gdata)
#fossil_list <- gdata::read.xls("~/Dropbox/TSR/tsr_fossil_list.xlsx", sheet=1, header=TRUE)

library(readxl)
fossil_list <- readxl::read_excel("~/Dropbox/TSR/tsr_fossil_list.xlsx", sheet=1, col_names=TRUE)

## Merge & Check

### 2015
X <- totalstation_all[which(grepl("*2015", totalstation_all$date)),]
X <- subset(X, type %in% c("Bone","Tooth","Bone/Tooth", "Teeth", "Coprolite", "Collected finds"))
Y <- fossil_list[which(fossil_list$year == "2015" & fossil_list$stratified.surface == "stratified"),]
Z <- merge(X, Y, by=c("unit","id","suffix"), all.y=TRUE)
write.csv(Z, "~/Dropbox/TSR/Z.csv")

length(Z$year)


length(totalstation_all$unit[which(grepl("*2015", totalstation_all$date))])
length(X$unit[which(X$collected == "no")])
length(Y$unit[which(Y$stratified.surface == "surface")])

### 2016
X <- totalstation_all[which(grepl("*2016", totalstation_all$date)),]
X <- subset(X, type %in% c("Bone","Tooth","Bone/Tooth", "Teeth", "Coprolite", "Collected finds"))
Y <- fossil_list[which(fossil_list$year == "2016" & fossil_list$stratified.surface == "stratified"),]
Z <- merge(X, Y, by=c("unit","id","suffix"), all.x=TRUE)
write.csv(Z, "~/Dropbox/TSR/Z.csv")

###
foo <- totalstation_all[which(grepl("*2015", totalstation_all$date)),]
bar <- totalstation_all[which(grepl("*2016", totalstation_all$date)),]
X <- rbind(foo, bar)
X <- subset(X, type %in% c("Bone","Tooth","Bone/Tooth", "Teeth", "Coprolite", "Collected finds"))
Y <- fossil_list[which(fossil_list$year %in% c("2015","2016") & fossil_list$unit != ""),]
Z <- merge(X, Y, by=c("unit","id","suffix"), all.y=TRUE)
write.csv(Z, "~/Dropbox/TSR/Z.csv")