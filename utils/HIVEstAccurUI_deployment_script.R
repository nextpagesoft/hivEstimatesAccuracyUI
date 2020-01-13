branchName <- "master"

file.copy("../hivEstimatesAccuracy/inst/shiny/app.R", "app.R", overwrite = TRUE)
file.copy("../hivEstimatesAccuracy/renv.lock", "renv.lock", overwrite = TRUE)

appFile <- file("app.R")
appLines <- readLines(appFile)
appLines[1] <- "isLocalRun <- FALSE"
writeLines(appLines, appFile)
close(appFile)

renv::restore()

options(download.file.method = "libcurl")
devtools::install_github(
  "nextpagesoft/hivModelling",
  ref = branchName,
  dependencies = FALSE,
  force = TRUE
)
devtools::install_github(
  "nextpagesoft/hivEstimatesAccuracy",
  ref = branchName,
  dependencies = FALSE,
  force = TRUE
)

rsconnect::showLogs(appPath = getwd(), streaming = TRUE, account = "nextpage")

rsconnect::deployApp(
  appDir = getwd(),
  appName = "hivEstimatesAccuracyUI",
  appFiles = c("app.R"),
  contentCategory = "application",
  forceUpdate = TRUE,
  account = "nextpage"
)
