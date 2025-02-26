pow <- function(x, p) {
  power <- x ^ p
  return(power)
}
pow(3, 2)

pow <- function(x, p) x ^ p

pow(3, 4)

pow <- function(x, p = 2) x ^ p
pow(10)
pow(10, 4)

w <- 70
h <- 1.9
w/(h ^ 2)

imt <- function(weight, height) weight/(height ^ 2)
imt(weight = 70, height = 1.6)

factors <- function(x) which(x %% 1:x == 0)
is_prime <- function(x) length(factors(x)) == 2 
is_prime(2021)

is_prime2 <- function(x) all(x %% 2:(x - 1) != 0)
is_prime2(2021)
is_prime2(2025)
is_prime2(2017)

some_function <- function(x, whatever, d = y ^ 2) {
  y <- x + 1
  d
}
some_function(3)

a <- 1
b <- 1
f1 <- function(){
  a <- 10
  d <<- 10
  print(a)
  print(b)
  f2 <- function(){
    a <<- 100
    b <<- 100
    d <<- 100
    e <<- 100
  }
   f2() 
  print("now f2()")
  print(a)
  print(b)
  print(d)
  print(e)
  
}
f1()
a
b
d
e

mean[1]
list(mean, min, `[`)

A <- matrix(1:12, 3)
A
rowSums(A)
rowMeans(A)
colSums(A)
colMeans(A)

apply(A, 2, sum)
A[2, 2] <- NA
A
apply(A, 1, mean, na.rm = TRUE)

neo <- c("Wake", "up", "Neo", "you", "are", "in", "the", "matrix")
B <- matrix(neo, ncol = 2)
sum_char <- function(x) sum(nchar(x))
apply(B, 1, sum_char)
apply(B, 1, function(string) sum(nchar(string)))
apply(B, 1, \(string) sum(nchar(string)))

some_list <- list(some = 1:10, list = letters)
length(some_list)
lapply(some_list, length)
sapply(some_list, length)

install.packages("purrr")
library(purrr)
map(some_list, length)
map(some_list, 2)
#lapply(some_list, function(x) x[[2]])

map_int(some_list, length)
map_chr(some_list, length)

many_means <- replicate(1000, mean(rlnorm(30)))
hist(many_means)

sapply(1:10, sqrt)
sqrt(1:10)

install.packages("bench")
bench::mark(
  sapply(1:100, sqrt),
  map_dbl(1:100, sqrt),
  sqrt(1:100)
)

is_prime(2023)
is_prime(4:10)
is_prime_vectorized <- Vectorize(is_prime)
is_prime_vectorized(4:10)
lapply(4:10, is_prime)
map_lgl(4:10, is_prime)
