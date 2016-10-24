library(shiny)
library(shinythemes)

source("captions.R")

shinyUI(fluidPage(
  theme = shinytheme("flatly"),
  
  titlePanel("Simple Data Explorer"),
  
  p(paste("This app is for graphical exploration of a dataset,",
    " in particular the 'Fuel economy data from 1999 and 2008",
    " for 38 popular models of car' available with ggplot2 R package.")),
  
  sidebarLayout(
    sidebarPanel(
      h3("Choose data to show"),
      selectizeInput('x', 'by X axis', explCaptions),
      selectizeInput('y', 'by Y axis', explCaptions, explCaptions),
      hr(),
      selectizeInput('color', 'Color data by', c('None', explCaptions)),
      selectizeInput('facet_col', 'Separate plots by',
                  c(None='.', explFacets)),
      hr(),
      p(paste("Hint: try city miles on x, highway on y, ",
              " color by drive type",
              " and separate by year"))
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Plot", plotOutput("mpgPlot")),
        tabPanel("Summary", verbatimTextOutput("summary")),
        tabPanel("Table", dataTableOutput("view"))
      )
    )
  )
))

