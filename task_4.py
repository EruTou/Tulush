# Задание 4
# Реализуйте класс Deque - двух стороннюю очередь или колоду. Идея та же, что и у очереди, только можно вставлять элементы в центр массива убирать как слева так и справа.
# Переопределите метод __str__
# Реализуйте методы, который позволят вставлять элементы слева, справа, в в центр массива и аналогично удалять. 
# Решение:

class Deque():
    def __init__(self, *name):
        self.inside = [*name]

    def __str__(self):
        return f'{"=>".join(self.inside)}'

    def check(self):
        if len(self.inside) <= 0 or len(self.inside) > 10:
            print('Deque is empty or overfilled!')
        return

    def add_last(self, name):
        self.check()
        self.inside.append(name)

    def add_first(self, name):
        self.check()
        self.inside.insert(0,name)

    def add_center(self, name):
        self.check()
        cind = len(self.inside) // 2
        self.inside.insert(cind, name)

    def take_out_last(self):
        self.check()
        self.inside.pop()

    def take_out_first(self):
        self.check()
        self.inside.pop(0)

    def take_out_center(self):
        self.check()
        cind = len(self.inside) // 2
        self.inside.pop(cind)

    def __add__(self, name):
        self.check()
        self.inside.append(name)

    def __sub__(self, name):
        self.check()
        self.inside.pop(0)

    def __iadd__(self, name):
        self.check()
        self.inside.append(name)
        return self

    def __isub__(self, name):
        self.check()
        self.inside.pop(0)
        return self


print('Filling the deque\n')
dq = Deque('Kwon-Soo', 'Kwe-Rak', 'Gwan-An')
print(dq)
dq.add_first('Ji-Soo')
print(dq)
dq.add_center('Hyun-Sook')
print(dq)
dq + 'Seo-Chon'
print(dq)
dq.add_last('Mi-Soo')
print(dq)
dq += 'Suk-Gyu'
print(dq, end='\n\n')

print('Clearing the deque\n')

dq.take_out_first()
print(dq)
dq.take_out_last()
print(dq)
dq.take_out_center()
print(dq)
dq - ''
print(dq)
dq -= ''
print(dq)
dq -= ''
print('\nThe deque is over')

# Output:

# Filling the deque

# Kwon-Soo=>Kwe-Rak=>Gwan-An
# Ji-Soo=>Kwon-Soo=>Kwe-Rak=>Gwan-An
# Ji-Soo=>Kwon-Soo=>Hyun-Sook=>Kwe-Rak=>Gwan-An
# Ji-Soo=>Kwon-Soo=>Hyun-Sook=>Kwe-Rak=>Gwan-An=>Seo-Chon
# Ji-Soo=>Kwon-Soo=>Hyun-Sook=>Kwe-Rak=>Gwan-An=>Seo-Chon=>Mi-Soo
# Ji-Soo=>Kwon-Soo=>Hyun-Sook=>Kwe-Rak=>Gwan-An=>Seo-Chon=>Mi-Soo=>Suk-Gyu

# Clearing the deque

# Kwon-Soo=>Hyun-Sook=>Kwe-Rak=>Gwan-An=>Seo-Chon=>Mi-Soo=>Suk-Gyu
# Kwon-Soo=>Hyun-Sook=>Kwe-Rak=>Gwan-An=>Seo-Chon=>Mi-Soo
# Kwon-Soo=>Hyun-Sook=>Kwe-Rak=>Seo-Chon=>Mi-Soo
# Hyun-Sook=>Kwe-Rak=>Seo-Chon=>Mi-Soo
# Kwe-Rak=>Seo-Chon=>Mi-Soo

# The deque is over