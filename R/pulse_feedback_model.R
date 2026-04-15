times <- seq(0, 20, by = 0.1)
S <- numeric(length(times))
F <- numeric(length(times))

alpha <- 3.0
beta <- 0.6
gamma <- 0.15
delta <- 0.4
epsilon <- 0.3

input_signal <- ifelse(times >= 2 & times <= 8, 1, 0)

for (i in 2:length(times)) {
  dt <- times[i] - times[i - 1]

  dS <- alpha * input_signal[i - 1] - beta * S[i - 1] - gamma * F[i - 1] * S[i - 1]
  dF <- delta * S[i - 1] - epsilon * F[i - 1]

  S[i] <- max(S[i - 1] + dS * dt, 0)
  F[i] <- max(F[i - 1] + dF * dt, 0)
}

plot(times, S, type = "l", lwd = 2,
     xlab = "Time",
     ylab = "Activity",
     main = "Pulse-driven signaling with negative feedback")
lines(times, F, lwd = 2, lty = 2)
legend("topright",
       legend = c("Signal", "Feedback inhibitor"),
       lty = c(1, 2), lwd = 2, bty = "n")
