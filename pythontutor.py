# Tulush Ertine - 912 group. Lesson 11 - functions.
# Задания с pythontutor

'''
Задача 1 - «Длина отрезка»
Условие:
Даны четыре действительных числа: x1, y1, x2, y2. Напишите функцию distance(x1, y1, x2, y2), вычисляющая расстояние между точкой (x1,y1) и (x2,y2). Считайте четыре действительных числа и выведите результат работы этой функции.
Если вы не знаете, как решить эту задачу, то вы, возможно, не изучали в школе теорему Пифагора. Попробуйте прочитать о ней на Википедии.
'''

from math import pow
from math import sqrt


def distance(x1, y1, x2, y2):
    return sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)


x1 = float(input())  # 0
y1 = float(input())  # 0
x2 = float(input())  # 1
y2 = float(input())  # 1

print(distance(x1, y1, x2, y2))  # 1.4142135623730951

'''
Задача 2 - «Отрицательная степень»
Условие:
Дано действительное положительное число a и целоe число n.
Вычислите a^n. Решение оформите в виде функции power(a, n).
Стандартной функцией возведения в степень пользоваться нельзя.
'''


def power(a, n):
    return pow(a, n)


a = float(input())  # 2
n = int(input())  # -3

print(power(a, n))  # 0.125

'''
Задача 3 - «Большие буквы»
Условие:
Напишите функцию capitalize(), которая принимает слово из маленьких латинских букв и возвращает его же, меняя первую букву на большую.
Например, print(capitalize('word')) должно печатать слово Word.
На вход подаётся строка, состоящая из слов, разделённых одним пробелом. Слова состоят из маленьких латинских букв.
Напечатайте исходную строку, сделав так, чтобы каждое слово начиналось с большой буквы. При этом используйте вашу функцию capitalize().
'''


def capitalize(word):
    return word.title()


words = list()
for word in input().split():  # not a hero unless you die
    words.append(capitalize(word))
print(' '.join(words))  # Not A Hero Unless You Die


'''
Задача 4 - «Возведение в степень»
Условие:
Дано действительное положительное число a и целое неотрицательное число n. Вычислите an не используя циклы,
возведение в степень через ** и функцию math.pow(), а используя рекуррентное соотношение an=a*a^n-1.
Решение оформите в виде функции power(a, n).
'''


def power(a, n):
    if n == 0:
        return 1
    else:
        return a * power(a, n - 1)


a = float(input())  # 2
n = int(input())  # 4

print(power(a, n))  # 16.0

'''
Задача 5 - «Разворот последовательности»
Условие:
Дана последовательность целых чисел, заканчивающаяся числом 0. Выведите эту последовательность в обратном порядке.
При решении этой задачи нельзя пользоваться массивами и прочими динамическими структурами данных. Рекурсия вам поможет.
'''


def reverse():
    num = int(input())  # 1230
    if num != 0:
        # это как матрешка, мы ее раскрываем. Вызывается до тех пор, пока не получим 0.
        reverse()
    print(num)  # выводим 0, после чего матрешку собираем в обратном порядке.


reverse()  # 0321

'''
Задача 6 - Задача «Числа Фибоначчи»
Условие:
Напишите функцию fib(n), которая по данному целому неотрицательному n возвращает n-e число Фибоначчи.
В этой задаче нельзя использовать циклы — используйте рекурсию.
'''


def fib(n):  # 6
    if n == 1 or n == 2:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)


print(fib(int(input())))  # 8
