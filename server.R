library(shiny)

shinyServer( 
  
  function(input,output) {
    
  output$summa <- renderPrint({
    binomVar<-rbinom(input$n,input$draw,input$p)
    x <- as.data.frame(binomVar)
    summary(x)
      
  })
    
  output$struct <- renderPrint({
    binomVar<-rbinom(input$n,input$draw,input$p)
    x <- as.data.frame(binomVar)
    str(x)
    
  })
    
  output$datatab <- renderTable({
    binomVar<-rbinom(input$n,input$draw,input$p)
    x <- as.data.frame(binomVar)
    x
  })  
  output$histo  <- renderPlot({
    #interactive Random Seed setter
    set.seed(input$seed)
    #Generate the binomial simulation for the selected Random Seed
    binomVar <- rbinom(input$n,input$draw,input$p)
   
    #set the intervals of the breaks for the histogram based on the min & max of successes generated and the selected number of bins
    x1 <- seq(min(binomVar)-20, max(binomVar)+20, length.out=input$bins+1)
    
    #set the graphic title based on the the binomial simulation parameters
    titl <- paste("Histogram of Binomial (",input$n,",",input$draw,",",input$p,")")
    #calculate mean and sd for vector of binomial successes
    mymean <- mean(binomVar)
    mysd <- sd(binomVar)
    #generate label for x-axis
    xlabels <- paste("Observed Successes, mean =", round(mymean,1),", standard deviation = ", round(mysd,1))
    #generate histogram
    h<-hist(binomVar,breaks=x1, col=input$color,main=titl, xlab=xlabels)
    #generate multiplier for size of overlay normal curve line
    multiplier <- h$counts / h$density
    #find the first non-NaN element in the multiplier vector
    NonNANindex <- which(!is.nan(multiplier))
    firstNonNAN <- min(NonNANindex)
    #calculate the length of the line to display
    myx <- seq(min(binomVar)-30, max(binomVar)+30, length.out= 200)
   
    #generate the normal distribution  
    normal <- dnorm(x = myx, mean = mymean, sd = mysd)
    #display overlay from user input
    if(input$seeCurve == 1) {
        lines(myx, normal * multiplier[firstNonNAN], col = input$lcolor, lwd = 2)
      
          }
  })
    
    
  })