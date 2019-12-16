#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# load data
data("diamonds")

# Define UI
shinyUI(fluidPage(

    # Application title
    titlePanel("Price predictor of Diamonds"),

    # Sidebar with the inputs of the diamonds features
    sidebarLayout(
        sidebarPanel(
            h4("Diamond price prediction:"),
            # Number of carats
            sliderInput("lm", "Number of carats",
                        min = min(diamonds$carat), max = max(diamonds$carat),
                        value = max(diamonds$carat) / 2, step = 0.1),
            # Cut
            selectInput("cut", "Cut", (sort(unique(diamonds$cut), decreasing = T))),
            # Clarity
            selectInput("clarity", "Clarity", (sort(unique(diamonds$clarity), decreasing = T))),
            # Color
            selectInput("color", "Color", (sort(unique(diamonds$color)))),
            
            h4("The predicted price is:"),
            verbatimTextOutput("predictedPrice"), width = 4),
            

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            
        )
    )
))
