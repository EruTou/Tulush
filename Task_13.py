# Задача «Яша плавает в бассейне»
# Условие:
# Яша плавал в бассейне размером N × M метров и устал. В этот момент
# он обнаружил, что находится на расстоянии x метров от одного из длинных
# бортиков (не обязательно от ближайшего) и y метров от одного из коротких
# бортиков. Какое минимальное расстояние должен проплыть Яша, чтобы выбраться
# из бассейна на бортик? Программа получает на вход числа N, M, x, y.
# Программа должна вывести число метров, которое нужно проплыть Яше до бортика.


N = int(input())
M = int(input())
x = int(input())
y = int(input())
if N > M:
    N, M = M, N
if x >= N / 2:
    x = N - x
if y >= M / 2:
    y = M - y
if x < y:
    print(x)
else:
    print(y)
