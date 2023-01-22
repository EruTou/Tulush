# Задача «Минимум из двух чисел»
# Условие:
# Даны два целых числа. Выведите значение наименьшего из них.

a = int(input())
b = int(input())
if a > b:
    print(b)
elif a < b:
    print(a)
else:
    print(b)
