makeMissing <- function(.data, .prob_missing = .025) {

    for (i in 1:ncol(.data)) {

        .na_vec <- sample(c(T, F),
                          prob = c(.prob_missing, 1 - .prob_missing),
                          replace = T,
                          size = length(.data[[i]]))

        .data[.na_vec, i] <- NA

    }

    return(.data)
}
