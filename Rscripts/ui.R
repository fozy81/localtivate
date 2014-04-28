
d <- read.csv("duddingston_survey.csv")

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Localtivate"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("dataset", "Choose a site:", 
                sort(paste(unique(sort(d$Location.of.the.space))))) 
  ),

  #  showOutput('myMap', 'leaflet')),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Map"),
      tabPanel( leafletMap("map", width="100%", height="100%",
                           initialTileLayer = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
                           initialTileLayerAttribution = HTML('Map data from<a href=\"http://openstreetmap.org\">OpenStreetMap</a>\n contributors, Maps by <a href="http://www.mapbox.com/">Mapbox</a>'),
                           options=list(
                             center = c(37.45, -93.85),
                             zoom = 4,
                             maxBounds = list(list(15.961329,-129.92981), list(52.908902,-56.80481)) 
    )
  )
      )
  )
  )
))