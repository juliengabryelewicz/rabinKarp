# rabinkarp
R package for Rabin-Karp Algorithm

## Installation

The package can be installed by installing devtools and calling the install_github function :

```R
library(devtools)
install_github("juliengabryelewicz/rabinkarp")
```

## How to use

rabinkarp needs a string and a vector to work. This way

```R
rabinkarp("this is a message from Paris", c("message","New York","this"))
[1] "message" "this"
```