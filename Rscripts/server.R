library(shiny)
library(RCurl)
require(rCharts)
library(reshape)
library(leaflet)

d <- read.csv("duddingston_survey.csv")
djson <- toJSONArray2(d, json = F)



shinyServer(function(input, output, session) {
  
  map1 <- createLeafletMap(session, 'map1')
  
}
)
