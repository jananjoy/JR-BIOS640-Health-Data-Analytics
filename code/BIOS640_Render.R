# ============================================================
# Author - Jananjoy Rajkumar
# Renders the R Markdown file according to its YAML configuration
# ============================================================

library(rmarkdown)
library(here)

# Use for testing the Code
#repo_dir <- "C:/Users/janan/OneDrive/Documents/GitHub/JR-BIOS640-Health-Data-Analytics"
repo_dir <- here::here()

print(repo_dir)

# Input the repository path, source folder and file name 
rmd_file <- file.path(
  repo_dir,
  "code",
  "BIOS640_Week4.Rmd" 
)

reports_dir <- file.path(
  repo_dir,
  "reports"
)

# ------------------------------------------------------------
# Set repository root
# ------------------------------------------------------------

setwd(repo_dir)

# ------------------------------------------------------------
# Check input file
# ------------------------------------------------------------

if (!file.exists(rmd_file)) {
  stop(
    "R Markdown file does not exist: ",
    rmd_file
  )
}

# ------------------------------------------------------------
# Create reports directory
# ------------------------------------------------------------

if (!dir.exists(reports_dir)) {
  dir.create(
    reports_dir,
    recursive = TRUE
  )
}

# ------------------------------------------------------------
# Render according to YAML configuration in the Rmd
# ------------------------------------------------------------

rmarkdown::render(
  input = rmd_file,
  output_dir = reports_dir,
  knit_root_dir = repo_dir,
  clean = TRUE
)

# ------------------------------------------------------------
# Confirm output
# ------------------------------------------------------------

cat("\nRendering completed successfully.\n")
cat("Output directory:\n")
cat(reports_dir, "\n")
