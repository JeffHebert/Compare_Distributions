Compare Distributions
========================================================
author: Jeff Hebert
date: 11/12/2014
transition: rotate

A simple Shiny App
------------------

Motivation
========================================================

Can you tell if your data is normally distributed?

This app will allow you to visualize how mean and standard deviation parameters affect a theoretical distribution. In this case, we are working with the well known normal (or Gaussian) distribution. This app uses data that is available in the 'datasets' package which comes installed with base R. These distributions are choses to show how real-world data can somtimes fall within a normal distribution. Can you spot which sets are normally distributed?

The app is located at [jeffhebert.shinyapps.io/Compare_Distributions](https://jeffhebert.shinyapps.io/Compare_Distributions/)

How to Use This App
========================================================

Start by selecting one of the 4 data sets. R will overlay a gaussian distribution. The default mean is 85 and default standard deviation of 7.5.

You adjust the number of bins in histogram to make a finer or coarser graph.

Adjust the Proposed Mean to move the center of the proposed distribution.

Adjust the Proposed Standard Deviation to change the spread of the distribution.

Click on the Show best fit check box to add a fitted distribution for the dataset.


Distributions Tab
========================================================

The Distributions tab shows a histogram of the dataset you selected. 

Your choice for the number of bins will determine the width of each bar.

The smooth blue curve is your proposed gaussian distribution. You can change its location and scale by adjusting the mean and standard deviation sliders.

When you are ready, show the best fit 


Instructions Tab
========================================================

Just in case these slides are not available, the Instructions tab will give a brief tutorial on how to use this app.


Future Work
========================================================

Future versions of this app will allow selection among several theoretical distributions such as lognormal, beta, and exponential.

Also, future versions the user will be able to load data from a local source.



Thank you for checking out my app!

Jeff
