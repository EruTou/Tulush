# Задание 1
# Создайте функцию-генератор countdown, которая выводит числа от 10 до 0.
# а) Опустошите генератор с помощью цикла
# б) Опустошите генератор с помощью next()
# подсказка: можно воспользоваться сочетанием цикла while и функцией next()
# Решение:

def countdown(n):
    for i in range(n, -1, -1):
        yield i


gen = countdown(10)  # эту строку не комментируем при запуске других решений

for i in gen:  # a, first solution
    print(i)

# Output:
# 10
# 9
# 8
# 7
# 6
# 5
# 4
# 3
# 2
# 1
# 0


print(next(gen))  # b, second solution
print(next(gen))
print(next(gen))
print(next(gen))
print(next(gen))
print(next(gen))
print(next(gen))
print(next(gen))
print(next(gen))
print(next(gen))
print(next(gen))

# Output:
# 10
# 9
# 8
# 7
# 6
# 5
# 4
# 3
# 2
# 1
# 0


for i in range(11):  # third solution
    print(next(gen))

# Output:
# 10
# 9
# 8
# 7
# 6
# 5
# 4
# 3
# 2
# 1
# 0


k = 11
while k > 0:  # fourth solution with while
    print(next(gen))
    k -= 1

# Output:
# 10
# 9
# 8
# 7
# 6
# 5
# 4
# 3
# 2
# 1
# 0
