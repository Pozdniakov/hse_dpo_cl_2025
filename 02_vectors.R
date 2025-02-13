n <- 1:4
m <- 4:1
m + n
n - m
n * m
n ^ m
n > m

(n + m) * n ^ m
sqrt(1:10)
k <-  c(10, 100)
n + k
n * 10
l <- c(10, 100, 1000)
n * l
1:20

sum(seq(1, 28, by = 3) / 3 ^ (0:9))
sum(seq(1, 28, by = 3) / 3 ^ (0:9) > 0.5)

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n
n[1]
n[10]
length(n)
n[length(n)]
head(n)
head(n, 1)
tail(n)
tail(n, 2)

n[3] <- 20
n
n[4:7]
n[c(1, 3, 10)]
#n[1, 3, 10] doesn't work!

4:7
c(4, 1:3, 100)
rep(1, 9)

n[length(n):1]
rev(n)
n
n[4:6] <- 0
n
n[-1]
n[-3:-7]
n[c(TRUE, FALSE, TRUE, FALSE, TRUE,
    FALSE, TRUE, FALSE, TRUE, FALSE)]

n[c(TRUE, FALSE)]
n
n > mean(n)
n[n > mean(n)]
n[0]
n[c(-1, 1)]
n[1:20]

my_named_vector <- c(first = 1, second = 2, third = 3)
names(my_named_vector)
pi
letters
LETTERS
month.name
month.abb

names(my_named_vector) <- letters[1:3]
my_named_vector
attributes(my_named_vector)

my_named_vector["a"]
my_named_vector["c"]
my_named_vector[c("c", "a")]

1:10 * 2
c(2 * seq(1, 10))
2 * seq(1, 10)
seq(2, 20, by = 2)
seq(2, 20, length.out = 10)
(1:20)[c(FALSE, TRUE)]
a <- 1:20
a[a %% 2 == 0]
c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)

eyes <- c("green", "blue", "blue", "brown", "green", "blue")
sum(eyes == "blue")
sum(eyes == "blue")/length(eyes == "blue") 
mean(eyes == "blue")

all(eyes == "blue")
all(n > 0)
all(n >= 0)

any(eyes == "blue")
any(eyes != "blue")
all(!eyes == "blue")

which(eyes == "blue")
#seq_along(eyes)[eyes == "blue"]

eyes[eyes == "blue"]
eyes[which(c(eyes == "blue", eyes == "green"))]
eyes[eyes == "blue" | eyes == "green"]

eyes[eyes == c("green", "blue")]
eyes[eyes == c("blue", "green")]

eyes[eyes %in% c("green", "blue")]
respondents_city <- c("Москва", "Москва", "Балашиха", "Санкт-Петербург", "Казань",
                      "Волгоград", "Павлово", "Вологда", "Сочи", "Магадан", "Истра")
big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск")
respondents_city[respondents_city %in% big_cities]
respondents_city %in% big_cities
respondents_city == big_cities
length(respondents_city)
length(big_cities)
