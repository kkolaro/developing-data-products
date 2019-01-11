#
# This is the user-interface definition of a Shiny web application. Y

library(shiny)

shinyUI(fluidPage(
  
  
  titlePanel("Predicting women weight from height"),
  
  # Sidebar with a slider input for women heigh in inches 
  sidebarLayout(
    sidebarPanel(
       sliderInput("height",
                   "Women height:",
                   min = 50,
                   max = 80,
                   value = 60),
       checkboxInput("showModel2", "Show/Hide second model- Model2", value=TRUE)
    ),
    
    
    mainPanel(
       plotOutput("distPlot"),
       h3("Predicted height from the first model- Model1 is:"),
       h3(textOutput("pred1")),
       
       
       h3("Predicted height from the second model- Model2 is:"),
       h3(textOutput("pred2"))
    )
  )
))
