library(shiny)
#Define UI for application
shinyUI(fluidPage(
#Header Panel
  titlePanel(title = h3("Binomial Simulator", align="center")),
  sidebarLayout(
#Sidebar Panel
    sidebarPanel(
      h5('Select parameters for the binomial distribution simulator below:'),
      br(),
      sliderInput("n","Select the number of trials", min=1, max=5000, value=2501),
      sliderInput("draw","Select the number of observations per trial", min=1, max=5000, value=2501),
      sliderInput("p","Select the probability of success of each observation", min=0, max=1, value=0.5),
      br(),
      sliderInput("seed", "Select the random number seed", min=1, max=10,value=1),
      br(),
      sliderInput("bins","Select maximum number of bins for the histogram", min=1, max=200, value=10),
      radioButtons("color","Select the histogram bar color", choices=c("White","Blue", "Green", "Yellow", "Orange", "Red", "Black"), selected="White"),
      selectInput("seeCurve","Normal Curve Overlay", choices = c("Display" = 1,"Do not display" = 2), selected = 2),
      radioButtons("lcolor","Select the overlay line color", choices=c("White","Blue", "Green", "Yellow", "Orange", "Red", "Black"), selected="Black")
    ), 
    mainPanel(
      tabsetPanel(type="tab",
                  tabPanel("Instructions",fluidRow(column(12,pre(includeText("Instructions.txt")),tags$small(
                    "Source: Github Coursera Developing Data Products Student Course Project",
                    a(href="http://github.com/wongjo/data-products","http://github.com/wongjo/data-products"))))),
                  tabPanel("Summary",verbatimTextOutput("summa")),
                  tabPanel("Structure",verbatimTextOutput("struct")),
                  tabPanel("Data",tableOutput("datatab")),
                  tabPanel("Plot",plotOutput("histo")),
                  tabPanel("ui.R",fluidRow(column(12,pre(includeText("ui.R"))))),
                  tabPanel("server.R",fluidRow(column(12,pre(includeText("server.R")))))
                  
                  )
      
      
    )
  )
  
)
)


