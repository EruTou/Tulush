# Задание 3
# (А)
#     Реализовать класс Stationery (канцелярия):
#     определить в нём атрибут title (название) и абстрактный метод draw (отрисовка);
#     создать три дочерних класса: Pen (ручка), Pencil (карандаш), Handle (маркер);
#     в классе Pen добавьте атрибут color = 'blue';
#     в каждом классе реализовать переопределение метода draw. Для каждого класса метод должен выводить уникальное сообщение, например: "Ручка пишет";
#     создать экземпляры классов и проверить, что выведет описанный метод для каждого экземпляра.

# (Б)
#     Добавьте в класс Stationery метод класса set_color, который присваивает атрибут color класса Stationery;
#     Вызовите метод set_color и установите color='yellow';
#     Вызовите атрибуты color у классов Pen, Pencil, Handle. Что вы наблюдаете?
# Решение:

from abc import ABC, abstractmethod


class Stationery(ABC):
    def __init__(self, title):
        self.title = title

    @classmethod
    def set_color(cls, color):
        cls.color = color

    @abstractmethod
    def draw(self):
        pass


class Pen(Stationery):
    def __init__(self, title):
        super().__init__(title)
        self.color = 'blue'

    def draw(self):
        print('Ручка пишет')


class Pencil(Stationery):
    def __init__(self, title):
        super().__init__(title)

    def draw(self):
        print('Карандаш наточен')


class Handle(Stationery):
    def __init__(self, title):
        super().__init__(title)

    def draw(self):
        print('Маркер засох')


# Объекты теперь имеют желтый цвет, исключая Pen с color = 'blue'
Stationery.set_color('yellow')
pen = Pen('Montblanc')
print(pen.title)
print(pen.color)
print()
pencil = Pencil('Cartier')
print(pencil.title)
print(pencil.color)
print()
handle = Handle('Pelikan')
print(handle.title)
print(handle.color)

# Output:

# Montblanc
# blue

# Cartier
# yellow

# Pelikan
# yellow
