#library(UsingR)
#data(galton)


shinyServer(
  function(input, output) {
    d <- seq(0, 25, length.out = 200)
    

    output$myHist <- renderPlot({
      plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
           las = 1, xlim = c(0, 25))
      degree <- input$degree
      fm <- lm(dist ~ poly(speed, degree), data = cars)
      
      lines(d, predict(fm, data.frame(speed = d)), col = degree)
      
  
      datasetInput <- reactive({
        lm(dist ~ poly(speed, degree), data = cars)
      })
      
      # Generate a summary of the dataset
      output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(dataset)
      })

    })
    
    
    

    
  
  
 
    
  }
)