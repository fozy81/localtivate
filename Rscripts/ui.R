
d <- read.csv("duddingston_survey.csv")

shinyUI(pageWithSidebar(
  headerPanel("Nuclear Incidents"),
  sidebarPanel(
    selectInput("dataset", "Choose a site:", 
                sort(paste(unique(sort(d$Location.of.the.space))))) 
    ),
  mainPanel( 
             tabsetPanel(
      tabPanel("Map"),
      tabPanel(  
                        leafletMap(
                          "map1", "100%", "400",
                          initialTileLayer = "http://{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
                          initialTileLayerAttribution = HTML('Maps by <a href="http://www.mapbox.com/">Mapbox</a>'),
                          options=list(
                            center = c(49.25, 16),
                            zoom = 4,
                            maxBounds = list(list(17, -180), list(59, 180))
                          )
                        )
           )
             )
    )
  )
)