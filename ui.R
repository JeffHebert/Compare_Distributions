
# This is the user interface logic for a Shiny web application.
# This Shiny App allows the user to manually fit distributions to sample data.
# The sample data is provided in the R defalut installation in the datasets package.
#
# Code by Jeff Hebert, 11/8/2014

library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Exploring Distributions"),
    
    # Sidebar control with main panel output 
    sidebarLayout(
        
        # Sidebar control panel
        sidebarPanel(
            # UI to select data set
            radioButtons("data_set", "Choose a Data Set", 
                         list("Commercial Airline Miles 1937-1960" = 1, 
                              "Tree Ring Width Measuremens" = 2, 
                              "Tree Height Measurements" = 3, 
                              "Speed of Light Experiment" = 4), 
                         selected = 4),
            hr(),
            
            
            
            # UI for number of bins in histogram
            sliderInput("bins", "Number of bins in histogram:",
                        min = 1, max = 20, value = 10),
            hr(),
            
            
            # UI for proposed fit density plot
            sliderInput("proposed_mean", "Proposed Mean", 85.0, 
                        min = 0.0, max = 200.0, step = 1),
            sliderInput("proposed_sd", "Proposed Standard Deviation", 7.5, 
                        min = 0.1, max = 35.0, step = .1),
            hr(),

            
            # UI for best fit density plot
            checkboxInput("show_fit", label = "Show best fit", value = FALSE),
            fluidRow(column(12, textOutput("fitted"))),
            hr(),
            
            
            # UI Feedback for user selections
            tags$p("Your selections:"),
            textOutput("return_data_set"),
            textOutput("return_bins"),
            textOutput("return_proposed_mean"),
            textOutput("return_proposed_sd"),
            textOutput("return_show_fit"),
            hr()
        ),
        
        
        # Show a plot of the generated distribution
        # Tab with instructions on how to use this app
        mainPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel("Distributions", plotOutput("distPlot")), 
                        tabPanel("Instructions", verbatimTextOutput("instructions"))
            )
            #plotOutput("distPlot")
        )
    )
))
