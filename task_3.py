# Задание 3
# Создайте класс Car, реализуйте в нем 5 атрибутов :
# цвет,
# марку,
# кузов (сидан sedan, грузовик truck),
# скорость,
# тип коробки передач;
# и 6 методов:
# start - заставляет начинать движение
# stop - останавливает машину
# turn - поворачивает машину в какую-либо сторону, и выводит сообщение:" Машина повернула налево"
# speed_up - ускоряет автомобиль
# speed_down - замедляет автомобиль
# beep - сигналит
# Создайте два экземпляра класса truck и car. Продемонстрируйте работу всех методов
# Решение:

class Car:
    def __init__(self, brand, body, transmission, speed=0, color='grey'):
        self.brand = brand
        self.body = body
        self.transmission = transmission
        self.color = color
        self.speed = speed

    def start(self):
        self.speed = 10
        print(f'{self.brand} speed = {self.speed} km/h')

    def stop(self):
        self.speed = 0
        print(f'{self.brand} speed = {self.speed} km/h')

    def turn(self, direction):
        print(f'{self.brand} turned {direction}')

    def speed_up(self, value=1):
        self.speed += value
        print(f'{self.brand} speed = {self.speed} km/h')

    def speed_down(self, value=1):
        if self.speed == 0:
            print(f'{self.brand} speed = 0 km/h')
        else:
            self.speed -= value
            print(f'{self.brand} speed = {self.speed} km/h')

    def beep(self):
        print(f'{self.brand} honks')


truck = Car('Volvo', 'tractor', 'manual', 40, 'green')
car = Car('Audi', 'coupe', 'auto', 80, 'aqua')

truck.start()
truck.speed_up(90)
truck.beep()
truck.speed_down(80)
truck.turn('left')
truck.stop()

car.start()
car.speed_up(313)
car.beep()
car.speed_down(280)
car.turn('right')
car.stop()

# Output:

# Volvo speed = 10 km/h
# Volvo speed = 100 km/h
# Volvo honks
# Volvo speed = 20 km/h
# Volvo turned left
# Volvo speed = 0 km/h

# Audi speed = 10 km/h
# Audi speed = 323 km/h
# Audi honks
# Audi speed = 43 km/h
# Audi turned right
# Audi speed = 0 km/h
