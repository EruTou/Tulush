# Задание 3
# a) Создайте класс Matrix который должен принимать данные (список списков) для формирования матрицы.
# b) Следующий шаг реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
# c) Далее реализовать перегрузку метода __add__() для сложения двух объектов класса Matrix (двух матриц).
#     Результатом сложения должна быть новая матрица.
# Решение:

class Matrix():
    def __init__(self, big_list):
        self.matr = big_list

    def __str__(self):
        out_matr = ''
        for i in range(len(self.matr)):
            for j in range(len(self.matr[i])):
                out_matr += f'{self.matr[i][j]} '
            out_matr += '\n'
        return f'{out_matr}'

    def __add__(self, new_matr):
        res_matr = []
        for i in range(len(self.matr)):
            total_summ = []
            for j in range(len(self.matr[i])):
                summ = self.matr[i][j] + new_matr.matr[i][j]
                total_summ.append(summ)
            res_matr.append(total_summ)
        return Matrix(res_matr)


m1 = Matrix([[1,2,3],[4,5,6]])
print(m1)
m2 = Matrix([[6,5,4],[3,2,1]])
print(m2)
m3 = m1 + m2
print(m3)

# Output:

# 1 2 3
# 4 5 6

# 6 5 4
# 3 2 1

# 7 7 7
# 7 7 7