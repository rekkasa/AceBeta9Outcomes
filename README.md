# A standardized framework for risk-based assessment of treatment effect heterogeneity in observational healthcare databases

## Requirements

- A database in [Common Data Model version 5](https://github.com/OHDSI/CommonDataModel).
- R version 4.0.2
- On Windows: [RTools](https://cran.r-project.org/bin/windows/Rtools/)
- [Java](https://www.java.com/en/)

## How to run

- Follow [these instructions](https://ohdsi.github.io/Hades/rSetup.html) on setting up your R environment.
- Clone the repository.
- Open the package in RStudio and install all dependencies with:

```r
install.packages("renv")
renv::activate()
renv::restore()
```
- Build the package in RStudio selecting `Build > Install and restart`. This will install the `AceBeta9Outcomes` package
- Once installed you need to define your connection details to the database and the database settings:
```r
library(AceBeta9Outcomes)

connectionDetails <- DatabaseConnector::createConnectionDetails(
  dbms = "postgresql",
  server = "some.server.com/ohdsi",
  user = "username",
  password = "password"
)
```
