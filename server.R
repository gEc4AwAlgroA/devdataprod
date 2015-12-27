library(shiny)

shinyServer(
  function(input, output) {
    data <- reactive({ read.csv(paste0('http://real-chart.finance.yahoo.com/table.csv?s=',input$symbol)) })
    
    output$symbol <- renderPrint(input$symbol)
    output$lastchange <- renderPrint(data()[1,'Adj.Close']-data()[2,'Adj.Close'])
    output$headresults <- renderPrint(head(data(), n=input$numrows))
    output$graph <- renderPlot(plot(subset(data(), select=c(Date,Adj.Close))))
  }
)