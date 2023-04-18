# Задание 6* (необязательное)
# Давайте создадим свой класс Time по аналогии с Date_time выше. Реализуйте в нем классовый метод from_string(),
# который будет принимать в себя строку('00:00:00') и будет преобразовывать его в объект Time.
# Решение:

class Time():
    def __init__(self, seconds, minutes, hours):
        self.seconds = seconds
        self.minutes = minutes
        self.hours = hours

    def __str__(self):
        return f'{self.seconds}:{self.minutes}:{self.hours}'

    @classmethod
    def from_string(cls, time_string):
        seconds, minutes, hours = map(int, time_string.split(':'))
        return cls(seconds, minutes, hours)


mt = Time.from_string('23:34:55')
print(mt)

# Output:

# 23:34:55
