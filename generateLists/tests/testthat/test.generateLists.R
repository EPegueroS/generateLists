testthat::test_that("generateLists result matches reference result", {
  alphabet <- c("A", "C", "G", "T")
  word_length <- 4
  min_distance <- 3
  required_words <- 2

  res <-
    generateLists::generateLists(
      alphabet = alphabet,
      word_length = word_length,
      required_words = required_words,
      min_dist = min_distance,
      seed_word = c("A", "A", "G", "T")
    )

  ref <- list(c("A", "A", "G", "T"), c("C", "A", "A", "A"))

  testthat::expect_equal(res, ref)

})
