library(shiny)

# ui.R

shinyUI(fluidPage(
  titlePanel("censusVis"),
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with information",
               "from the 2010 US census."),
      br(),
      selectInput("var", label=h5("Choose a demographic group"),
                  choices = c("Percent White",
                              "Percent Black",
                              "Percent Asian",
                              "Percent Hispanic"),
                  selected = "Percent White"),
      br(),
      sliderInput("range", label=h5("Range of interest"),
                  min=0, max=100, value=c(0,100))
      
      
      
    ),
    mainPanel(
      textOutput("text1"),
      br(),
      textOutput("text2"),
      br(),
      plotOutput("map")
    )
  )
))