# load packages ----------------------------------------------------------------

library(ghclass)
library(tidyverse)
library(glue)

# inputs -----------------------------------------------------------------------

org <- "ghclass-demo"
roster <- read_csv("materials/05-rmd-git/github-demo/roster.csv")

# hw-01 ------------------------------------------------------------------------

org_create_assignment(
  org = org,
  repo = paste0("hw-01-", roster$github_name),
  user = roster$github_name,
  source_repo = paste0(org, "/", "hw-01")
)

# lab-01 -----------------------------------------------------------------------

org_create_assignment(
  org = org,
  repo = paste0("lab-01-", roster$github_name),
  user = roster$github_name,
  team = roster$team_name,
  source_repo = paste0(org, "/", "lab-01")
)

# check stats ------------------------------------------------------------------

org_repo_stats(
  org = org,
  branch = "main",
  filter = "hw-01"
)

# add feedback for hw-01 -------------------------------------------------------

feedback_hw_01 <- read_csv("materials/05-rmd-git/github-demo/feedback-hw-01.csv")

feedback_hw_01 <- feedback_hw_01 %>%
  mutate(
    issue_text = glue("Dear @{github_name}: {feedback}")
  )

issue_create(
  repo  = paste0("ghclass-demo/hw-01-", roster$github_name),
  title = "HW 01 Feedback",
  body  =  feedback_hw_01$issue_text
)
