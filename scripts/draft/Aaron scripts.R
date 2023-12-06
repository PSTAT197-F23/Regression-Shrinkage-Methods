# Loading Packages

library(tidymodels)
library(ISLR) # load  Major League Baseball Data from the 1986 and 1987 season
library(ISLR2)
library(tidyverse)
library(glmnet)
library(modeldata)
library(ggthemes)
library(janitor) # for naming conventions
library(naniar) # to assess missing data patterns
library(corrplot) # for a correlation plot
library(themis) # for upsampling
library(dplyr)
library(tidyr)
tidymodels_prefer()

# Tidying Data

Hitters <- na.omit(Hitters) # removing observation with missing value
head(Hitters) # show first few rows of the data set

# The objective of this project is to perform ridge regression and the Lasso regression. Subsequently, we'll implement them and predict salaries using the Hitters dataset.

# model.matrix() function is used to produce a matrix corresponding to the predictor variables.
# it is especially useful here, because it also automatically transforms any qualitative variables into dummy variable.
x <- model.matrix(Salary~., Hitters)[,-1]
y <- Hitters$Salary

# Ridge Regression
grid <- 10^seq(10, -2, length = 100)
ridge_mod <- glmnet(x, y, alpha = 0, lambda = grid)

# The variables in glmnet function:

# alpha: determining what type of model is fitting.
## alpha = 1: showing the lasso regression model is fitting (the default value)
## alpha = 0: showing the ridge regression model is fitting

# lambda: the range of lambda value
## in above, we have chosen to implement the function over a grid of values from 10^10 to 10^-2

ridge_mod$lambda[70] # displaying the 70th lambda value
coef(ridge_mod)[,70] # displaying coefficients 

sum(coef(ridge_mod)[-1,70]^2) # Calculate L2 norm squared

# Comparing it to the 60th lambda

ridge_mod$lambda[60] #Display 60th lambda value
coef(ridge_mod)[,60] # Display coefficients

sum(coef(ridge_mod)[-1,60]^2) # Calculate L2 norm squared

# we observed that the L2 norm squared of the coefficients decreases when lambda value increases

pred <- predict(object = ridge_mod, newx = x)
head(pred)

set.seed(123) # set seed.
cv.out.ridge <- cv.glmnet(x, y, alpha = 0)
plot(cv.out.ridge)
abline(v = log(cv.out.ridge$lambda.min), col="red", lwd=3, lty=2)

bestlam <- cv.out.ridge$lambda.min
bestlam

bestlam1 <- cv.out.ridge$lambda.max
bestlam1

out <- glmnet(x,y,alpha=0)
predict(out,type="coefficients",s=bestlam)[1:20,]

# if we use cv.out.ridge$lambda.max here, it would give us the highest MSE, the penalty value will shrink all the parameters close to 0.

# Lasso Regression

grid <- 10^seq(10, -2, length = 100)
lasso.mod <- glmnet(x, y, alpha=1, lambda=grid)
plot(lasso.mod, xvar="lambda", label = TRUE)

set.seed(123) # set seed
cv.out.lasso <- cv.glmnet(x, y, alpha = 1)
plot(cv.out.lasso)
abline(v = log(cv.out.lasso$lambda.min), col="red", lwd=3, lty=2)

bestlam = cv.out.lasso$lambda.min
bestlam
# when lambda = bestlam, the MSE is the lowest

out<-glmnet(x,y,alpha=1,lambda=grid)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef1=predict(out,type="coefficients",s=0)[1:20,]
lasso.coef
lasso.coef1
