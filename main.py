import pymongo as pm

# Устанавливаем соединение с MongoDB (MongoDB должна быть запущена)
client = pm.MongoClient('mongodb://localhost:27017')

# Подключаемся к БД, если ее нет, то она создается
db = client.sports_reference_db # attribute style

# Получаем коллекцию (таблицу) из нашей БД, если ее нет, то она создается
collection = db.sports_type

# Создаем словарь данных для вставки в коллекцию (таблицу)
sports_type_data = [
    {'_id': 1, 'name': 'Football'},
    {'_id': 2, 'name': 'Basketball'},
    {'_id': 3, 'name': 'Volleyball'},
    {'_id': 4, 'name': 'Tennis'},
    {'_id': 5, 'name': 'Hockey'}
]

# Вставляем данные в sports_type
ins_query = collection.insert_many(sports_type_data)

# Удаление данных из коллекции (таблицы)
# collection.delete_many({})

# Проверка вставленных данных
for sport_type in collection.find({}):
    print(sport_type)