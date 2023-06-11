import redis

# Устанавливаем соединение с redis-server
r = redis.Redis(host='localhost', port=6379, db=0, charset='utf-8', decode_responses=True)

# Пропингуем подключение для проверки
print(r.ping()) # должно быть True

### Запись в хеш ###

# Создание словаря с данными для хеша cities
cities_data = {  
    1: "Madrid",
    2: "Barcelona",
    3: "Kyiv",
    4: "Boston",
    5: "New-York"
}

# Запись данных в хеш cities
# r.hmset('cities', cities_data) # устаревший метод
for key, value in cities_data.items():
    r.hset('cities', key, value)

# Удаление данных хеша cities
# r.hdel("cities", *r.hkeys("cities"))

# Вывод значений хеша cities
print(f"cities: {r.hgetall('cities')}")

### Запись в сортированное множество (на всякий случай) ###

# Создание и запись в сортированное множество cities данных
# r.zadd('cities', {
#                     'Madrid': 1,
#                     'Barcelona': 2, 
#                     'Kyiv': 3,
#                     'Boston': 4,
#                     'New-York': 5
#                  })

# Удаление данных из сортированного множества cities
# r.zremrangebyrank('cities', 0, -1)

# Вывод значений сортированного множества cities
# print(f"cities: {r.zrange('cities', 0, -1)}")

# Очистить и удалить все ключи из текущей БД
# r.flushdb