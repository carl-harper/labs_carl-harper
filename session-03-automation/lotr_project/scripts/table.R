library(dplyr)

lotr_dat <- read_tsv("./session-03-automation/lotr_project/data/processed/lotr_clean.tsv") %>% 
  # reorder Species based on words spoken
  mutate(Species = reorder(Species, Words, sum))

summary_lotr <- lotr_data |>
  select(words_spoken, Species, Film) |> 
  group_by(Species, Film)
  summarize(
    Characters = n(),
    Words = sum(Words),
    .groups = "drop")

# save summary table
write_tsv(summary_lotr, "./session-03-automation/lotr_project/outputs/tables/lotr_summary_table.tsv")
  