
# NA ----------------------------------------------------------------------


missed <- NA
missed == "NA"
missed == ""
missed == NA
Joe <- NA
Mary <- NA
Joe == Mary
n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[5] <- NA
n
mean(n)
n == NA
is.na(n)
n[-5]
all(n != NA)
#Посчитать среднее вектора n без NA (используя функцию is.na())
mean(n[!is.na(n)])
#Посчитать среднее вектора n без NA (НЕ используя функцию is.na())

mean(n, na.rm = TRUE)
NA ^ 0
NA & FALSE
typeof(NA)
c("hey", NA)
as.character(c(1L, NA))
c("hey", NA_character_)
NaN
typeof(1 / 0)
-1 / 0
1 / 0 > 10000000000
0 / 0
mean(c(NA, NA, NA), na.rm = TRUE)
is.nan(NaN)
is.na(NaN)
is.na(NA)
is.nan(NA)
NULL


# Matrix ------------------------------------------------------------------

matrix(1:12, nrow = 4, ncol = 3)
A <- matrix(1:12, nrow = 4)
A[2, 3]
A[1:2, 2:3]
A[A > 10]
A[1:2, ]
A[, 2:3]

A[1:2, 1:2] <- 100
attributes(A)
attr(A, "dim") <- NULL
attributes(A)
A
attr(A, "dim") <- c(6, 2)
A
A[1:3]
c(A)
attr(A, "dim") <- c(3, 2, 2)
A
class(A)

matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
outer(1:9, 1:9, `*`)
m <- matrix(rep(1:9, 9), nrow = 9)
t(m) * m
1:9 %o% 1:9

simple_list <- list(42, "Hey", TRUE)
simple_list
complex_list <- list(1:10, letters, simple_list, A, mean)
complex_list
str(complex_list)
is.vector(1:10)
is.vector(simple_list)
is.atomic(1:10)
is.atomic(simple_list)
is.list(simple_list)
is.recursive(simple_list)

named_list <- list(name = "Veronika", age = 26, student = TRUE)
named_list
named_list$name
named_list[1]
named_list["name"]
class(named_list$name)
class(named_list[1])
named_list[[1]]

list1 <- list(numbers = 1:5, letters = letters, logic = TRUE)
list2 <- list(pupa = list1, lupa = list1)
list2[[1]][[2]][3]
tt <- t.test(rnorm(30), rnorm(30))
class(tt)
str(tt)
tt
methods(print)
tt$p.value

df <- data.frame(name = c("Алехандро", "Ноам", "Фаина", "Натали", "Фиона"),
               age = c(30, 96, 41, 59, 25),
               student = c(FALSE, TRUE, TRUE, FALSE, TRUE))

class(df)
df[2, 2]
df[1:2, 1:2]
df$name
df$age
df$student
df[df$age > mean(df$age), ]
df[1:2, c("age", "name")]
df$name[df$student]
df$lovesR <- TRUE
df$lovesR <- NULL
df
mtcars
rownames(mtcars)
