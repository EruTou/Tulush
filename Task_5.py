# Задача «Минимум из трех чисел»
# Условие:
# Даны три целых числа. Выведите значение наименьшего из них.

a = int(input())
b = int(input())
c = int(input())
if b >= a <= c:
    print(a)
elif a >= b <= c:
    print(b)
else:
    print(c)
