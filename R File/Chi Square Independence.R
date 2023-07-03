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

TAB <- table(Race, Course)
TAB

colours <- c("red","palevioletred1","khaki1","palegreen1","skyblue1","mediumorchid1")
x <-barplot(TAB, main="Table of Race Ethnicity on Test Preparation", xlab="Test Preparation", ylab="Frequency", ylim=c(0,800),col=colours)
legend(x=0, y=890, legend=c("Group A", "Group B", "Group C", "Group D", "Group E"), horiz = T, fill = colours, bty = "n", cex = 0.8, text.width = 0.05)
mtext("Race / Ethnicity", side=3)

mydata <- data.frame(
  row.names = c("Group A", "Group B", "Group C", "Group D", "Group E"),
  completed = c(24, 69, 108, 80, 53),
  none = c(54, 122, 234, 163, 93))
# Display the frequency per Race
# Completed
text(0.7, 20, expression(24))
text(0.7, 73, expression(69))
text(0.7, 181, expression(108))
text(0.7, 261, expression(80))
text(0.7, 314, expression(53))

# None
text(1.9, 31, expression(54))
text(1.9, 153, expression(122))
text(1.9, 387, expression(234))
text(1.9, 550, expression(163))
text(1.9, 643, expression(93))

#H0: Test Preparation is independent of Race/ Ethnicity
#H1: Test Preparation is dependent of Race/ Ethnicity
CHI <- chisq.test(TAB, correct=FALSE)
CHI

# Critical value
alpha <- 0.05
x2.alpha <- qchisq(alpha, df=4, lower.tail = FALSE)
x2.alpha

#plot for explaination
library(ggplot2)
library(hrbrthemes)
p<-ggplot(exams, aes(x=`Average Scores`,y=Race, colour=Course))
p+geom_point(size=2)+theme(legend.position="bottom")+labs(colour="Test Preparation",title="Average Scores on Test Preparation among Race",y="Race / Ethnicity",x="Average Score")

plot(Race, `Average Scores`, main="Avearage Scores on Race / Ethnicity", xlab="Race / Ethnicity", ylab= "Average Scores", col=colours, las=1)