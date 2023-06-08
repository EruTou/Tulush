from sqlalchemy import create_engine, MetaData, Table, Column, Integer, Float, String, Date, Time, ForeignKeyConstraint, select
from getpass4 import getpass

metadata = MetaData()

DBMS_NAME = input("DBMS_NAME: ")
DBAPI_NAME = input("DBAPI_NAME: ")
HOSTNAME = input("HOSTNAME: ")
USERNAME = input("USERNAME: ")
PASSWORD = getpass("PASSWORD: ")
DB_NAME = input("DB_NAME: ")

# Создание подключения к СУБД mysql, к БД sports_reference по Хосту localhost с помощью mysqlconnector DBAPI.
# engine = create_engine(f"mysql+mysqlconnector://root:pass@localhost/sports_reference")
engine = create_engine(f"{DBMS_NAME}+{DBAPI_NAME}://{USERNAME}:{PASSWORD}@{HOSTNAME}/{DB_NAME}")
connection = engine.connect()
print(f"Соединено по: {engine}")

# Создание таблиц
sports_type = Table('sports_type', metadata,
            Column('id_sport', Integer(), primary_key=True),
            Column('name', String(50), nullable=False)
            )

cities = Table('cities', metadata,
        Column('id_city', Integer(), primary_key=True),
        Column('name', String(50), nullable=False)
        )

anthropological_data = Table('anthropological_data', metadata,
                    Column('id_anthropological_data',
                                    Integer(), primary_key=True),
                    Column('height', Float(), nullable=False),
                    Column('weight', Float(), nullable=False),
                    Column('arm_length', Float(), nullable=False),
                    Column('leg_length', Float(), nullable=False),
                    Column('foot_size', Float(), nullable=False)
                    )

personal_data = Table('personal_data', metadata,
                Column('id_personal_data', Integer(), primary_key=True),
                Column('surname', String(50), nullable=False),
                Column('name', String(50), nullable=False),
                Column('middle_name', String(50), nullable=False),
                Column('nationality', String(50), nullable=False),
                Column('citizenship', String(50), nullable=False),
                Column('birthday', Date(), nullable=False),
                Column('city_id', Integer(), nullable=False,),
                ForeignKeyConstraint(['city_id'],['cities.id_city'])
                )

clubs = Table('clubs', metadata,
        Column('id_club', Integer(), primary_key=True),
        Column('name', String(50), nullable=False),
        Column('city_id', Integer(), nullable=False),
        ForeignKeyConstraint(['city_id'],['cities.id_city'])
        )

athletes = Table('athletes', metadata,
        Column('id_athlete', Integer(), primary_key=True),
        Column('personal_data_id', Integer(), nullable=False),
        Column('anthropological_data_id', Integer(), nullable=False),
        Column('sport_id', Integer(), nullable=False),
        Column('club_id', Integer(), nullable=False),
        ForeignKeyConstraint(['personal_data_id'],['personal_data.id_personal_data']),
        ForeignKeyConstraint(['anthropological_data_id'],['anthropological_data.id_anthropological_data']),
        ForeignKeyConstraint(['sport_id'],['sports_type.id_sport']),
        ForeignKeyConstraint(['club_id'],['clubs.id_club'])
        )

results = Table('results', metadata,
        Column('id_result', Integer(), primary_key=True),
        Column('name', String(50), nullable=False),
        Column('place', Integer(), nullable=False),
        Column('date', Date(), nullable=False),
        Column('time', Time(), nullable=False),
        Column('athlete_id', Integer(), nullable=False),
        Column('city_id', Integer(), nullable=False),
        ForeignKeyConstraint(['athlete_id'],['athletes.id_athlete']),
        ForeignKeyConstraint(['city_id'],['cities.id_city'])
        )

records = Table('records', metadata,
        Column('id_record', Integer(), primary_key=True),
        Column('result_id', Integer(), nullable=False),
        ForeignKeyConstraint(['result_id'],['results.id_result'])
        )

# Вывод имен таблиц
for t in metadata.tables:
    print(metadata.tables[t])

# Воссоздание всех таблиц
metadata.create_all(engine)

# Вставка данных
insert_st_query = sports_type.insert().values([
    {"id_sport": 1, "name": "Football"},
    {"id_sport": 2, "name": "Basketball"},
    {"id_sport": 3, "name": "Volleyball"},
    {"id_sport": 4, "name": "Tennis"},
    {"id_sport": 5, "name": "Hockey"}
])

insert_ct_query = cities.insert().values([
    {"id_city": 1, "name": "Madrid"},
    {"id_city": 2, "name": "Barcelona"},
    {"id_city": 3, "name": "Kyiv"},
    {"id_city": 4, "name": "Boston"},
    {"id_city": 5, "name": "New-York"}
])

