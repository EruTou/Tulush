# Задание 1
# Создайте класс Battery, у которого будет определен атрибут capacity = [ ] (емкость),
# max_charge = 5 (максимальный заряд) по умолчанию, и методы:
#   charge - заряжает батарею,
#   discharge - разряжает батарею.
# Переопределите метод __str__, чтобы при вызове экземпляра он представлялся в виде:
# [)))))] - максимально заряженная батарея.
# Решение:

class Battery():
    def __init__(self, capacity, max_charge=5):
        self.capacity = capacity
        self.max_charge = max_charge
        if len(capacity) > max_charge:
            self.capacity = [')', ')', ')', ')', ')']

    def __str__(self):
        return f'[{"".join(self.capacity)}]'

    def charge(self):
        if len(self.capacity) >= self.max_charge:
            return print('Battery is charged')
        self.capacity.append(')')

    def discharge(self):
        if len(self.capacity) <= 0:
            return print('Battery is low')
        self.capacity.pop()


laptop = Battery([')', ')', ')', ')', ')'], 5)
print(f'Before discharging: {laptop}')

print(f'\nDischarging')

for i in range(5):
    laptop.discharge()
    print(laptop)

laptop.discharge()

print(f'\nCharging')

for i in range(5):
    laptop.charge()
    print(laptop)

laptop.charge()

# Output:

# Before discharging: [)))))]

# Discharging
# [))))]
# [)))]
# [))]
# [)]
# []
# Battery is low

# Charging
# [)]
# [))]
# [)))]
# [))))]
# [)))))]
# Battery is charged
