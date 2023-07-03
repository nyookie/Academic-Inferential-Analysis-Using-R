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

boxplot(`Average Scores` ~ Gender, main="Average Scores on Gender", col=c("mediumorchid1", "skyblue1"))

# H0: mean average scores of female = male
# H1: mean scores NOT EQUAL between female and male
# two-sided test
# assume not-equal variances
# other values in default 
# t.test(`Average Scores` ~ Gender, mu=0, alt="two.sided", 
#         conf=0.95, var.eq=F, paired=F)

t.test(`Average Scores` ~ Gender)
var(`Average Scores` [Gender=="female"])
var(`Average Scores` [Gender=="male"])