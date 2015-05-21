#####################################
## Match Data from Anagrafe and Names
#####################################
lf <- list.files("data/anagrafe_amministratori_locali/comuni/",pattern="*.zip")
sapply(paste("data/anagrafe_amministratori_locali/comuni/", lf,sep=""),unzip) ## unzip all files

## Function to read files
read.files <- function(x) {
   read.table(x, sep=";", encoding="latin1", comment.char="", quote="", stringsAsFactors=FALSE,header=T)
}

## Read lines
lf <- list.files(pattern="*.txt")
out <- lapply(lf, read.files)
out2 <- lapply(out, function(x)x[,c("NOME","SESSO")])
unlink(lf)

## Rbind data
db <- rep()
for (i in 1:length(out2)) {db <- rbind(db, out2[[i]])}

## Clean names
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
db[, 1] <- trim(gsub("[ ]+"," ", gsub("[^[:alnum:] ]"," ",tolower(db[, 1]))))
tab <- table(db)

###################################### 
z <- data.frame(name=rownames(tab),gender=tab[,2:3])
file="gender_firstnames_ITA.csv"
write.table(z, row.names=F,quote=FALSE,sep=",",file=file)

