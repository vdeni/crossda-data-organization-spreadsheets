library(tidyverse)
library(here)
library(magrittr)
library(conflicted)

# create political party names from most common words in Croatia's party
# registry
d_stranke <- read_csv2(here('data', 'datasets', 'politicke_stranke.csv'))

d_imena_stranaka <- d_stranke$NAZIV

# clean and split
d_imena_stranaka %<>%
    str_split(.,
              pattern = '\\s+(-)?') %>%
    unlist(.) %>%
    str_subset(.,
               '^$', negate = T) %>%
    str_replace_all(.,
                    '[^[:word:]]', '')

d_freq_stranke <- table(d_imena_stranaka) %>%
    as_tibble(.)

d_freq_stranke %<>%
    mutate(.,
           rel_freq = n / nrow(.))

d_freq_stranke %<>%
    rename(.,
           'ime' = d_imena_stranaka)

# create `n_part` parties by sampling from word by frequency
set.seed(159)

n_part <- 20

v_party_names <- vector(length = n_part, mode = 'character')

for (i in 1:n_part) {
    .size <- sample(3:5, size = 1)

    .words <- sample(d_freq_stranke$ime, prob = d_freq_stranke$rel_freq,
                     replace = T, size = .size)

    .name <- paste(.words, collapse = ' ')

    v_party_names[[i]] <- .name
}

# simulation params
set.seed(1337)

N <- 1e3

prob_missing <- .025

d <- tibble(sex = sample(c('m', 'f'), size = N, replace = T),
            age = sample(18:55, size = N, replace = T),
            years_service = sample(0:38, size = N, replace = T),
            n_children = sample(1:6,
                                prob = c(.35, .25, .15, .10, .085, .065),
                                replace = T,
                                size = N),
            work_satisf = rnorm(N, mean = 60, sd = 5),
            elections_2020 = sample(c('HDH', 'SUPJ', 'FPMS', 'JUPH'),
                                    replace = T, size = N))
