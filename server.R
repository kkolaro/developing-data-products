

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  model <- lm(weight ~ height, data = women)
  model2<-lm(weight ~ height+I(height^2), data = women)
  
  pred <- reactive({
    new_height <- input$height
    predict(model, newdata = data.frame(height = new_height))
  })
  
  pred2 <- reactive({
    new_height <- input$height
    predict(model2, newdata = data.frame(height = new_height))
  })
   
  output$distPlot <- renderPlot({
    
    plot(women, xlab="Height (in inches)", ylab="Weight (in pounds)")
    
    abline(model,col=2)
    
    
    if(input$showModel2){
    lines(women$height, fitted(model2),col=3)
    }
    
    
  })
  
  output$pred1 <- renderText({
    pred()
  })
  
  output$pred2 <- renderText({
    
    ifelse(input$showModel2,pred2(),"NA")
    
  })
  
  
})
