# Задача «Шахматная доска»
# Условие:
# Заданы две клетки шахматной доски. Если они покрашены в один цвет, то выведите слово YES,
# а если в разные цвета — то NO. Программа получает на вход четыре числа от 1 до 8 каждое,
# задающие номер столбца и номер строки сначала для первой клетки, потом для второй клетки.

x1 = int(input())
y1 = int(input())
x2 = int(input())
y2 = int(input())
if(x1 + y1) % 2 == (x2 + y2) % 2:
    print('YES')
else:
    print('NO')