insert_ad_query = anthropological_data.insert().values([
    {"id_anthropological_data": 1, "height": 160.5, "weight": 55.2, "arm_length": 520.5, "leg_length": 699.2, "foot_size": 40.5}, 
    {"id_anthropological_data": 2, "height": 164.5, "weight": 52.2, "arm_length": 540.5, "leg_length": 710.2, "foot_size": 42.5},
    {"id_anthropological_data": 3, "height": 170.8, "weight": 60.1, "arm_length": 532.4, "leg_length": 701.8, "foot_size": 39.9},
    {"id_anthropological_data": 4, "height": 184.7, "weight": 76.4, "arm_length": 540.3, "leg_length": 750.2, "foot_size": 45.1},
    {"id_anthropological_data": 5, "height": 194.5, "weight": 85.1, "arm_length": 567.4, "leg_length": 794.6, "foot_size": 47.6}
])

insert_pd_query = personal_data.insert().values([
    {"id_personal_data": 1, "surname": "Giren", "name": "Alex", "middle_name": "Vovich", "nationality": "Dutchman", "citizenship": "Dutch", "birthday": "1979-05-12", "city_id": 1},
    {"id_personal_data": 2, "surname": "Adler", "name": "Thomas", "middle_name": "Weiss", "nationality": "German", "citizenship": "German", "birthday": "1984-09-01", "city_id": 2},
    {"id_personal_data": 3, "surname": "Stephano", "name": "James", "middle_name": "Jason", "nationality": "American", "citizenship": "American", "birthday": "1979-05-12", "city_id": 3},
    {"id_personal_data": 4, "surname": "Torrien", "name": "Lorenzo", "middle_name": "Caesar", "nationality": "Italian", "citizenship": "Italian", "birthday": "1989-03-02", "city_id": 4},
    {"id_personal_data": 5, "surname": "Ivanov", "name": "Roman", "middle_name": "Vladislavovich", "nationality": "Russian", "citizenship": "Russian", "birthday": "1999-11-22", "city_id": 5}
])

insert_cl_query = clubs.insert().values([
    {"id_club": 1, "name": "Real Madrid Voleibol", "city_id": 1},
    {"id_club": 2, "name": "FC Barcelona", "city_id": 2},
    {"id_club": 3, "name": "NAVI", "city_id": 3},
    {"id_club": 4, "name": "Boston Celtics", "city_id": 4},
    {"id_club": 5, "name": "New-York Rangers", "city_id": 5}
])

insert_at_query = athletes.insert().values([
    {"id_athlete": 1, "personal_data_id": 1, "anthropological_data_id": 1, "sport_id": 1, "club_id": 1},
    {"id_athlete": 2, "personal_data_id": 2, "anthropological_data_id": 2, "sport_id": 2, "club_id": 2},
    {"id_athlete": 3, "personal_data_id": 3, "anthropological_data_id": 3, "sport_id": 3, "club_id": 3},
    {"id_athlete": 4, "personal_data_id": 4, "anthropological_data_id": 4, "sport_id": 4, "club_id": 4},
    {"id_athlete": 5, "personal_data_id": 5, "anthropological_data_id": 5, "sport_id": 5, "club_id": 5}
])

insert_rs_query = results.insert().values([
    {"id_result": 1, "name": "UEFA Champions League", "place": 1, "date": "2004-05-20", "time": "20:21:03", "athlete_id": 1, "city_id": 1},
    {"id_result": 2, "name": "Basketball World Cup", "place": 2, "date": "2009-11-18", "time": "23:04:23", "athlete_id": 2, "city_id": 2},
    {"id_result": 3, "name": "World League", "place": 3, "date": "2012-12-25", "time": "14:49:51", "athlete_id": 3, "city_id": 3},
    {"id_result": 4, "name": "Monte-Carlo Masters", "place": 4, "date": "2016-05-21", "time": "08:39:49", "athlete_id": 4, "city_id": 4},
    {"id_result": 5, "name": "World Championship", "place": 5, "date": "2020-01-10", "time": "10:14:40", "athlete_id": 5, "city_id": 5}
])

insert_rc_query = records.insert().values([
    {"id_record": 1, "result_id": 1},
    {"id_record": 2, "result_id": 2},
    {"id_record": 3, "result_id": 3},
    {"id_record": 4, "result_id": 4},
    {"id_record": 5, "result_id": 5}
])

# Запуск всех insert'ов
with engine.begin() as conn:
    conn.execute(insert_st_query),
    conn.execute(insert_ct_query),
    conn.execute(insert_ad_query),
    conn.execute(insert_pd_query),
    conn.execute(insert_cl_query),
    conn.execute(insert_at_query),
    conn.execute(insert_rs_query),
    conn.execute(insert_rc_query)

connection.close()
print(f"Отсоединено от: {engine}")