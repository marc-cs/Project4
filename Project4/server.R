#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(curl)

# Define server logic
shinyServer(function(input, output) {
    
    # load data
    data("diamonds")
    
    # create initial plot
    output$distPlot <- renderPlot({
        
        # subset diamonds based on user's inputs
        subsetDiam <- subset(diamonds, 
                                cut == input$cut &
                                color == input$color &
                                clarity == input$clarity
                             )
        
        # plot the diamond data with carat and price
        p <- ggplot(data = subsetDiam, 
                    aes(x = carat, y = price)) + 
            geom_point() +
            geom_smooth(method = "lm") + 
            ylab("Price")+
            xlab("Carats")
        p
    }, 
    height = 600)
    
    # predict the price
    output$predictedPrice <- renderPrint({
        subsetDiam <- subset(diamonds, 
                             cut == input$cut &
                                 color == input$color &
                                 clarity == input$clarity
        )
        fit <- lm(price~carat,data=subsetDiam)
        unname(predict(fit, data.frame(carat = input$lm)))})
    
    
    
    })
