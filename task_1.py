# Задание 1
# Создайте родительский класс Animal, у которого есть 3 атрибута:
#   color - цвет
#   name - кличка
#   age - возраст
# и абстрактный метод:
#   say - издать звук.
# Создайте два класса потомка - Cat и Dog, в которых будет переопределен метод say: для класса Cat - Meow!, для Dog - Woof!
# Решение:

from abc import ABC, abstractmethod


class Animal(ABC):
    def __init__(self, name, age, color):
        self.name = name
        self.age = age
        self.color = color

    @abstractmethod
    def say(self):
        pass


class Cat(Animal):
    def say(self):
        print('Meow!')


class Dog(Animal):
    def say(self):
        print('Woof!')


Momo = Cat('Momo', 2, 'White')
print(Momo.name)
print(Momo.age)
print(Momo.color)
Momo.say()
print()
Diego = Dog('Diego', 4, 'Brown')
print(Diego.name)
print(Diego.age)
print(Diego.color)
Diego.say()

# Output:

# Momo
# 2
# White
# Meow!

# Diego
# 4
# Brown
# Woof!
