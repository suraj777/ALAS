install.packages("RMySQL")
library(RMySQL)

mydb = dbConnect(MySQL(), user='root', password='', dbname='bank', host='localhost')
dbListTables(mydb)

load("loanmodel.rda")
dbListFields(mydb,"loan_details")


Data<-dbGetQuery(mydb,"select
p.userid,
(f.yearly_income) AS Income ,
(e.yearly_expenditure + (e.emi*12)) AS Expense, l.loanAmount AS Loan_Required, l.loanStatus
from personal_details as p INNER JOIN financial_details as f ON p.userid=f.userid
INNER JOIN expenditure_details as e on p.userid=e.userid
Inner JOIN assets as a ON p.userid=a.userid
Inner JOIN loan_details as l ON p.userid=l.userid
where p.userid=1013")
Data
# data<-dbGetQuery(mydb,"select * from view1")
# data


income1<-Data[2]
income1


expenditure1<-Data[3]
expenditure1


userid<-Data[1]
userid

loanrequired<-Data[4]
loanrequired

saving<-Data$Income-Data$Expense
saving

loancal<-predict(result,data.frame(income=100000,expenditure=50000),interval = "prediction")

loancal

R<-(if(loancal>=Data$Loan_Required){
  time<-dbGetQuery(mydb,"update loan_details set loanStatus='Approved' where userid=1013 ;")
  time
}else{
  time<-dbGetQuery(mydb,"update loan_details set loanStatus='Rejected' where userid=1013 ;")
})
R

result<-dbGetQuery(mydb,"select * from loan_details")
result
