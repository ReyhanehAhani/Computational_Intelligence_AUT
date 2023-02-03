import math

def tanh(x):
    return ((math.exp(x)-math.exp(-x))/(math.exp(x)+math.exp(-x)))


def tanhmatrix(A, n, m):
    s = 0
    for i in range(n):
        for j in range(m):
            s += tanh(A[i][j])
    return s

A = []

n = int(input('enter the n :'))
m = int(input('enter the m :'))

for i in range(n):
    r = []
    for j in range(m):
        a = float(input(f"[{i + 1}][{j + 1}] :"))
        r.append(a)
    A.append(r)

print(tanhmatrix(A, n, m))
