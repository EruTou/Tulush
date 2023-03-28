# Задание 5
# Создайте функцию countdown, которая принимает список рандомных чисел от 0 до 10, а возвращает каждый
# элемент этого списка в порядке обратного отсчета, а после 0 - слово " Пуск!".
# Например:
#     countdown(s)
#     3 2 1 0 Пуск!
# Можете создать список сами или воспользоваться S=[0,7, 5, 9, 3, 8, 6, 2, 1].
# Для тех, кому интересно:
# для создания рандомного числа, можно воспользоваться функцией sample из модуля random
# from random import sample
# print(sample(range(0, 10), 10))
# [4, 7, 2, 5, 9, 1, 6, 8, 3, 0]

from random import sample


def countdown(lst):
    rlst = list(sorted(lst, reverse=True))
    slst = [str(i) for i in rlst]
    slst.append("Пуск!")
    nlst = " ".join(slst)
    return nlst


rand_lst = sample(range(0, 10), 10)
print(f'Было {rand_lst}')
print(f'Стало {countdown(rand_lst)}')


# Было [5, 3, 6, 4, 0, 8, 1, 7, 2, 9]
# Стало 9 8 7 6 5 4 3 2 1 0 Пуск!
