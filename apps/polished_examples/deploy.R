# script for deploying these example apps to Polished Hosting
library(polished)
library(funr)
library(envDocument)

# read in your Polished API key
my_config <- config::get(file = "config.yml")

app_name <- ""
app_1 <- "01_minimal_example"
app_2 <- "02_custom_sign_in"
app_3 <- "03_no_invite_required"
app_4 <- "04_apps_dashboard"
app_4a <- "04_basic_insurer_dashboard"
app_4b <- "04_interest_rate_walk"
app_5 <- "05_flex_dashboard"
app_6 <- "06_social_sign_in"
app_7 <- "07_alt_sign_in_ui"

#pathFile <- getScriptPath(absolute = TRUE)
#pathFile

path <- funr::get_script_path()
path

full_path <- paste(path, app_7, sep = "/")

deploy_app(
  app_dir = full_path,
  api_key = my_config$api_key,
  app_name = app_name,
  r_ver = "4.1.1"
)


