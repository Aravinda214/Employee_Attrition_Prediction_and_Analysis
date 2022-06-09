# Employee_Attrition_Prediction_and_Analysis

# Abstract 

Analyze and predict whether Employee attrition will occur using appropriate visualization techniques and classification ML algorithms. There are 8 different factors like salary level, satisfaction level etc have been taken into consideration. From the visualization techniques it was observed that the sales department spent the most time working in the organization, very few people were promoted in the last five years etc inferences have been made. Upon classification of whether the employee will leave the organization or not, Random Forest (98.80) and Decision Trees (97.20) gave the best accuracy on prediction.

## Steps to Run the Application

Download the repository and extract it.
<br>
Open ```ui.R``` and ```server.r``` in your local Rstudio application. A ```Run App``` option will be displayed. Click on that to execute the shiny dashboard.

## Data Source

Link: https://www.kaggle.com/datasets/kmldas/hr-employee-data-descriptive-analytics

## Language 
The ```R``` language was used to perform Data Analytics and Machine Learning. ```R Markdown``` is used for knitting the file into Html

## Tools
->R studio <br>
->Plotly <br>
->Ggplot 2
->Shiny Dashboard
->High Charter

## Techniques
->Dataset Cleaning <br>
->Data Visualization <br>
->Data Analysis <br>
->Machine Learning <br>

# Proposed Methodology

1. Logistic Regression
Logistic regression is a statistical analysis method to predict a binary outcome, such as yes or no, based on prior observations of a data set. As additional relevant data comes in, the algorithms get better at predicting classifications within data sets.

2. K-Nearest neighbours(KNN)
K-nearest neighbors (kNN) is a supervised machine learning algorithm that can be used to solve both classification and regression tasks.

3. Naive Bayes
Naive Bayes is a probabilistic algorithm that’s typically used for classification problems. Naive Bayes is simple, intuitive, and yet performs surprisingly well in many cases. For example, spam filters Email app uses are built on Naive Bayes.

4. Decision Tree
A decision tree is a type of supervised machine learning used to categorize or make predictions based on how a previous set of questions were answered. The model is a form of supervised learning, meaning that the model is trained and tested on a set of data that contains the desired categorization.

5. Random Forest
Random forest is a Supervised Machine Learning Algorithm that is used widely in Classification and Regression problems. It builds decision trees on different samples and takes their majority vote for classification and average in case of regression. It is an ensemble model as it uses multiple decision trees output and combines them.

6. Support Vector Machine (SVM)
“Support Vector Machine” (SVM) is a supervised machine learning algorithm that can be used for both classification or regression challenges. Identifying the right hyperplane that categorizes the data points into the right classes or groups.

# Proposed System
![image](https://user-images.githubusercontent.com/68860525/172795938-0262baff-d564-46bf-8059-172b1347920e.png)

# Snippets of the Shiny Dashboard
![image](https://user-images.githubusercontent.com/68860525/172796121-510db3ef-ff3b-42c0-80de-166c1312c303.png)
![image](https://user-images.githubusercontent.com/68860525/172796172-3ba7a7c5-ad95-417d-b59d-68bb251ef864.png)
![image](https://user-images.githubusercontent.com/68860525/172796197-92709e0c-e884-4f35-84b0-a72c08df649b.png)

## Dashboard for Prediction 
![image](https://user-images.githubusercontent.com/68860525/172796269-34e74683-b382-496c-8f76-e9a99f7606d1.png)
## Model predicting that the employee will not leave the company
![image](https://user-images.githubusercontent.com/68860525/172796311-f97a8356-5db7-466e-87d8-bda5e3c15392.png)

# Conclusion 
All models were coded and executed with the standard parameters, the results were then tabulated for comparison. Random forest has the highest accuracy of 98.8%,Decision tree gave a accuracy of 97.2%, KNN gave a accuracy of 94.9%, Naive Bayes gave a accuracy of 79.1%, Support Vector Machine tree gave a accuracy of 97.2%, while Logistic Regression has the lowest with 77.1%. Upon observing the accuracies of other models, tree based machine learning models gave the  highest accuracies. Hence tree based models are best suited for employee attrition prediction. It is hence important for organizations to cater to the needs of every employee, by providing them with a proper remuneration,promotions,regulated work schedule, safety measures and other benefits to keep them satisfied, and prevent attrition.
