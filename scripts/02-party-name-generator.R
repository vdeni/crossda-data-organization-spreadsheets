library(tidyverse)
library(here)
library(magrittr)
library(conflicted)

# function to generate party names from a vector of words and occurecnce
# probablities
generateParties <- function(.names, .relative_frequencies, .n_parties,
                            .length_lo = 3, .length_hi = 5) {

    .out <- vector(length = .n_parties, mode = 'character')

    for (i in 1:.n_parties) {

        .size <- sample(.length_lo:.length_hi, size = 1)

        .words <- sample(.names, prob = .relative_frequencies,
                         replace = T, size = .size)

        .name <- paste(.words, collapse = ' ')

        .out[[i]] <- .name
    }

    return(.out)
}

# create political party names from most common words in Croatia's party
# registry
.d_stranke <- read_csv2(here('data', 'politicke-stranke.csv'))

.d_imena_stranaka <- .d_stranke$NAZIV

# clean and split
.d_imena_stranaka %<>%
    str_split(.,
              pattern = '\\s+(-)?') %>%
    unlist(.) %>%
    str_subset(.,
               '^$', negate = T) %>%
    str_replace_all(.,
                    '[^[:word:]]', '')

.d_freq_stranke <- table(.d_imena_stranaka) %>%
    as_tibble(.)

.d_freq_stranke %<>%
    mutate(.,
           rel_freq = n / nrow(.))

.d_freq_stranke %<>%
    rename(.,
           'ime' = .d_imena_stranaka)

# create `n_part` parties by sampling from word by frequency
set.seed(1)

.n_part <- 4

v_party_names <- generateParties(.names = .d_freq_stranke$ime,
                                 .relative_frequencies =
                                     .d_freq_stranke$rel_freq,
                                 .n_parties = .n_part)

rm(list = ls(pattern  = '^\\.', all = T))
