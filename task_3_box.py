# Задание 3
# Создайте класс Box (посылка), у которого будет приватные атрибуты:
#   postcode (номер отправления),
#   name (имя отправителя),
#   from_city (город отправителя),
#   target_city (город назначения).
#   Реализуйте методы, которые будут давать возможность доступа к приватным атрибутам.
#   Реализуйте метод, который будет давать возможность менять город назнанчения
#   Назовите модуль task_3_box и сохраните его
# Решение:

class Box():
    def __init__(self, postcode, name, from_city, target_city):
        self.__postcode = postcode
        self.__name = name
        self.__from_city = from_city
        self.__target_city = target_city

    @property
    def postcode(self):
        return self.__postcode

    @property
    def name(self):
        return self.__name

    @property
    def from_city(self):
        return self.__from_city

    @property
    def target_city(self):
        return self.__target_city

    @target_city.setter
    def target_city(self, new_target_city):
        self.__target_city = new_target_city
        return self.__target_city

if __name__ == '__main__':
    b = Box(420095, 'Fruits', 'Rio', 'Kazan')
    print(b.postcode, b.name, b.from_city, b.target_city)

    b.target_city = 'Moscow'
    print(b.postcode, b.name, b.from_city, b.target_city)


# Output:

# 420095 Fruits Rio Kazan
# 420095 Fruits Rio Moscow