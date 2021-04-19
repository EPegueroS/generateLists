#' Generate a list of all possible combinations of letters of an specified length
#'
#'
#' @param alph character, an alphabet, e.g. c("A", "C", "G", "T")
#' @param len numeric, desired length of the words
#'
words <- function(alph, len) {
  if (len <= 1) {
    return(as.list(alph))
  } else {
    appendEachElement(words(alph, len - 1), alph)
  }
}

#' Append elements of an alphabet to construct words
#'
#' @param L character, an alphabet, e.g. c("A", "C", "G", "T")
#' @param a numeric, desired length of the words
#'
appendEachElement <- function(L, a) {
  unlist(lapply(a,
                function(n)
                  lapply(L, function(l)
                    c(l, n))), recursive = FALSE)
}

#' Tests if a set of words contains a query at an specified hamming distance
#'
#' @param min_dist numeric, minimum distance to be satisfied
#' @param query character, a word
#' @param word_list list, list of words
#'
testElement <- function(min_dist, query, word_list) {
  all(unlist(lapply(word_list, function(x) {
    sum(query != x)
  })) >= min_dist)
}

#' Tests if a set of words contains a query at an specified hamming distance
#'
#' @param alphabet character, an alphabet, e.g. c("A", "C", "G", "T")
#' @param word_length numeric, desired length of the words
#' @param required_words numeric, number of required words
#' @param min_dist numeric, minimum distance to be satisfied
#' @param seed_word character, optional parameter to use as the first word (it can cause an infinite loop)
#'
#' @export
#'
generateLists <-
  function(alphabet,
           word_length,
           required_words,
           min_dist,
           seed_word = NULL) {
    dict <- words(alphabet, word_length)

    dict <- words(alphabet, word_length)
    N <- 0
    word_list <- vector(mode = "list")
    while (N < required_words) {
      if (is.null(seed_word)) {
        seed_word <-
          sample(x = alphabet,
                 replace = TRUE,
                 size = word_length)
      }

      i <- 1
      word_list[[1]] <- seed_word

      for (w in dict) {
        if (testElement(min_distance, w, word_list = word_list)) {
          i <- i + 1
          word_list[[i]] <- w
        }
        if (i == required_words)
          break
      }
      N <- length(word_list)
    }

    return(word_list)
  }
