devtools::install_github("nextpagesoft/hivEstimatesAccuracy")
packrat::snapshot()
rsconnect::deployApp(appDir = getwd(),
                     appFiles = c("app.R"),
                     forceUpdate = TRUE)
