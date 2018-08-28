library(xtable)
library(RColorBrewer)
try(setwd("~/Documents/Conferences/Evolang12/genderBias2018_public/analysis/"))

allData = read.csv("../data/EvoLang_Scores_8_to_12.csv",stringsAsFactors = F)
# relabel factor
allData$FirstAuthorGender = factor(allData$FirstAuthorGender,levels=c("F","M"),labels=c("Female","Male"))
allData$gender = allData$FirstAuthorGender
allData$review = factor(c("Single","Double")[(allData$conference %in% c("E11","E12"))+1])
allData$conference = factor(allData$conference,levels = c("E8","E9","E10","E11","E12"))
allData$format = factor(allData$format)

allData$student[!is.na(allData$student) &
                  allData$student=="Faculty"] = "Non-Student"
allData$student[!is.na(allData$student) &
                  allData$student=="EC"] = "Non-Student"
allData$student = factor(allData$student)

###

readScores = read.csv("../data/EvoLang_ReadingScores_E8_to_E12.csv",stringsAsFactors = F)
readScores$fleschkincaid_score_scaled = scale(readScores$fleschkincaid_score)
readScores$dalechall_score_scaled = scale(readScores$dalechall_score)
readScores$student[readScores$student=="EC"] = "Non-Student"
readScores$student[readScores$student=="Faculty"] = "Non-Student"
# Remove an outlier
readScores = readScores[readScores$fleschkincaid_score_scaled<6,]
readScores$gender = factor(readScores$gender)

readScores$conference = factor(readScores$conference,
                               levels = c("E8","E9","E10","E11","E12"))


###

plotStackedBar = function(dx,filename){
  pdf(filename,width=5, height=4)
  par(mar=c(4,4,2,1))
  xtabs(~gender+conference,dx) -> x
  xvals <- barplot(x, beside=T, cex.names=1.5, ylim=c(0,150) )
  
  xtabs(~gender+conference+student,dx) -> x2
  textadjx = 3
  text(xvals[1,1],0-textadjx,x[1,1],pos=3,col='white')
  text(xvals[2,1],0-textadjx,x[2,1],pos=3)
  
  xwd <- .5
  
  for (conf in 2:5){
    # Female non-students
    polygon( c( rep(xvals[1,conf]-xwd,2), rep(xvals[1,conf]+xwd,2) ), 
             c(0, x2[1,conf,1], x2[1,conf,1], 0), col="#d95f02" )
    text(xvals[1,conf],0-textadjx,x2[1,conf,1],pos=3)
    # Male non-students
    polygon( c( rep(xvals[2,conf]-xwd,2), rep(xvals[2,conf]+xwd,2) ), 
             c(0, x2[2,conf,1], x2[2,conf,1], 0), col="#d95f02" )
    text(xvals[2,conf],0-textadjx,x2[2,conf,1],pos=3)
    
    # Female students
    polygon( c( rep(xvals[1,conf]-xwd,2), rep(xvals[1,conf]+xwd,2) ), c(x2[1,conf,1], x2[1,conf,1]+x2[1,conf,2], x2[1,conf,1]+x2[1,conf,2], x2[1,conf,1]), col="#1b9e77" )
    text(xvals[1,conf],x2[1,conf,1]-textadjx,x2[1,conf,2], pos = 3)
    # Male students
    polygon( c( rep(xvals[2,conf]-xwd,2), rep(xvals[2,conf]+xwd,2) ), c(x2[2,conf,1], x2[2,conf,1]+x2[2,conf,2], x2[2,conf,1]+x2[2,conf,2], x2[2,conf,1]), col="#1b9e77" )
    text(xvals[2,conf],x2[2,conf,1]-textadjx,x2[2,conf,2], pos = 3)
  }
  text( xvals[1,], rep(-5,5),rep("F",5), xpd=T )
  text( xvals[2,], rep(-5,5),rep("M",5), xpd=T )
  
  legend(3,-18, fill=c("#d95f02","#1b9e77"), legend=c("Non-students", "Students"), horiz=T ,bty = 'n',xpd=T)
  title(ylab="Number of submissions")
  dev.off()
}

plotStackedBar(allData,"../results/StackedBar_ReviewScores.pdf")

plotStackedBar(readScores,"../results/StackedBar_ReadingScores.pdf")

