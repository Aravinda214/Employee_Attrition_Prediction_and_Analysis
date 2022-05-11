library(shiny)
library(plotly)
library(dplyr)
library(shinythemes)
library(data.table)
library(ggplot2)
library(shinydashboard)
library(highcharter)
shinyUI(
  
  dashboardPage( skin = "purple",
    dashboardHeader(title = "Employee Attrition Analysis"),
   
    dashboardSidebar(sidebarMenu(
      menuItem("Satisfactory_Level_Insights",tabName="Satisfaction_Level_Insights",icon=icon("tree")),
      menuItem("Productivity_Insights",tabName="Productivity_Insights ",icon=icon("tree")),
      menuItem("Other_Insights",tabName="Other_Insights",icon=icon("tree")),
      menuItem("Prediction",tabName="Prediction",icon=icon("tree"))
    )),
    dashboardBody(  
      tabItems(
        #tab1
        tabItem("Satisfaction_Level_Insights",
                fluidPage(
                  fluidRow(
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot1"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    ),
                    
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot2"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    )
                  ),
                  
                  fluidRow(
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot3"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    ),
                    
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot4"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    )
                  )
                  
                )
        ),
        
        #tab2
        tabItem("Productivity_Insights",
                fluidPage(
                  fluidRow(
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot5"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    ),
                    
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot6"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    )
                  ),
                  
                  fluidRow(
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot7"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    ),
                    
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot8"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    )
                  )
                  
                )
        ),
        
        #tab3
        tabItem("Other_Insights",
                fluidPage(
                  fluidRow(
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot9"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    ),
                    
                    column(# width should be between 1 and 12
                      width=6,
                      box(plotlyOutput("plot10"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    )
                  ),
                  
                  fluidRow(
                    column(# width should be between 1 and 12
                      width=6,
                      box(highchartOutput("plot11"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    ),
                    
                    column(# width should be between 1 and 12
                      width=6,
                      box(highchartOutput("plot12"), 
                          # For column based layouts, we can set box width to NULL
                          # This overrides the default value
                          width=NULL) 
                    )
                  )
                  
                )
        ),
        
        
        #tab4
        tabItem("Prediction",
                fluidPage(
                  
                  theme = shinytheme("cerulean"),
                  title = "Probability of Employee leaving the Job",
                  
                ),
                fluidRow(
                  column(# width should be between 1 and 12
                    width=4,
                    
                  ),
                  column(# width should be between 1 and 12
                    
                    width=8,
                    box(##textOutput("textoutput1"),
                      height = "115vh", title = "Probability of Employee Attrition",theme = shinytheme("superhero"),
                      numericInput("satisfaction_level", "satisfaction_level", 0, min = 1, max = 100),
                      numericInput("last_evaluation", "last_evaluation",  0, min = 1, max = 100),
                      numericInput("average_montly_hours", "average_montly_hours",  0, min = 50, max = 500),
                      numericInput("number_project", "number_project",  0, min = 1, max = 50),
                      numericInput("time_spend_company", "time_spend_company",  0, min = 1, max = 50),
                      selectInput("Work_accident", "Work_accident", choices = c(0,1)),
                      selectInput("promotion_last_5years", "promotion_last_5years", choices = c(0,1)),
                      selectInput("Department","Department:",c("accounting","hr","IT","management","marketing","sales","product_mng","support","RandD","technical")),
                      selectInput("salary","salary:",c("low","medium","high")),
                      br(),
                      submitButton("Submit", icon("refresh")),
                      textOutput("plot13")
                    )
                    
                  )
                )
        )
        
        
        
      )
    )
  )
  
)
