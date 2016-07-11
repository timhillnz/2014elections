
library(dplyr)
library(tidyr)

### Import voting data and clean

linenum <- which(grepl("Voting places where", read.csv(file = "http://www.electionresults.govt.nz/electionresults_2014/e9/csv/e9_part8_party_4.csv", header = F)[,2]))
distname <- as.character(read.csv(file = "http://www.electionresults.govt.nz/electionresults_2014/e9/csv/e9_part8_party_4.csv", header = F)[2,1])

chchcentral <- read.csv(file = "http://www.electionresults.govt.nz/electionresults_2014/e9/csv/e9_part8_party_4.csv", skip = 2,nrows = (linenum-4))
chchcentral <- chchcentral %>% select(-1) %>% mutate(Electorate = distname)
chchcentral <- gather(chchcentral, Party, Votes, 2:18)

chchcentral$Party <-  gsub("\\."," ", chchcentral$Party)




for (i in seq(1:71)) {
  filename <- paste0("http://www.electionresults.govt.nz/electionresults_2014/e9/csv/e9_part8_party_",i,".csv")
  print(filename)
  
  linenum <- which(grepl("Voting places where", read.csv(file = filename, header = F)[,2]))
  distname <- as.character(read.csv(file = linenum <- which(grepl("Voting places where", read.csv(file = filename, header = F)[,2]))

  chchcentral <- read.csv(file = "http://www.electionresults.govt.nz/electionresults_2014/e9/csv/e9_part8_party_4.csv", skip = 2,nrows = (linenum-4))
  chchcentral <- chchcentral %>% select(-1) %>% mutate(electorate = distname)
  
}
