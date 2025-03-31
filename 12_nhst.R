dnorm(0)
dnorm(1)
dnorm(-1)
vec <- seq(-5, 5, by = .01)
vec
dnorm(vec)
plot(vec, dnorm(vec))

dnorm(110, m = 100, sd = 15)
iq <- seq(50, 150, by = .1)
plot(iq, dnorm(iq, m = 100, sd = 15))

pnorm(100, m = 100, sd = 15)
pnorm(130, m = 100, sd = 15)
pnorm(110, m = 100, sd = 15)
options(scipen = 999)
pnorm(0, m = 100, sd = 15)
prob <- seq(0, 1, .01)
plot(prob, qnorm(prob, m = 100, sd = 15))

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp)
hist(rnorm(10000))

samp
mean(samp) 
sqrt(sum((samp - mean(samp)) ^ 2)/(length(samp) - 1))
sd(samp)

#CI95%
set.seed(42)
many_means <- replicate(1000000, mean(rnorm(100, m = 100, sd = 15)))
mean(many_means)
sd(many_means)
sd(samp)/sqrt(length(samp))
hist(many_means)

hist(rlnorm(100000), breaks = 100)
many_log_means <- replicate(1000000, mean(rlnorm(100)))
hist(many_log_means)

se_e <- sd(samp)/sqrt(length(samp))
mean(samp) - qnorm(0.975) * se_e
mean(samp) + qnorm(0.975) * se_e
z_emp <- (mean(samp) - 95)/(15/sqrt(length(samp)))
z_emp
(1 - pnorm(z_emp)) * 2

t_emp <- (mean(samp) - 100)/(sd(samp)/sqrt(length(samp)))
(1 - pt(t_emp, df = length(samp) - 1)) * 2
t.test(samp, mu = 100)
