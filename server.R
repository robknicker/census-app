library(shiny)
source("helpers.R")
library(maps)
library(mapproj)
counties <- readRDS("data/counties.rds")


shinyServer(function(input,output) {
  
  output$map <- renderPlot({
    data <- switch(input$var,
                   "Percent White"=counties$white,
                   "Percent Black"=counties$black,
                   "Percent Asian"=counties$asian,
                   "Percent Hispanic"=counties$hispanic
    )
    colors <- switch(input$var, 
                     "Percent White"="darkgreen",
                     "Percent Black"="black",
                     "Percent Asian"="red",
                     "Percent Hispanic"="blue")
    percent_map(var=data, color=colors, 
                legend.title=input$var, max=input$range[2],
                min=input$range[1])
  })
  
})