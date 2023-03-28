# Задание 7
# Пусть дана функция, которая спрашивает имя пользователя.
# def get_name( ):
#   name = input('Введите имя')
#   return name
# Создайте декоратор hello, который дополнительно будет выводить приветствие: "Привет, <имя>!"

def decorator(name):
    def hello():
        print(f'"Hello, {name()}!"')
    return hello


def get_name():
    name = input('Введите имя: ')
    return name


out = decorator(get_name)
out()


# Введите имя: Ertine
# "Hello, Ertine!"
