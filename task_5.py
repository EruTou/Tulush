# Задание 5
# Создайте класс Clock со статичным методом Say_time, который будет выводить на экран текущее время.
# Подсказка: для этого можете воспользоваться стандартной библиотекой time.
# Решение:

import time


class Clock():
    @staticmethod
    def Say_time():
        print(time.strftime("Сейчас %H:%M:%S", time.localtime()))


Clock.Say_time()

# Output:

# Сейчас 21:18:02
