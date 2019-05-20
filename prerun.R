#Code to run before the app is used
#Installs packages, and libraries
#Reads in csv file
#Writes to rds file

#install.packages(c("maps", "mapproj", "colorRamps", "shiny", "dplyr", "leaflet", "rgdal", "sf", "tidyverse", "readr"))
library(maps)
library(mapproj)
library(colorRamps)
library(lubridate)
library(readxl)
library(rgdal)
library(sf)
library(leaflet)
library(dplyr)
library(tidyverse)
library(readr)
library(RColorBrewer)

initial_table <- read_csv("/cloud/project/data/final_table.csv")
saveRDS(initial_table,file="/cloud/project/data/final_table.rds")
final_table <- readRDS("/cloud/project/data/final_table.rds")