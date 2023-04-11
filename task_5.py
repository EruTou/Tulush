# Задание 5
# Создайте класс светофор (trafficlight). Реализуйте в нем метод, который будет переключать
# цвета (red, green, yellow) по определенному времени: red = 1 сек, green 2 сек, yellow = 0.5 сек.
# Подсказка:
# Воспользуйтесь модулем time. В нем есть функция sleep
# Решение:

from time import sleep


class trafficLight:
    def __init__(self, color):
        self.color = color

    def changeColor(self):
        for col, t in self.color.items():
            sleep(t)
            print(col)


traffic = trafficLight(color={
    "Red": 1,
    "Yellow": 2,
    "Green": 0.5
})
traffic.changeColor()

# Output:

# Red
# Yellow
# Green
