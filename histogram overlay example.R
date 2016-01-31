data(mtcars)
myhist <- hist(mtcars$mpg)
multiplier <- myhist$counts / myhist$density
mydensity <- density(mtcars$mpg)
mydensity$y <- mydensity$y * multiplier[1]

plot(myhist)
lines(mydensity)

myx <- seq(min(mtcars$mpg), max(mtcars$mpg), length.out= 100)
mymean <- mean(mtcars$mpg)
mysd <- sd(mtcars$mpg)

normal <- dnorm(x = myx, mean = mymean, sd = mysd)
lines(myx, normal * multiplier[1], col = "blue", lwd = 2)

sd_x <- seq(mymean - 3 * mysd, mymean + 3 * mysd, by = mysd)
sd_y <- dnorm(x = sd_x, mean = mymean, sd = mysd) * multiplier[1]

segments(x0 = sd_x, y0= 0, x1 = sd_x, y1 = sd_y, col = "firebrick4", lwd = 2)