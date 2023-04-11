# Задание 1
# Создайте класс cat и добавьте 3 атрибута (имя, окрас, возраст) и 3 метода класса
# (мяукнуть, мурлыкать и еще один на ваше усмотрение).
# Создайте 1 экземпляр класса и продемонстрируйте его атрибуты и методы.
# Решение:

class Cat:
    def __init__(self, name, color, age):
        self.name = name
        self.color = color
        self.age = age

    def action_meow(self):
        print('Мяяяууу!')

    def action_purr(self):
        print('Муррр...')

    def action_growl(self):
        print('Хсссссс!')


Miky = Cat('Miky', 'white-black', 1)
print(Miky.name)
print(Miky.color)
print(Miky.age)
Miky.action_meow()
Miky.action_purr()
Miky.action_growl()

# Output:

# Miky
# white-black
# 1
# Мяяяууу!
# Муррр...
# Хсссссс!
