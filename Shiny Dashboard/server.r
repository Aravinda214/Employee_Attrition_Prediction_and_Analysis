library(shiny)
library(plotly)
library(DT)
library(naivebayes)
library(dplyr)
library(ggplot2)
library(psych)
library(class)
library(e1071)
library(caTools)
library(ROCR) 
library(ecodist)
library(hrbrthemes)
library(highcharter)
shinyServer(function(input,output){
  data<- read.csv('C:/Personal/Aravinda Stuff/Sem 6th/Essentials of Data Analytics/Project/HR_Employee_Data.csv')
  data$satisfaction_level<-gsub("%","",as.character(data$satisfaction_level))
  data$satisfaction_level=as.integer(data$satisfaction_level)
  data$last_evaluation<-gsub("%","",as.character(data$last_evaluation))
  data$last_evaluation=as.integer(data$last_evaluation)
  
  data<-data %>% rename(Emp_Id=ï..Emp_Id )
  f =data$left
  data = subset(data, select = -c(left) )
  data$left <- f
 
  df <- data
  str(df)
  
output$plot1<-renderPlotly({
  fig <- plot_ly(data,x=~Department, y=~number_project,color = ~salary,type="bar")
  fig
  })
output$plot2<-renderPlotly({
   
    p <- ggplot(data, aes(x =satisfaction_level))+
      geom_bar(color="darkblue", fill="lightblue")+
      ggtitle("Distribution of Satisfaction level") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
    p
  })
  output$plot3<-renderPlotly({
    q<-ggplot(data,aes(x=satisfaction_level,y=average_montly_hours))+
      geom_boxplot(color="lightblue")+
      xlab("satisfaction_level")+
      ylab("average_montly_hours")+
      facet_grid(~salary)
    q
  })
  
  output$plot4<-renderPlotly({
    fig1 <- plot_ly(data,labels = ~salary, values = ~time_spend_company,type="pie", textinfo='label+percent')
    fig1
  })
  
  output$plot5<-renderPlotly({
    
    fig <- plot_ly(data, x = ~promotion_last_5years, y = ~number_project ,type = 'bar', color=~Department)
    fig
    
  })
  
  output$plot6<-renderPlotly({
    
    ans=crosstab(data$Department,data$left)
    Department=rownames(ans)
    fig <- plot_ly(ans,x = ~Department, y = ~X0, type = 'bar', name = 'Working for Company')
    fig<- fig %>% add_trace(y =~X1, name = 'Left the Company')
    fig <- fig %>% layout(title="Employees who have left based on department", yaxis = list(title = 'Count'), barmode = 'group')
    fig
    
  })
  
  output$plot7<-renderPlotly({
    
    ans=crosstab(data$salary,data$left)
    Salary=rownames(ans)
    fig <- plot_ly(ans,x = ~Salary, y = ~X0, type = 'bar', name = 'Working for Company')
    fig<- fig %>% add_trace(y =~X1, name = 'Left the Company')
    fig <- fig %>% layout(title="Employees who have left based on salary", yaxis = list(title = 'Count'), barmode = 'group')
    fig
    
  })
  
  
  output$plot8<-renderPlotly({
    
    ans=crosstab(data$time_spend_company,data$left)
    #ans
    Time_Spent=rownames(ans)
    #Time_Spent
    fig <- plot_ly(ans,x = ~Time_Spent, y = ~X0, type = 'scatter', mode = 'lines', name = 'Working for Company', fill = 'tozeroy')
    fig <- fig %>% add_trace(y = ~X1, name = 'Left the Company', fill = 'tozeroy')
    fig <- fig %>% layout(xaxis = list(title = 'Time Worked'),
                          yaxis = list(title = 'Count'))
    fig
    
  })
  
  output$plot9<-renderPlotly({
    data <- df%>%
      group_by(Department)%>%
      summarize(Avg_hrs = mean(average_montly_hours))
    
    fig <- plot_ly(data, x = ~Department, y = ~Avg_hrs, type = 'bar', color = I("dark blue"))
    fig <- fig %>% layout(title = "Average monthly working hours according to department",
                          xaxis = list(title = "Department"),
                          yaxis = list(title = "Average monthly working hours"))
    
    fig
    
  })
  
  output$plot10<-renderPlotly({
    
    fig <- plot_ly(df, labels = ~Department, values = ~time_spend_company, type = 'pie')
    fig <- fig %>% layout(title = 'Time spent per Department',
                          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    
    fig
    
  })
  
  output$plot11<-renderHighchart({
   
    l <- df %>% filter(salary == "low")
    m <- df %>% filter(salary == "medium")
    h <- df %>% filter(salary == "high")
    
    hc2 <- hchart(
      density(l$satisfaction_level), type = "area", 
      color = "steelblue", name = "Low Salary"
    ) %>%
      hc_add_series(
        density(m$satisfaction_level), type = "area",
        color = "#B71C1C", 
        name = "Medium Salary"
      )%>%
      hc_add_series(
        density(h$satisfaction_level), type = "area",
        color = "yellow", 
        name = "High Salary"
      )%>%
      hc_title(text = "Density plot of satisfaction level according to salary")%>%
      hc_xAxis(title = "Satisfaction Level (0-100)")
    hc2
    
  }) 
  
  output$plot12<-renderHighchart({
    data <- df%>%
      filter(Work_accident==1)%>%
      group_by(Department)%>%
      summarize(No_of_wa = n())%>%
      arrange(No_of_wa)
    hc <- data %>% 
      hchart('line', hcaes(x = Department, y = No_of_wa))%>%
      hc_title(text = "Number of work accidents for each department")%>%
      hc_yAxis(title = "Number of work accidents")
    hc
    
  })
  
  output$plot13<-renderText({
    data_df<-data
    data$Department= as.numeric(as.factor(data$Department))
    data$salary= as.numeric(as.factor(data$salary))
    
    split <- sample.split(data, SplitRatio = 0.7)
    train_cl <- subset(data, split == "TRUE")
    test_cl <- subset(data, split == "FALSE")
    
    # Feature Scaling
    train<- scale(train_cl[, 2:10])
    test<- scale(test_cl[, 2:10])
    
    library(class) 
    
    # Fitting KNN Model 
    # to training dataset
    # K = 3
    classifier_knn <- knn(train = train,
                          test = test,
                          cl = train_cl$left,
                          k = 3)
    a1<-levels(factor(data_df$salary))
    a1
    a2<-as.numeric(levels(factor(data$salary)))
    a2
    
    satisfaction_level<-input$satisfaction_level
    last_evaluation<-input$last_evaluation
    number_project<-input$number_project
    average_montly_hours<-input$average_montly_hours
    time_spend_company<-input$time_spend_company
    Work_accident<-input$Work_accident
    promotion_last_5years<-input$promotion_last_5years
    
    s1<-levels(factor(data_df$Department))
    s1
    s2<-as.numeric(levels(factor(data$Department)))
    s2
    Department<-input$Department
    p<-as.numeric(match(Department,s1))
    Department=s2[p]
    Department
    
    
   
    salary<-input$salary
    p1<-as.numeric(match(salary,a1))
    salary=a2[p1]
    salary
    
  
    x=data.frame(satisfaction_level=satisfaction_level,last_evaluation=last_evaluation,
                 number_project=number_project,average_montly_hours=average_montly_hours,time_spend_company=time_spend_company,Work_accident=Work_accident,
                 promotion_last_5years= promotion_last_5years,Department=Department,salary=salary)
    

    z<-knn(train=train_cl[,2:10],test = x,cl = train_cl$left, k = 3)
    

    if(z==0){
               paste("Yes,The employee will leave the Company")
    }
    else{
      paste("No,The employee will stay in the Company")
    }
   
  })
  
  
})
