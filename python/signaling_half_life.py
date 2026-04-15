import numpy as np

time_min = np.array([0, 1, 2, 3, 4], dtype=float)
signal = np.array([100, 70, 50, 35, 25], dtype=float)

coef = np.polyfit(time_min, np.log(signal), 1)
slope, intercept = coef[0], coef[1]

k_est = -slope
m0_est = np.exp(intercept)
half_life = np.log(2) / k_est

print("Estimated decay constant k:", round(k_est, 4))
print("Estimated initial signal m0:", round(m0_est, 2))
print("Estimated half-life:", round(half_life, 2), "minutes")
