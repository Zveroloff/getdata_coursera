## Assume that we are in the dataset's top directory.
## Reading and binding the sets together
data.test <- read.delim("test\\X_test.txt", header = F, sep = "", skipNul = T, colClasses = c("numeric"))
data.train <- read.delim("train\\X_train.txt", header = F, sep = "", skipNul = T, colClasses = c("numeric"))
data.all <- rbind(data.test, data.train)

#take care of the feature names
feat.raw <- read.delim("features.txt", header = F, sep = "", skipNul = T)
names(feat.raw) <- c("num", "feature")
#feat.names <- as.character(feat.raw$feature)
#mean.idx <- grep("mean()", feat.names, ignore.case=T)
#std.idx <- grep("std()", feat.names, ignore.case=T)

## Read the labels and add labels column to the data
labels.test <- read.delim("test\\Y_test.txt", header = F, sep = "")
labels.train <- read.delim("train\\Y_train.txt", header = F, sep = "")
labels.all <- rbind(labels.test, labels.train)
data.labeled <- cbind(data.all, labels.all)
names(data.labeled)[562] <- "ac.index"

## Substitute the activity indices with the names
ac.labels <- read.delim("activity_labels.txt", header = F, sep = "")
names(ac.labels) <- c("ac.index", "ac.name")
data.labeled <- merge(data.labeled, ac.labels)
data.labeled$ac.index <- NULL

## Select features that stores mean() and std()
feat.sel <- grep("(mean\\(\\))|(std\\(\\))", feat.raw$feature, ignore.case = T, value = T)
feat.sel.bool <- grepl("(mean\\(\\))|(std\\(\\))", feat.raw$feature, ignore.case = T)
feat.sel.bool[length(feat.sel.bool) + 1] <- TRUE

## Filter the data
data.labeled <- data.labeled[, feat.sel.bool]

#Prepare var names. Get and clean them from feature names.
var.names <- make.names(feat.sel, unique = T)
var.names <- gsub("\\.+", ".", var.names)
var.names[length(var.names) + 1] <- "ac.name"


## Set the names for the labeled data.
names(data.labeled) <- var.names


## The final step: compute the mean of all columns grouped by the activity name.
library(data.table)
data.labeled <- data.table(data.labeled)
data.avg <- data.labeled[, lapply(.SD, mean), by = ac.name]

## Out to file
wrtite.table(data.avg, "resultSet.txt", row.names = F)