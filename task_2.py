# Задание 2
# Напишите функцию-генератор, которая выдает буквы английского алфавита от a до z. Опустошите генератор любым способом
# Решение:

def generator():
    for i in range(97, 123):
        yield chr(i)


gen = generator()
for i in gen:
    print(i)

# Output:
# a
# b
# c
# d
# e
# f
# g
# h
# i
# j
# k
# l
# m
# n
# o
# p
# q
# r
# s
# t
# u
# v
# w
# x
# y
# z
