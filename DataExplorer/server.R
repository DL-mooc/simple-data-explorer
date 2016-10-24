library(shiny)
library(ggplot2)

source("captions.R")

shinyServer(function(input, output) {
  
  output$summary <- renderPrint({
    summary(explData)
  })

  output$view = renderDataTable({
    explData
  })

  output$mpgPlot = renderPlot({
    
    # simple scatterplot with improved labels
    p = ggplot(explData, aes_string(x = input$x, y = input$y)) + geom_point()
    p = p + labs(x = varLabels[[input$x]], y = varLabels[[input$y]])

    # coloring options
    if (input$color != 'None')
      p = p + aes_string(color = input$color) +
        guides(color = guide_legend(title = varLabels[[input$color]])) +
        theme(legend.position = "bottom", legend.direction = "horizontal")

    # separate plots in one row
    facets = paste('. ~', input$facet_col)
    if (facets != '. ~ .')
      p = p + facet_grid(facets)

    # improve readability in crammed space
    if ((facets != '. ~ .') || (length(unique(explData[[input$x]])) > 12))
      p = p + theme(axis.text.x = element_text(angle = 45, hjust = 1))

    print(p)
  })
})
