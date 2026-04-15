import numpy as np
import matplotlib.pyplot as plt

L = np.linspace(0.01, 10, 300)
Kd = 1.5
K = 2.0
n = 3

occupancy = L / (Kd + L)
hill_response = L**n / (K**n + L**n)

plt.plot(L, occupancy, label="Occupancy")
plt.plot(L, hill_response, label="Hill response")
plt.xlabel("Ligand concentration")
plt.ylabel("Normalized response")
plt.title("Receptor occupancy and cooperative response")
plt.legend()
plt.show()
