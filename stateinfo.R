
getwd()
setwd('~/Downloads')

stateinfo <- read.csv('stateData.csv')

# subset(stateinfo,state.region == 1)
nesatate <- stateinfo[stateinfo$state.region == 1,]
head(nesatate)
dim(nesatate)

ilirate <- stateinfo[stateinfo$illiteracy == 0.5,]
head(ilirate)

highSchool <-stateinfo[stateinfo$highSchoolGrad > 50.0,]
head(highSchool)
