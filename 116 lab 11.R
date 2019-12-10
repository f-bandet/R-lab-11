# Name: Faye Bandet
# Date: 10/7/19
# ISTA 116 Section B || Section Leader : Jacob Heller
# Lab Assignment 11
# Collaborator(s): Nick Ackerman

download.file("http://www.openintro.org/stat/data/nc.RData", destfile = "nc.RData")
load("nc.RData")

nc <- na.omit(nc)

#1
mean(nc$weeks)
# The null hypothesis is that North Carolina has an average pregnancy rate that lasts about 40 weeks.The alternative hypothesis is that North Carolina doesn't have an average pregnancy rate that lasts about 40 weeks. The mean for NC was 38.47 weeks, which is relitively close to 40.

#2
hist(nc$weeks)
# This histogram appears pretty left skewed, so it does not have a normal distribution. The lowest pregnency was 20 weeks and most were just shy of 40, as well as a few after 40 weeks. We could perform a hypothesis test because data does not need to have normality.

#3
mean(nc$weeks)
se <- sd(nc$weeks)/sqrt(length(nc$weeks))
se
# The standard error was 0.09736 and the mean is 38.4675.

#4
cv <- qnorm((1-(1-.99)/2)*se)
cv
# The qnorm is -1.299567, as the critical value for a 99% confidance interval.

#5
lower <- mean(nc$weeks)-cv
upper <- mean(nc$weeks)+cv
lower
upper
mean(nc$weeks)
# The lower value is 39.76707 and the upper value is 37.16793. This means that our mean of 38.4675 is within the confidance interval. This is expected since the interval is 99% for the null hypothesis.

#6
zscore = (mean(nc$weeks)-40)/se
zscore
# The zscore is -15.74029 for a null hypothesis of 40.

#7
pnorm(zscore)*2
# The value I got was 8.007101e-56. Because the zscore is strongly negative and there is a probability that it is higher than the confidance interval, we can reject the null hypothesis because the alternative hypothesis is more likely. In this cace a pregnancy is more likely to be 38 or 39 weeks than 40.

#8
rjvalue <- qnorm(0.05, 40, se)
rjvalue
# The rejected value I got was 39.83985.

#9
pnorm(rjvalue, 39+6/7, se)
# 0.4295307 is the probability of observing a sample mean below the cutoff I just calculated if sample means come from a distribution centered around 39 weeks and 6 days.I would not  be satisfied because it has a low power level

#10
powerlevel <- pnorm(rjvalue, 39, se)
# I'd be satisfied at this level of power of 1 because it is a high power.

