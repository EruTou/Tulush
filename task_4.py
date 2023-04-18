# Задание 4
# Создайте базовый класс User с атрибутами login, password и методом:
#   view - выводит сообщение "Я - User. Могу просматривать содержимое"
# Создайте дочерний класс Moderator, у которого так же будут атрибуты login и password и дополнительно - group_id,
# а так же два метода:
#   view - выводит сообщение "Я - Moderator. Могу просматривать содержимое"
#   redact - выводит сообщение "Я - Moderator. Могу редактировать содержимое"
# Решение:

class User():
    def __init__(self, login, password):
        self.login = login
        self.password = password

    def view(self):
        print(f'Я - {self.login}. Могу просматривать содержимое')


class Moderator(User):
    def __init__(self, login, password, group_id):
        self.login = login
        self.password = password
        self.group_id = group_id

    def view(self):
        print(f'Я - {self.login}. Могу просматривать содержимое')

    def redact(self):
        print(f'Я - {self.login}. Могу редактировать содержимое')


user = User('Kira', 'qwerty123')
print(user.login)
print(user.password)
user.view()
print()
moder = Moderator('L', 'zxcvbn123', '912')
print(moder.login)
print(moder.password)
print(moder.group_id)
moder.view()
moder.redact()

# Output:

# Kira
# qwerty123
# Я - Kira. Могу просматривать содержимое

# L
# zxcvbn123
# 912
# Я - L. Могу просматривать содержимое
# Я - L. Могу редактировать содержимое
