library(tidyverse)
library(here)
library(magrittr)
library(conflicted)

source(here('scripts', '01-helper-functions.R'))
source(here('scripts', '02-party-name-generator.R'))

# simulation params
set.seed(1337)

N <- 1e3

# simulate dataset
d <- tibble(sex = sample(c('m', 'f'), size = N, replace = T),
            age = sample(18:55, size = N, replace = T),
            years_service = sample(0:38, size = N, replace = T),
            n_children = sample(1:6,
                                prob = c(.35, .25, .15, .10, .085, .065),
                                replace = T,
                                size = N),
            work_satisf = rnorm(N, mean = 60, sd = 5),
            elections_2020 = sample(v_party_names,
                                    replace = T, size = N))

d %<>%
    mutate_at(.,
              vars(work_satisf), round, 2)

# delete random values
prob_missing <- .05

d %<>% makeMissing(.,
                   .prob_missing = prob_missing)

write_csv(d, here('data', 'anketa.csv'))
