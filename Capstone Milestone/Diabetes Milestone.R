diabetes <- read.csv("~/Documents/Springboard Capstone Project/Data Files/diabetes.csv")
str(diabetes)
for (i in 2:6) {
  diabetes <- diabetes[-which(diabetes[,i] ==0), ]}
str(diabetes)
hist(diabetes$Pregnancies)
hist(diabetes$Glucose)
hist(diabetes$BloodPressure)
hist(diabetes$SkinThickness)
hist(diabetes$Insulin)
hist(diabetes$BMI)
hist(diabetes$DiabetesPedigreeFunction)
hist(diabetes$Age)
X <- cor(diabetes)
corrplot(X, method = "circle")
set.seed(140)
training_set <- sort(sample(nrow(diabetes), nrow(diabetes)*.7))
diabetes_train <- diabetes[training_set,]
diabetes_test <- diabetes[-training_set,]
model <- glm(Outcome~.,data=diabetes_train,family = binomial(link='logit'))
summary(model)