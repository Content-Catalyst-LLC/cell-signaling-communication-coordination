ligand <- seq(0.01, 10, length.out = 200)
Kd <- 1.5
K <- 2
n <- 3

occupancy <- ligand / (Kd + ligand)
hill_response <- ligand^n / (K^n + ligand^n)

par(mfrow = c(1, 2))

plot(ligand, occupancy, type = "l", lwd = 2,
     xlab = "Ligand concentration",
     ylab = "Fraction occupied",
     main = "Receptor occupancy")

plot(ligand, hill_response, type = "l", lwd = 2,
     xlab = "Ligand concentration",
     ylab = "Normalized response",
     main = "Hill-type signaling response")
