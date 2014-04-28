library(shiny)
library(RCurl)
require(rCharts)
library(reshape)
library(leaflet)

d <- read.csv("duddingston_survey.csv")
djson <- toJSONArray2(d, json = F)



shinyServer(function(input, output, session) {
  
  # Create the map 
map <- createLeafletMap(session, "map")



  
  mapLatLon <- reactive({
    eval(parse(text=paste("d[d$Site == \"", input$dataset, "\", 10:11]",sep="")))
  })
  
  
  output$myMap <- renderMap({
    map <- Leaflet$new()
    map$geoJson(toGeoJSON(djson, lat = 'realLat', lon = 'realLon'),
                onEachFeature = '#! function(feature, layer){
                layer.bindPopup(feature.properties.Site)
  } !#',
                pointToLayer =  "#! function(feature, latlng){
               return L.circleMarker(latlng, {
               radius: 4,
               fillColor: feature.properties.Color || 'red',    
               color: '#000',
               weight: 1,
               fillOpacity: 0.8,
               })
               } !#"
                
    )
    
    latLon <- mapLatLon()
    map$setView(c(latLon[,2], latLon[,1]), zoom = 15)
    map$tileLayer("http://{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png")
    map$set(height = '250px', width = '250px')
    map
  })
  
  

  
  
  
})