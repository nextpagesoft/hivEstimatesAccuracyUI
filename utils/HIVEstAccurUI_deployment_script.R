devtools::install_github("nextpagesoft/hivEstimatesAccuracy")
packrat::snapshot(ignore.stale = TRUE)
rsconnect::deployApp(appDir = getwd(),
                     appName = "hivEstimatesAccuracyUI",
                     appFiles = c("app.R"),
                     contentCategory = "application",
                     forceUpdate = TRUE,
                     account = "ecdc")
