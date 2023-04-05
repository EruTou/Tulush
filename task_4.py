# Задание 4
# Напишите функцию итератор, которая будет перебирать список чисел Фибоначчи из предыдущего задания.
# Опустошите итератор двумя способами.
# Если вы не сделали предыдущее задание, воспользуйтесь списком: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# Решение:

def fibGen(n):  # copied from the 3rd task
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b


fibList = list(fibGen(10))  # fibonacci list
iterator = iter(fibList)  # creating an iterative function

print(next(iterator))  # first solution
print(next(iterator))
print(next(iterator))
print(next(iterator))
print(next(iterator))
print(next(iterator))
print(next(iterator))
print(next(iterator))
print(next(iterator))
print(next(iterator))

# Output:
# 0
# 1
# 1
# 2
# 3
# 5
# 8
# 13
# 21
# 34


for num in iterator:  # second solution
    print(num)

# Output:
# 0
# 1
# 1
# 2
# 3
# 5
# 8
# 13
# 21
# 34
