
# This is the server logic for a Shiny web application.
# This Shiny App allows the user to manually fit distributions to sample data.
# The sample data is provided in the R defalut installation in the datasets package.
#
# Code by Jeff Hebert, 11/8/2014

library(shiny)


shinyServer(function(input, output) {
    
    # Generate instructions for how to use this app
    output$instructions <- renderText({
"This app will allow you to visualize how shape and scale parameters affect a theoretical distribution. 
The data used by this app is available in the datasets package which comes installed with base R.

To use this app, 
select a sample data set then 
adjust the mean and standard deviation parameters.

Check Show best fit to add a fitted distribution for the dataset."
    })
    
    output$distPlot <- renderPlot({
        # Create lists for analysis and charting
        idx <- as.integer(input$data_set)                                            # Index of data set chosen in UI
        data_set <- list(airmiles/1000, treering*100, trees$Height, morley$Speed/10) #Scale data
        x_label <- list("Thousands of Airmiles", "Ring Width", "Tree Height", "Speed of Light")
        main_label <- list("Histogram of Airmiles", "Histogram of Tree Ring Width", "Histogram of Tree Height", "Histogram of Measured Speed of Light")
        data_desc <- list("Airline Miles", "Tree Rings", "Tree Height", "Speed of Light")
        
        #Troubleshooting code - safely delete later
        #output$value <- renderPrint({ input$show_fit })
        #output$value <- renderPrint({ head(data_set[[1]],3) })
        #output$value <- renderPrint({ head(data_set[[idx]],3) })
        # generate bins based on input$bins from ui.R
        
        # Get x data and histogram bins based on input from ui.R
        x <- data_set[[idx]]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        h <- hist(x, breaks = bins, col = 'darkgray', border = 'white', xlab = x_label[idx], main = main_label[idx])
        
        # Add proposed density plot
        x_min <- min(bins)
        x_max <- max(bins)
        n_obs <- length(x)
        
        # Calculate density for selected distribution
        x_seq <- seq(from = x_min, to = x_max, by = (x_max-x_min)/100)
        x_den <- dnorm(x_seq, mean = input$proposed_mean, sd = input$proposed_sd)
        
        # Calculate scale factor for histogram as chart max / density max
        c_sf <- max(h$counts) / max(x_den)
        
        # Add density to histogram in blue
        lines(x_seq, c_sf*x_den, lwd = 3, col="blue")
        
        # If best fit selected, add best fit in black
        if(input$show_fit){
            x_mean <- round(mean(x),1)
            x_sd <- round(sd(x),1)
            x_sf <- max(h$counts) / dnorm(x_mean, mean = x_mean, sd = x_sd)
            x_trueden <- dnorm(x_seq, mean = x_mean, sd = x_sd)
            lines(x_seq, x_sf*x_trueden, lwd = 3)
            output$fitted <- renderText({ c(paste("Mean = ", x_mean, "SD = ", x_sd)) })
        } else {output$fitted <- renderText({ "" })}
        
        # Return current selections
        output$return_data_set <- renderText({ data_desc[[idx]] })
        output$return_bins <- renderText({ paste(input$bins, "bins") })
        output$return_proposed_mean <- renderText({ paste("mean = ", input$proposed_mean) })
        output$return_proposed_sd <- renderText({ paste("StDev = ", input$proposed_sd) })
        output$return_show_fit <- renderText({ paste("show fit = ", input$show_fit) })
        
        
    })
    
})
