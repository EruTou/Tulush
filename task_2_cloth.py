# Задание 2
# Реализовать проект расчета суммарного расхода ткани на производство одежды. Основная сущность (класс) этого проекта - одежда (Cloth)
# которая может иметь определенное название. К типам одежды в этом проекте относятся пальто и костюм. У этих типов одежды существуют 
# параметры: размер (для пальто Coat) и рост (для костюма Suit). Это могут быть обычные числа V и H соответственно.
# Для определения расхода ткани по каждому типу одежды использовать формулы:
#     для пальто V/6.5+0.5
#     для костюма 2H+0.3 Проверить работу этих методов на реальных данных.
# Выполнить общий подсчет расхода ткани, который пойдет на пошив всех костюмов и всех пальто соответственно.
# Реализовать абстрактыне классы для основных классов проекта и проверить работу декоратора @property.
# Подсказка:
#     Воспользуйтесь абстрактным классом при создании класса Cloth
#     Определите абстрактные методы подсчета количества ткани
#     Количество ткани reserved сделайте атрибутом класса ( определяется вне конструктора)
# Решение:

from abc import ABC, abstractmethod

class Cloth(ABC):
    def __init__(self, name):
        self.__name = name

    @property
    def name(self):
        return self.__name

    @abstractmethod
    def fabric_consumption(self):
        return

class Coat(Cloth):
    def __init__(self, name, V):
        super().__init__(name)
        self.__V = V

    reserved = 0 # Считает количество ткани для пальто
    def fabric_consumption(self):
        self.reserved = self.__V / 6.5 + 0.5

class Suit(Cloth):
    def __init__(self, name, H):
        super().__init__(name)
        self.__H = H

    reserved = 0 # Считает количество ткани для костюмов
    def fabric_consumption(self):
        self.reserved = 2 * self.__H + 0.3


if __name__ == '__main__':
    clothes = [Coat('RELIGION', 58),
        Coat('Burberry', 52),
        Suit('Gieves & Hawkes', 192),
        Suit('Henry Poole & Co', 167)
    ]

    summfc = 0
    for cloth in clothes:
        cloth.fabric_consumption()
        summfc += cloth.reserved
    print(f'Fabric consumption: {summfc}')


# Output:

# Fabric consumption: 736.5230769230769