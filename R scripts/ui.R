
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Localtivate"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("dataset", "Choose a site:", 
                sort(paste(unique(sort(d$Site))))), 
    ### add map here
    tags$style('.leaflet {height: 250px;}'),
    tags$style('.leaflet {layerOpts: {
               attribution: "Map data from<a href=\"http://openstreetmap.org\">OpenStreetMap</a>\n         contributors, Imagery<a href=\"http://mapbox.com\">MapBox</a>" 
               ;},')),
  #  showOutput('myMap', 'leaflet')),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Site Results"),
      tabPanel(showOutput("chart", "nvd3"))
      #, h3(textOutput("caption")), plotOutput("view"),dataTableOutput("summary")),
      #tabPanel("All Results", dataTableOutput("allresults")
    )
  )
  
    ))