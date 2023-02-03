import math

def sigmoid(x):
    return 2/(1+math.exp(-x)) - 1

def sigmoid_d(x):
    return (1-(sigmoid(x)**2))/2 

def sigmatrix(A, n, m):
    s = 0
    for i in range(n):
        for j in range(m):
            s += sigmoid(A[i][j])
    return s


def sigmatrix_d(A, n, m):
    s = 0
    for i in range(n):
        for j in range(m):
            s += sigmoid_d(A[i][j])
    return s

A = []

n = int(input("enter the n :"))
m = int(input("enter the m :"))

for i in range(n):
    r = []
    for j in range(m):
        a = float(input(f"[{i + 1}][{j + 1}]: "))
        r.append(a)
    A.append(r)

print('sigmoid: ', sigmatrix(A, n, m))
print('sigmoid_d: ', sigmatrix_d(A, n, m))

M = [
    [1, 0, math.sin(math.pi/4)],
    [0, 1, math.sin(math.pi/2)],
    [1, 0, 1]
]

print('sigmatrix M: ',sigmatrix(M,3,3))
print('sigmatrix_d M ',sigmatrix_d(M,3,3))