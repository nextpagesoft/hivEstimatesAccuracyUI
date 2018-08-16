remove.packages("hivEstimatesAccuracy")
devtools::install_github("nextpagesoft/hivEstimatesAccuracy")
packrat::status()
packrat::snapshot(ignore.stale = TRUE)
packrat::clean(dry.run = TRUE)
rsconnect::deployApp(appDir = getwd(),
                     appName = "hivEstimatesAccuracyUI",
                     appFiles = c("app.R"),
                     contentCategory = "application",
                     forceUpdate = TRUE,
                     account = "ecdc")
