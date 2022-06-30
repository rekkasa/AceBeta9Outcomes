#' @export
execute <- function(
    connectionDetails,
    oracleTempSchema = NULL
) {

  rseeAnalysisPath <- system.file(
    "settings",
    "excluded_covariate_concept_ids.csv",
    package = "AceBeta9Outcomes"
  )

  rseeAnalysis <- jsonlite::fromJSON(
    unlist(
      jsonlite::read_json(rseeAnalysisPath)
    )
  )

  databaseSettings <- rseeAnalysis$databaseSet

  cdmDatabaseSchema <- databaseSettings$cdmDatabaseSchema
  cohortDatabaseSchema <- databaseSettings$cohortDatabaseSchema
  outputFolder <- analysisSettings$saveDirectory

  generateAllCohorts(
    connectionDetails = connectionDetails,
    cdmDatabaseSchema = cdmDatabaseSchema,
    cohortDatabaseSchema = cohortDatabaseSchema,
    oracleTempSchema = oracleTempSchema,
    indicationId = "Hypertension",
    outputFolder = outputFolder
  )

  RiskStratifiedEstimation::runRiskStratifiedEstimation(
    connectionDetails = connectionDetails,
    analysisSettings = analysisSettings,
    databaseSettings = databaseSettings,
    getDataSettings = getDataSettings,
    covariateSettings = covariateSettings,
    populationSettings = populationSettings,
    runSettings = runSettings
  )


  return(NULL)
}
