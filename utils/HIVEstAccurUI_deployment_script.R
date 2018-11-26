branchName <- "1.0"

file.copy("../hivEstimatesAccuracy/inst/shiny/app.R",
          "app.R",
          overwrite = TRUE)
file.copy("../hivEstimatesAccuracy/packrat/packrat.lock",
          "packrat/packrat.lock",
          overwrite = TRUE)

appFile <- file("app.R")
appLines <- readLines(appFile)
appLines[1] <- "isLocalRun <- FALSE"
writeLines(appLines, appFile)
close(appFile)

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
