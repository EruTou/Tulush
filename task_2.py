# Задание 2
# Создайте класс Good, который будет вычислять значения стоимости товаров.
# В качестве атрибутов пусть будут:
# name (имя товара),
# price(цена за 1 кг),
# cost (стоимость),
# weight(масса);
# в качестве методов:
# calc - вычисляющий стоимость товара.
# Реализуйте два экземпляра класса Good:
# Яблоки apple('apple', price = 100, weight = 1.5)
# Груши pear('pear', price = 120, weight = 0.8)
# Выведите их стоимость
# Решение:

class Good:
    def __init__(self, name, price, weight, cost=0):
        self.name = name
        self.price = price
        self.weight = weight
        self.cost = cost

    def calc(self):
        self.cost = self.price * self.weight
        print(
            f"You'll have to pay {self.cost}$ for {self.weight} kg of {self.name}s")


apple = Good('apple', price=100, weight=1.5)
pear = Good('pear', price=120, weight=0.8)

apple.calc()
pear.calc()

# Output:

# You'll have to pay 150.0$ for 1.5 kg of apples
# You'll have to pay 96.0$ for 0.8 kg of pears
