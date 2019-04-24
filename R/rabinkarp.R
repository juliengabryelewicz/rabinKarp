rabinkarp <- function(txt, pattern){
  rk_check(txt, pattern)
  rk_patternfound(txt, pattern)
}

rk_patternfound <- function(txt, pattern){
  lengthtxt <- nchar(txt)
  patternfound <- vector()
  k <- 1
  for (i in 1:length(pattern)) {
    lengthpattern <- nchar(pattern[i])
    txt_hash <- rk_hashstring(substr(txt, 0, lengthpattern), lengthpattern)
    pattern_hash <- rk_hashstring(pattern[i], lengthpattern)
    if(rk_checkpattern(pattern[i], txt, lengthtxt, lengthpattern, txt_hash, pattern_hash)){
      patternfound[k] <- pattern[i]
      k=k+1
    }
  }
  unique(patternfound)
}

rk_checkpattern <- function(pattern, txt, lengthtxt, lengthpattern, txt_hash, pattern_hash){
  checkpattern <- FALSE
  for (j in 1:(lengthtxt)) {
    txt_hash <- rk_hashstring(substr(txt, j, j+lengthpattern), lengthpattern)
    if (txt_hash==pattern_hash) {
      checkpattern <- TRUE
    }
  }
  checkpattern
}

rk_hashstring <- function(str, len) {
  hash <- ''
  strvector <- strsplit(str, "")[[1]]
  for (i in 1:len) {
    hash <- paste(hash,utf8ToInt(strvector[i]))
  }
  toString(hash)
}

rk_check <- function(txt, pattern) {
  stopifnot((is.character(txt) & length(txt) == 1), (is.vector(pattern)))
}
