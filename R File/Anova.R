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

windows(height = 4, width = 6)
colours <- c("red","palevioletred1","khaki1","palegreen1","skyblue1","mediumorchid1")
boxplot(`Average Scores`~`Parent Degree`, main="Average Scores on Parental Education", xaxt="none", ylab="Average Scores",xlab="Parental Level of Education", ylim=c(0,100), las=1, col=colours)

legend(x=0.2, y=30, legend=c("Associate's \ndegree","Bachelor's \ndegree","High \nSchool","Master's \ndegree","Some \ncollege","Some \nHigh \nSchool"),fill=colours,horiz=TRUE,text.width=0.71, bty="n", cex=0.7)

class(`Average Scores`)
class(`Parent Degree`)
levels(`Parent Degree`)

#Ho: Mean average scores is the same for all parents' education level
#H1: At least one mean is different.
ANOVA1 <- aov(`Average Scores` ~ `Parent Degree`)
ANOVA1
summary(ANOVA1)

# Critical Region
n = 1000
k = 6
df1 = k-1
df2 = k*(n-1)
f.alpha = qf(.95, df1, df2)
f.alpha

TukeyHSD(ANOVA1)
par(mar=c(4,10,3,3))
plot(TukeyHSD(ANOVA1), las=1, cex.axis=0.65, col="red")