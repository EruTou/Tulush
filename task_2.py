# Задание 2
# Создайте базовый класс Father, у которого есть два атрибута:
#   name (имя) и surname (фамилия);
# и дочерний класс Child, у которого будут унаследованы те же атрибуты
# и дополнительно атрибут patronim (отчество).
# Создайте один экземпляр класса Child.
# Решение:

class Father():
    def __init__(self, name, surname):
        self.name = name
        self.surname = surname


class Child(Father):
    def __init__(self, name, patronim, surname):
        super().__init__(name, surname)
        self.patronim = patronim


father = Father('Андрей', 'Кровник')
print(father.name)
print(father.surname)
print()
child = Child('Матвей', 'Андреевич', 'Кровник')
print(child.name)
print(child.patronim)
print(child.surname)

# Output:

# Андрей
# Кровник

# Матвей
# Андреевич
# Кровник
