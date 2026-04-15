import numpy as np
import matplotlib.pyplot as plt

times = np.arange(0, 20.1, 0.1)
S = np.zeros_like(times)
F = np.zeros_like(times)

alpha = 3.0
beta = 0.6
gamma = 0.15
delta = 0.4
epsilon = 0.3

input_signal = np.where((times >= 2) & (times <= 8), 1.0, 0.0)

for i in range(1, len(times)):
    dt = times[i] - times[i - 1]

    dS = alpha * input_signal[i - 1] - beta * S[i - 1] - gamma * F[i - 1] * S[i - 1]
    dF = delta * S[i - 1] - epsilon * F[i - 1]

    S[i] = max(S[i - 1] + dS * dt, 0)
    F[i] = max(F[i - 1] + dF * dt, 0)

plt.plot(times, S, label="Signal")
plt.plot(times, F, label="Feedback inhibitor")
plt.xlabel("Time")
plt.ylabel("Activity")
plt.title("Pulse-driven signaling with negative feedback")
plt.legend()
plt.show()
