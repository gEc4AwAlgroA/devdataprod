library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Quick Stock Symbol Inspector"),
  sidebarPanel(
    textInput('symbol', 'Symbol eg ^FTSE, GOOG, LLOY.L', value = "^FTSE", width = NULL),
    numericInput('numrows', 'How many days to see', 4)
  ),
  mainPanel(
    h3('Recent Performance'),
    p('Symbol Entered:'),
    verbatimTextOutput('symbol'),
    p('Last Change:'),
    verbatimTextOutput('lastchange'),
    p('Recent days results'),
    verbatimTextOutput('headresults'),
    p('Graph of historical performance'),
    plotOutput('graph')
  )
))