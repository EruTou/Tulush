# Задание 8*
# Предположим, что объявлена функция, которая подставляет в шаблон значения переменной field:
# def render_input(field):
#   return f'<input id="id_{field}" name="{field}">'

# username = render_input('username')
# print(username)

# Создайте декоратор, который обернет строку в теги
# <p> ... </p>
# Пример вывода:
# <p><input id="id_username" name="username"></p>


def decorator(field):
    def render_input():
        name = field()
        print(f'<p><input id="id_{name}" name="{name}"></p>')
    return render_input


def name_input():
    username = input('Введите имя: ')
    return username


out = decorator(name_input)
out()


# Введите имя: Ertine
# <p><input id="id_Ertine" name="Ertine"></p>

###################################################

# Не понял формулировку задания полностью, поэтому реализовал и в другом варианте

def decorator(field):
    def render_input():
        print(f'<p>{field()}</p>')
    return render_input


def name_input():
    username = input('Введите имя: ')
    return f'<input id="id_{username}" name="{username}">'


out = decorator(name_input)
out()


# Введите имя: Ertine
# <p><input id="id_Ertine" name="Ertine"></p>
