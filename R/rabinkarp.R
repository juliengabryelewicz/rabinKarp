rabinkarp <- function(txt, pattern){
  rk_check(txt, pattern)
  lengthtxt <- nchar(txt)
  patternfound <- vector()
  k <- 1
  for (i in 1:length(pattern)) {
    lengthpattern <- nchar(pattern[i])
    txt_hash <- rk_hashstring(substr(txt, 0, lengthpattern), lengthpattern)
    pattern_hash <- rk_hashstring(pattern[i], lengthpattern)
    for (j in 1:(lengthtxt)) {
      txt_hash <- rk_hashstring(substr(txt, j, j+lengthpattern), lengthpattern)
      if (txt_hash==pattern_hash) {
        patternfound[k] <- pattern[i]
        k=k+1
      }
    }
  }
  unique(patternfound)
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
  Check <- ArgumentCheck::newArgCheck()
  if (!(is.character(txt) & length(txt) == 1)){
    ArgumentCheck::addError(
      msg = "'texte' must be a string",
      argcheck = Check
    )
  }
  if (!is.vector(pattern)){
    ArgumentCheck::addError(
      msg = "'pattern' must be a vector",
      argcheck = Check
    )
  }
  ArgumentCheck::finishArgCheck(Check)
}
