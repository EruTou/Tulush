# Tulush Ertine - 912 group. Lesson 11 - functions.
# ЗАДАНИЯ ДЛЯ ПОВТОРЕНИЯ

'''
Задание 1
Создайте функцию calculator, которая принимает у пользователя два числа и операцию(+, -, /, *),
а возвращает результат. Предусмотрите предупреждение об ошибке при делении на 0.
'''

def calc(a, b, operation):
    if operation == "+" or operation == "sum":
        print((lambda a, b: a+b)(a, b))

    elif operation == "-" or operation == "subtract":
        print((lambda a, b: a-b)(a, b))

    elif operation == "*" or operation == "multiply":
        print((lambda a, b: a*b)(a, b))

    elif operation == "/" or operation == "divide":
        if b == 0:
            print("You can't divide by zero")
        else:
            print((lambda a, b: a/b)(a, b))

for i in range(5):
    a = int(input("Enter the a: "))
    b = int(input("Enter the b: "))
    operation = str(input("Enter the type of operation: "))
    calc(a, b, operation)

# Enter the a: 1
# Enter the b: 2
# Enter the type of operation: +
# 3
# Enter the a: 4
# Enter the b: 5
# Enter the type of operation: -
# -1
# Enter the a: 6
# Enter the b: 5
# Enter the type of operation: *
# 30
# Enter the a: 10
# Enter the b: 2
# Enter the type of operation: /
# 5.0
# Enter the a: 5
# Enter the b: 0
# Enter the type of operation: /
# You can't divide by zero

'''
Задание 2
Создайте функцию reverse, которая принимает неограниченное число слов, а возвращает слово с развернутыми буквами. 
Например:
    reverse('Привет')
    "тевирП"
Пользоваться срезами в данном задании запрещено
'''

def reverse(text):
    res = ''.join(reversed(text))
    return res

my_str = reverse(input())
print(my_str)

# my sotsawe meis
# siem ewastos ym

'''
Задание 3
Создайте функцию hello, которая запрашивает имя у пользователя. Если такое мя есть в списке - выдает : "Привет, <имя>!",
если нет - то добавляет его в список и выдает : "Привет, <имя>! Рад знакомству!". Протестируйте ее на нескольких примерах
'''

def hello(name):
    if name in lst:
        return f"Hello, {name}!"
    else:
        lst.append(name)
        return f"Hello, {name}! Nice to meet you!"

lst = ['Andrew', 'Matthew', 'James']
for i in range(4):
    name = input("What's your name? \n")
    print(hello(name))

# What's your name?
# Ann
# Hello, Ann! Nice to meet you!
# What's your name?
# Mike
# Hello, Mike! Nice to meet you!
# What's your name?
# Ann
# Hello, Ann!
# What's your name?
# Mike
# Hello, Mike!

'''
Задание 4
Создайте функцию count, которая выводит числа от 0 до 10. Решите эту задачу с помощью: а) цикла while б) с помощью рекурсии
'''

def count(a):
    while a < 11:
        print(a)
        a += 1

count(0)

# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

def count(a):
    print(a)
    if a == 10:
        return
    count(a+1)

count(0)

# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

'''
Задание 4*
Создайте функцию count, которая выводит количество четных и нечетных чисел от 0 до 10. Решите эту задачу с помощью: а) цикла while б) с помощью рекурсии
'''

def count(a):
    ev, od = 0, 0
    while a < 11:
        if a % 2 == 0:
            ev += 1
        else:
            od += 1
        a += 1
    print(f"Amount of even numbers: {ev}")
    print(f"Amount of odd numbers: {od}")

count(0)

# Amount of even numbers: 6
# Amount of odd numbers: 5

ev, od = 0, 0
def count(a, ev, od):
    if a == 11:
        print(f"Amount of even numbers: {ev}, \n amount of odd numbers: {od}")
        return
    if a % 2 == 0:
        ev += 1
    else:
        od += 1
    count(a+1, ev, od)

count(0, ev, od)

# Amount of even numbers: 6,
#  amount of odd numbers: 5

'''
Задание 5*
Создайте функцию Fibonacci, которая генерирует список чисел Фибоначчи меньше 100.
а) решите эту задачу с помощью цикла while
б) решите эту задачу с помощью рекурсии
Ряд Фибоначчи:
первые два числа 0 и 1, а потом каждое последующее число = сумма двух предыдущих.
например:
0 1 1 2 3 5 8 13 21 и т.д.
0 + 1 = 1
1 + 2 = 3
3 + 5 = 8
5 + 8 = 13
'''

# this is the wrong answer. i will change this code

def fib(n):  # 6
    if n == 0:  # first elem = 0, we count starting from zero
        return 0
    if n == 1 or n == 2:  # second and third elem = 1
        return 1
    else:
        return fib(n - 1) + fib(n - 2)


print(fib(int(input())))
