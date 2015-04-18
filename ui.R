shinyUI(pageWithSidebar(
  headerPanel("Polynomial regression"),
  sidebarPanel(
    sliderInput('degree', 'Set polynomial degree',value = 1, min = 1, max = 10, step = 1,)
  ),
  mainPanel( 
    plotOutput('myHist'),

    h4('Summary'),
    verbatimTextOutput("summary")
  )
))
