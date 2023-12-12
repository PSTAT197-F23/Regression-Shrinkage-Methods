# Vignette - Regression Shrinkage Methods

Vignette on utilizing regression shrinkage methods on MLR data; created as a class project for PSTAT197A in Fall 2023.

### Contributors

Ryan Yee, Aaron Lee

## Abstract

This project explores the application of regularization techniques, specifically Ridge and Lasso regression, to predict Major League Baseball (MLB) player salaries based on various player statistics from the 1986 and 1987 seasons. Using the Hitters dataset, the study investigates the impact of Ridge and Lasso regression in handling multicollinearity and variable selection. The process involves data exploration, tidying, and the implementation of both Ridge and Lasso regression models. The project further delves into the integration of Principal Component Analysis (PCA) to address collinearity in predictor variables. Finally, an Elastic Net regression model is employed, combining Lasso and Ridge penalties. The hyperparameter tuning process, model selection, and the evaluation of the chosen model's performance are also discussed. This comprehensive analysis provides insights into the effectiveness of different regularization techniques in statistical modeling.

#### Our Data

The Hitters data set includes the Major League Baseball (MLB) Data from the 1986 and 1987 seasons. In this data frame, there are 322 observations (rows) of major league players with 20 variables (columns).

- `AtBat`: The number of times a player at bat in 1986 season.
- `Hits`: The number of a player hits in 1986 season.
- `HmRun`: The number of Home runs in 1986 season.
- `Runs`: The number of runs in 1986 season.
- `RBI`: The number of runs batted in 1986 season.
- `Walks`: The number of walks in 1986 season.
- `Years`: The number of years the player stayed in the major leagues.
- `CAtBat`: The number of times at bat during career.
- `CHits`: The number of hits during career.
- `CHmRun`: The number of home runs during career.
- `CRuns`: The number of runs during career.
- `CRBI`: The number of runs batted in during career.
- `CWalks`: The number of walks during career.
- `League`: A factor with levels A and N indicating player's league at the end of 1986.
- `Division`: A factor with levels E and W indicating player's division at the end of 1986.
- `PutOuts`: The number of put outs in 1986 season.
- `Assists`: The number of assists in 1986 season.
- `Errors`: The number of errors in 1986 season.
- `Salary`: 1987 annual salary on opening day in thousands of dollars.
- `NewLeague`: A factor with levels A and N indicating player's league at the beginning of 1987.

Our outcome variable is *Salary*, which represents the predicted salary of the player.

##### Source

This dataset was taken from the StatLib library which is maintained at Carnegie Mellon University. This is part of the data that was used in the 1988 ASA Graphics Section Poster Session. The salary data were originally from Sports Illustrated, April 20, 1987. The 1986 and career statistics were obtained from The 1987 Baseball Encyclopedia Update published by Collier Books, Macmillan Publishing Company, New York.

## Repository Contents

Structure of this repository:

```         
root directory
├── data
   ├── Hitters.csv
├── scripts
   ├── drafts
   ├── vignette.R
├── img
├── vignette.qmd
├── vignette.html
├── README.md 
└── .gitignore
```

The data folder contains our raw, MLB Hitters data set. The scripts folder contains a drafts folder, which is where individual contributors can keep their work; and vignette.R, which are scripts with line annotations that replicate the results shown in the primary vignette document for the respective parts. Images are kept in the img folder, and vignette.qmd is our primary vignette document.

## References

Our data: https://www.kaggle.com/datasets/floser/hitters/

James, G., Witten, D., Hastie, T., and Tibshirani, R. (2013) An Introduction to Statistical Learning with applications in R, https://www.statlearning.com, Springer-Verlag, New York

#### Learn about Shrinkage Methods
- https://www.youtube.com/watch?v=lLlG5xkyqIA
- https://busigence.com/blog/shrinkage-methods-in-linear-regression/

#### Learn about Elastic Net Regression
- https://www.youtube.com/watch?v=1dKRdX9bfIo
- https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.ElasticNet.html