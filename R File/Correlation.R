exams <- read.csv("C:/Users/thong/Downloads/exams.csv")
View(exams)

names(exams)

summary(exams)
str(exams)
# New column to store average scores
exams$average.scores <- (exams$math.score+exams$reading.score+exams$writing.score)/3

# Variables name changed for better understanding
colnames(exams) <- c("Gender", "Race", "Parent Degree", "Lunch", "Course", "Math Score", "Reading Score", "Writing Score", "Average Scores")
names(exams)
attach(exams)

# graph for correlation
plot(`Reading Score` [Course=="none"], `Math Score` [Course=="none"])
plot(`Reading Score` [Course=="completed"], `Math Score` [Course=="completed"])

# H0: Reading Score and Math score has NO linear correlation
# H1: linear correlation exist
# two-sided test
# other values in default 
# cor.test(`Reading Score`, `Math Score`,method = "pearson",
#         exact=NULL, conf.level=0.95,continuity=FALSE)
cor.test(`Reading Score`, `Math Score`,method = "pearson")

# Graph for display
library(ggplot2)
library(hrbrthemes)
p<-ggplot(exams, aes(x=`Reading Score`,y=`Math Score`, colour=Course))
p+geom_point(size=2)+theme(legend.position="bottom")+labs(colour="Test Preparation",title="Reading Score vs Math Score for Test Preparation",x="Reading Score",y="Math Score")

par(mfrow=c(1,2))
plot(`Reading Score` [Gender=="female"],`Math Score`[Gender=="female"], xlab="Reading Score", ylab="Math Score", main="Reading vs Math score for Females", xlim=c(10,100), ylim=c(20,100))
plot(`Reading Score` [Gender=="male"],`Math Score`[Gender=="male"], xlab="Reading Score", ylab="Math Score", main="Reading vs Math score for Males", xlim=c(10,100), ylim=c(20,100))