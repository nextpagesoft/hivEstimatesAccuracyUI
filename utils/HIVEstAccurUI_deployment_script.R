branchName <- "0.10"

file.copy("~/_REPOSITORIES/hivEstimatesAccuracy/inst/shiny/app.R",
          "~/_REPOSITORIES/hivEstimatesAccuracyUI/app.R",
          overwrite = TRUE)
file.copy("~/_REPOSITORIES/hivEstimatesAccuracy/packrat/packrat.lock",
          "~/_REPOSITORIES/hivEstimatesAccuracyUI/packrat/packrat.lock",
          overwrite = TRUE)

packrat::restore(overwrite.dirty = TRUE, prompt = FALSE)
devtools::install_github("nextpagesoft/hivEstimatesAccuracy",
                         ref = branchName,
                         dependencies = FALSE)

rsconnect::deployApp(appDir = getwd(),
                     appName = "hivEstimatesAccuracyUI",
                     appFiles = c("app.R"),
                     contentCategory = "application",
                     forceUpdate = TRUE,
                     account = "ecdc")
