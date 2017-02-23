#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(mapview)
library(leaflet)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
  
      # Show a plot of the generated distribution
      mainPanel(
         leafletOutput("map")
      )
   )
)

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   
   output$map <- renderLeaflet({
     map2 <- leaflet() %>%
       
       addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                options = providerTileOptions(noWrap = TRUE)) %>%
       addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/Mapserver/tile/{z}/{y}/{x}',
                options = providerTileOptions(noWrap = TRUE)) %>%
       
       setView(-88.1, 27.75, zoom = 6) %>%
       addMouseCoordinates(style='basic')
   })
})


# Run the application 
shinyApp(ui = ui, server = server)

