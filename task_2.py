# Задание 2
# - Реализовать класс Queue
# - Определить атрибут inside, который будет хранить в себе имена людей в очереди.
# - Переопределить метод __str__, чтобы преобразовать его к виду: Name1=>Name2=>...=>Name3
# - Реализовать методы:
#       - add - который добавляет имя в очередь
#       - take_out убирает первого человека из списка
# - Переопределить методы __add__ , __sub__, __iadd__, __isub__ чтобы они соответствовали методам add и take_out
# Решение:

class Queue():
    def __init__(self):
        self.inside = []

    def __str__(self):
        return f'{"=>".join(self.inside)}'

    def add(self, name):
        self.inside.append(name)

    def take_out(self):
        if len(self.inside) <= 0 or len(self.inside) >= 10:
            return print('Queue is empty or overfilled')
        self.inside.pop(0)

    def __add__(self, name):
        self.inside.append(name)

    def __sub__(self, name):
        if len(self.inside) <= 0 or len(self.inside) >= 10:
            return print('Queue is empty or overfilled')
        self.inside.pop(0)

    def __iadd__(self, name):
        self.inside.append(name)
        return self

    def __isub__(self, name):
        if len(self.inside) <= 0 or len(self.inside) >= 10:
            return print('Queue is empty or overfilled')
        self.inside.pop(0)
        return self


myQueue = Queue()

print('Filling the queue\n')

myQueue.add('Ji-Soo')
print(myQueue)
myQueue + 'Hyun-Sook'
print(myQueue)
myQueue + 'Seo-Chon'
print(myQueue)
myQueue += 'Suk-Gyu'
print(myQueue, end='\n\n')

print('Clearing the queue\n')

myQueue.take_out()
print(myQueue)
myQueue - ''
print(myQueue)
myQueue -= ''
print(myQueue)
myQueue -= ''
print('\nThe queue is over')

# Output:

# Filling the queue

# Ji-Soo
# Ji-Soo=>Hyun-Sook
# Ji-Soo=>Hyun-Sook=>Seo-Chon
# Ji-Soo=>Hyun-Sook=>Seo-Chon=>Suk-Gyu

# Clearing the queue

# Hyun-Sook=>Seo-Chon=>Suk-Gyu
# Seo-Chon=>Suk-Gyu
# Suk-Gyu

# The queue is over
