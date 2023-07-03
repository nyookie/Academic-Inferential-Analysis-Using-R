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

plot(`Reading Score`,`Writing Score`,col=5,pch=21,main="Scatterplot of Writing Scores vs Reading Scores", xlab="Reading Score", ylab="Writing Score")
abline(lm(`Reading Score` ~ `Writing Score`),col=4,lwd=2)

# H0: Writing Score and Reading score has NO linear regression
# H1: linear regression exist
# other values in default 
# cor.test(reading.score,writing.score,method = "qr",
#         model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
#         singular.ok = TRUE, contrasts = NULL)
cor(`Reading Score`,`Writing Score`)
mod<-lm(`Writing Score` ~ `Reading Score`)
summary(mod)
attributes(mod)