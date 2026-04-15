time_min <- c(0, 1, 2, 3, 4)
signal <- c(100, 70, 50, 35, 25)

fit <- lm(log(signal) ~ time_min)

k_est <- -coef(fit)[["time_min"]]
m0_est <- exp(coef(fit)[["(Intercept)"]])
half_life <- log(2) / k_est

cat("Estimated decay constant k:", round(k_est, 4), "\n")
cat("Estimated initial signal m0:", round(m0_est, 2), "\n")
cat("Estimated half-life:", round(half_life, 2), "minutes\n")

pred <- exp(predict(fit))

plot(time_min, signal,
     pch = 19,
     xlab = "Time (minutes)",
     ylab = "Signal amplitude",
     main = "Observed and fitted signaling decay")
lines(time_min, pred, lwd = 2)
