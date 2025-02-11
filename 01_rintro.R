sqrt(16)
#SQRT(16) #doesn't work
log(8)
log(x = 8, base = 2)
log(8, 2)

7 / 2
7 %/% 2
7 %% 2

?`+`
`+`(5, 6)

a = 2
a <- 3
#print(a)
b <- a ^ a - a / a

e <- b ^ a
rm(e)
#rm(list = ls())
a == b
a != b
5!=120
a > b
a < b
a >= b
a >= a
a <= b
b <= b
age <- 30
age >= 18
pi
sin(pi)


2 ^ 200
options(scipen = 999)
sin(pi)
2 ^ 200
sin(pi)
sqrt(2) ^ 2 == 2
all.equal(sqrt(2) ^ 2, 2)
is.integer(2)
as.integer(2)
is.integer(2L)
typeof(2)
typeof(pi)
typeof(5+3i)

s <- "hello dear new 'R' users"
s1 <- 'hello, dear new "R" users'
s
s1

paste("hello", "world")
paste("hello", "world", sep = "__<3__")
paste("hello", "world", sep = "")
paste0("hello", "world")

t1 <- TRUE
f1 <- FALSE

comparison <- a == b

!t1
!f1
#!!t1

t1 & t1 #TRUE
t1 & f1 #FALSE
f1 & t1 #FALSE
f1 & f1 #FALSE

t1 | t1 #TRUE
#xor(t1, t1)
t1 | f1 #TRUE
f1 | t1 #TRUE
f1 | f1 #FALSE

age
age >= 18 & age < 30

age < 18 | age >= 30

# Создание векторов -------------------------------------------------------


c(4, 8, 15, 16, 23, 42)
c("Hello", "world")
paste("hello", "world")
c(TRUE, FALSE)
c(4, 8)

1:10
5.5:10
5:-3
10:10:100
10:100

seq(10, 100, by = 10)
seq(1, 13, length.out = 7)
seq_len(20)
seq_along(c(4, 8, 15, 16, 23, 42))

rep(1, 20)
rep(1:4, 5)
rep(1:3, c(20, 4, 10))
rep(1:3, each = 5)
c(c(20, 4, 10), 2, 1:4)
1:10
sum(1:10)
mean(1:10)

c(1, 5)
c(1:5)


# Coercion ----------------------------------------------------------------

c(FALSE, 2L)
2 + TRUE
c("hi", TRUE, 3)

as.character(c(TRUE, FALSE, TRUE))
as.integer(c(TRUE, FALSE, TRUE))
as.character(c(1, 2, 3))
as.integer(c("1", "2", "three"))

ve <- 1:10
c(ve, "hi")
