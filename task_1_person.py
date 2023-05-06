# Задание 1
# Создайте класс Person с приватными атрибутами name, surname, age.
# Реализуйте методы name, surname, age, которые будут давать доступ к аналогичным приватным атрибутам.
# Создайте сеттер, который будет давать возможность поменять атрибут age.
# Решение:

class Person:
    def __init__(self, name, surname, age):
        self.__name = name
        self.__surname = surname
        self.__age = age
  
    @property
    def name(self):
        return self.__name

    @property
    def surname(self):
        return self.__surname

    @property
    def age(self):
        return self.__age

    @age.setter
    def age(self, new_age):
        self.__age = new_age
        return self.__age

if __name__ == '__main__':
    p = Person('Tom', 'Jefferson', 33)
    print(p.name, p.surname, p.age)

    p.age = 45
    print(p.name, p.surname, p.age)


# Output:

# Tom Jefferson 33
# Tom Jefferson 45