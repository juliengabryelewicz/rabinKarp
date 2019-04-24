context("Rabin Karp Algorithm")

test_that("rk_hashstring works", {
  expect_equal(rk_hashstring("test",4)," 116 101 115 116")
})

test_that("rk_checkpattern works", {
  lengthtxt <- nchar("ceci est un message")
  lengthpattern <- nchar("message")
  txt_hash <- rk_hashstring(substr("ceci est un message", 0, lengthpattern), lengthpattern)
  pattern_hash <- rk_hashstring("message", lengthpattern)
  expect_equal(rk_checkpattern("message", "ceci est un message", lengthtxt, lengthpattern, txt_hash, pattern_hash),TRUE)
})

test_that("rk_patternfound works", {
  txt <- "ceci est un message"
  pattern <- c("message","New York","this","ceci")
  expect_equal(rk_patternfound(txt, pattern),c("message","ceci"))
})
