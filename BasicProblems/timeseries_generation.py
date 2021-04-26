# Python seems much faster for this task...
import numpy as np
from random import gauss
import matplotlib.pyplot as plt


T = 200
alphas = [0, 0.5, 0.9]


if __name__ == '__main__':
    fig = plt.figure()

    for alpha in alphas: 
        X = np.zeros(T)
        for i in range(T-1):
            X[i+1] = alpha * X[i] + gauss(0, 1)
        plt.plot(X, linewidth=1.2)

    plt.legend(['α = ' + str(alpha) for alpha in alphas])
    plt.savefig('output')
