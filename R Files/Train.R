install.packages("RMySQL")
library(RMySQL)

mydb = dbConnect(MySQL(), user='root', password='', dbname='machine', host='localhost')
dbListTables(mydb)
dbListFields(mydb,"valid_data")
T<-dbGetQuery(mydb,"select * from rlanguage ;")
T

result<-lm(loanamount~income+expenditure,T)
result

save(result,file="loanmodel.rda")

# summary(result)
returnValue(result)