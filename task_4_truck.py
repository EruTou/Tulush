# Задание 4
# Реализуйте класс Truck (грузовик). Грузовик может перевозить посылки - Box из предыдущего задания
#   Импортиуйте модуль task_3_box из предыдущего задания.
#   Создайте несколько экземпляров класса Box.
#   Проверьте работу методов класса Box
#   Создайте класс Truck (грузовик), который будет иметь несколько атрибутов, присущих грузовику.
#   Реализуйте атрибут capacity (емкость), в котором будет реализовано хранилище посылок (Box): [box1, box2 ...]
#   Переопределите методы __str__, __add__, __sub__ для реализации отображения грузовика, загрузки и выгрузки посылок.
#   Продемонстрируйте работу класса Truck.
# Решение:

from task_3_box import Box

class Truck():
    def __init__(self, brand, body, transmission, color):
        self.brand = brand
        self.body = body
        self.transmission = transmission
        self.color = color
        self.capacity = []
    
    def __str__(self):
        return f'Brand: {self.brand}\nBody: {self.body}\nTransmission: {self.transmission}\nColor: {self.color}\nCapacity: {self.capacity}'
    
    def __add__(self, box):
        self.capacity.append(box.name)
        print(f'The {box.name} was loaded onto a truck')
    
    def __sub__(self, box):
        self.capacity.pop()
        print(f'The {box.name} was unloaded from the truck')


if __name__ == '__main__':
    b1 = Box(420095, 'Fruit', 'Rio', 'Kazan')
    print(b1.postcode, b1.name, b1.from_city, b1.target_city)

    b2 = Box(101000, 'Vegetables', 'Hong-Kong', 'Moscow')
    print(b2.postcode, b2.name, b2.from_city, b2.target_city)
    
    t1 = Truck('Volvo', '18-Wheeler', 'Automatic', 'Grey')
    t1.__add__(b1)
    t1.__add__(b2)
    t1.__add__(b1)
    t1.__add__(b1)
    t1.__sub__(b1)
    print(t1)
    
    t2 = Truck('Freightliner', 'Semi-Trailer', 'Manual', 'Red')
    t2.__add__(b2)
    t2.__sub__(b2)
    t2.__add__(b2)
    t2.__add__(b1)
    print(t2)


# Output:

# 420095 Fruit Rio Kazan
# 101000 Vegetables Hong-Kong Moscow

#--------------------------------------------------

# The Fruit was loaded onto a truck
# The Vegetables was loaded onto a truck
# The Fruit was loaded onto a truck
# The Fruit was loaded onto a truck
# The Fruit was unloaded from the truck

# Brand: Volvo
# Body: 18-Wheeler
# Transmission: Automatic
# Color: Grey
# Capacity: ['Fruit', 'Vegetables', 'Fruit']

#--------------------------------------------------

# The Vegetables was loaded onto a truck
# The Vegetables was unloaded from the truck
# The Vegetables was loaded onto a truck
# The Fruit was loaded onto a truck

# Brand: Freightliner
# Body: Semi-Trailer
# Transmission: Manual
# Color: Red
# Capacity: ['Vegetables', 'Fruit']