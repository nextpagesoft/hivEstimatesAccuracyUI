devtools::uninstall("hivEstimatesAccuracy")
devtools::install_github("nextpagesoft/hivEstimatesAccuracy")
packrat::snapshot(ignore.stale = TRUE)
rsconnect::deployApp(appDir = getwd(),
                     appFiles = c("app.R"),
                     forceUpdate = TRUE)
