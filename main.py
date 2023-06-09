from sqlalchemy import create_engine, MetaData, Table, Column, Integer, Float, String, Date, Time, ForeignKey
from sqlalchemy.orm import DeclarativeBase, relationship, Session
from getpass4 import getpass

DBMS_NAME = input("DBMS_NAME: ")
DBAPI_NAME = input("DBAPI_NAME: ")
HOSTNAME = input("HOSTNAME: ")
USERNAME = input("USERNAME: ")
PASSWORD = getpass("PASSWORD: ")
DB_NAME = input("DB_NAME: ")

# Создание подключения к СУБД mysql, к БД sports_reference по Хосту localhost с помощью mysqlconnector DBAPI.
# engine = create_engine(f"mysql+mysqlconnector://root:pass@localhost/sports_reference")
engine = create_engine(f"{DBMS_NAME}+{DBAPI_NAME}://{USERNAME}:{PASSWORD}@{HOSTNAME}/{DB_NAME}")
print(f"Соединено по: {engine}")

class Base(DeclarativeBase): pass

class Sport_type(Base):
    __tablename__ = 'sports_type'
    id_sport = Column(Integer,
                        nullable=False,
                        unique=True,
                        primary_key=True,
                        autoincrement=True
                    )
    name = Column(String(50), nullable=False, unique=True)
    athletes = relationship("Athlete", backref="sports_type")

class City(Base):
    __tablename__ = 'cities'
    id_city = Column(Integer,
                nullable=False,
                unique=True,
                primary_key=True,
                autoincrement=True
                )
    name = Column(String(50), nullable=False, unique=True)
    personal_data = relationship("Personal_data", backref="cities")
    clubs = relationship("Club", backref="cities")
    results = relationship("Result", backref="cities")

class Anthropological_data(Base):
    __tablename__ = 'anthropological_data'
    id_anthropological_data = Column(Integer,
                                    nullable=False,
                                    unique=True,
                                    primary_key=True,
                                    autoincrement=True
                                    )
    height = Column(Float, nullable=False)
    weight = Column(Float, nullable=False)
    arm_length = Column(Float, nullable=False)
    leg_length = Column(Float, nullable=False)    
    foot_size = Column(Float, nullable=False)
    athletes = relationship("Athlete", backref="anthropological_data")

class Personal_data(Base):
    __tablename__ = 'personal_data'
    id_personal_data = Column(Integer,
                            nullable=False,
                            unique=True,
                            primary_key=True,
                            autoincrement=True
                            )
    surname = Column(String(50), nullable=False)
    name = Column(String(50), nullable=False)
    middle_name = Column(String(50), nullable=False)
    nationality = Column(String(50), nullable=False)    
    citizenship = Column(String(50), nullable=False)
    birthday = Column(Date, nullable=False)
    city_id = Column(Integer, ForeignKey('cities.id_city'))
    athletes = relationship("Athlete", backref="personal_data")

class Club(Base):
    __tablename__ = 'clubs'
    id_club = Column(Integer,
                nullable=False,
                unique=True,
                primary_key=True,
                autoincrement=True
                )
    name = Column(String(50), nullable=False)
    city_id = Column(Integer, ForeignKey('cities.id_city'))
    athletes = relationship("Athlete", backref="clubs")

class Athlete(Base):
    __tablename__ = 'athletes'
    id_athlete = Column(Integer,
                nullable=False,
                unique=True,
                primary_key=True,
                autoincrement=True
                )
    personal_data_id = Column(Integer, ForeignKey('personal_data.id_personal_data'))
    anthropological_data_id = Column(Integer, ForeignKey('anthropological_data.id_anthropological_data'))
    sport_id = Column(Integer, ForeignKey('sports_type.id_sport'))
    club_id = Column(Integer, ForeignKey('clubs.id_club'))
    results = relationship("Result", backref="athletes")

class Result(Base):
    __tablename__ = 'results'
    id_result = Column(Integer,
                nullable=False,
                unique=True,
                primary_key=True,
                autoincrement=True
                )
    name = Column(String(50), nullable=False)
    place = Column(Integer, nullable=False)
    date = Column(Date, nullable=False)
    time = Column(Time, nullable=False)    
    athlete_id = Column(Integer, ForeignKey('athletes.id_athlete'))
    city_id = Column(Integer, ForeignKey('cities.id_city'))
    records = relationship("Record", backref="results")

class Record(Base):
    __tablename__ = 'records'
    id_record = Column(Integer,
                nullable=False,
                unique=True,
                primary_key=True,
                autoincrement=True
                )
    result_id = Column(Integer, ForeignKey('results.id_result'))

# Нейтрализация всех таблиц
# Base.metadata.drop_all(engine)

# Генерирование всех таблиц
Base.metadata.create_all(engine)

# Создание сессии
session = Session(bind=engine)

# Вставка данных
st_1 = Sport_type(id_sport = 1, name = "Football")
st_2 = Sport_type(id_sport = 2, name = "Basketball")
st_3 = Sport_type(id_sport = 3, name = "Volleyball")
st_4 = Sport_type(id_sport = 4, name = "Tennis")
st_5 = Sport_type(id_sport = 5, name = "Hockey")

ct_1 = City(id_city = 1, name = "Madrid")
ct_2 = City(id_city = 2, name = "Barcelona")
ct_3 = City(id_city = 3, name = "Kyiv")
ct_4 = City(id_city = 4, name = "Boston")
ct_5 = City(id_city = 5, name = "New-York")

ad_1 = Anthropological_data(id_anthropological_data = 1, height = 160.5, weight = 55.2, arm_length = 520.5, leg_length = 699.2, foot_size = 40.5)
ad_2 = Anthropological_data(id_anthropological_data = 2, height = 164.5, weight = 52.2, arm_length = 540.5, leg_length = 710.2, foot_size = 42.5)
ad_3 = Anthropological_data(id_anthropological_data = 3, height = 170.8, weight = 60.1, arm_length = 532.4, leg_length = 701.8, foot_size = 39.9)
ad_4 = Anthropological_data(id_anthropological_data = 4, height = 184.7, weight = 76.4, arm_length = 540.3, leg_length = 750.2, foot_size = 45.1)
ad_5 = Anthropological_data(id_anthropological_data = 5, height = 194.5, weight = 85.1, arm_length = 567.4, leg_length = 794.6, foot_size = 47.6)

pd_1 = Personal_data(id_personal_data = 1, surname = "Giren", name = "Alex", middle_name = "Vovich", nationality = "Dutchman", citizenship = "Dutch", birthday = "1979-05-12", city_id = 1)
pd_2 = Personal_data(id_personal_data = 2, surname = "Adler", name = "Thomas", middle_name = "Weiss", nationality = "German", citizenship = "German", birthday = "1984-09-01", city_id = 2)
pd_3 = Personal_data(id_personal_data = 3, surname = "Stephano", name = "James", middle_name = "Jason", nationality = "American", citizenship = "American", birthday = "1979-05-12", city_id = 3)
pd_4 = Personal_data(id_personal_data = 4, surname = "Torrien", name = "Lorenzo", middle_name = "Caesar", nationality = "Italian", citizenship = "Italian", birthday = "1989-03-02", city_id = 4)
pd_5 = Personal_data(id_personal_data = 5, surname = "Ivanov", name = "Roman", middle_name = "Vladislavovich", nationality = "Russian", citizenship = "Russian", birthday = "1999-11-22", city_id = 5)

cl_1 = Club(id_club = 1, name = "Real Madrid Voleibol", city_id = 1)
cl_2 = Club(id_club = 2, name = "FC Barcelona", city_id = 2)
cl_3 = Club(id_club = 3, name = "NAVI", city_id = 3)
cl_4 = Club(id_club = 4, name = "Boston Celtics", city_id = 4)
cl_5 = Club(id_club = 5, name = "New-York Rangers", city_id = 5)

at_1 = Athlete(id_athlete = 1, personal_data_id = 1, anthropological_data_id = 1, sport_id = 1, club_id = 1)
at_2 = Athlete(id_athlete = 2, personal_data_id = 2, anthropological_data_id = 2, sport_id = 2, club_id = 2)
at_3 = Athlete(id_athlete = 3, personal_data_id = 3, anthropological_data_id = 3, sport_id = 3, club_id = 3)
at_4 = Athlete(id_athlete = 4, personal_data_id = 4, anthropological_data_id = 4, sport_id = 4, club_id = 4)
at_5 = Athlete(id_athlete = 5, personal_data_id = 5, anthropological_data_id = 5, sport_id = 5, club_id = 5)

rs_1 = Result(id_result = 1, name = "UEFA Champions League", place = 1, date = "2004-05-20", time = "20:21:03", athlete_id = 1, city_id = 1)
rs_2 = Result(id_result = 2, name = "Basketball World Cup", place = 2, date = "2009-11-18", time = "23:04:23", athlete_id = 2, city_id = 2)
rs_3 = Result(id_result = 3, name = "World League", place = 3, date = "2012-12-25", time = "14:49:51", athlete_id = 3, city_id = 3)
rs_4 = Result(id_result = 4, name = "Monte-Carlo Masters", place = 4, date = "2016-05-21", time = "08:39:49", athlete_id = 4, city_id = 4)
rs_5 = Result(id_result = 5, name = "World Championship", place = 5, date = "2020-01-10", time = "10:14:40", athlete_id = 5, city_id = 5)

rc_1 = Record(id_record = 1, result_id = 1)
rc_2 = Record(id_record = 2, result_id = 2)
rc_3 = Record(id_record = 3, result_id = 3)
rc_4 = Record(id_record = 4, result_id = 4)
rc_5 = Record(id_record = 5, result_id = 5)

session.add_all([st_1, st_2, st_3, st_4, st_5])
session.add_all([ct_1, ct_2, ct_3, ct_4, ct_5])
session.add_all([ad_1, ad_2, ad_3, ad_4, ad_5])
session.add_all([pd_1, pd_2, pd_3, pd_4, pd_5])
session.add_all([cl_1, cl_2, cl_3, cl_4, cl_5])
session.add_all([at_1, at_2, at_3, at_4, at_5])
session.add_all([rs_1, rs_2, rs_3, rs_4, rs_5])
session.add_all([rc_1, rc_2, rc_3, rc_4, rc_5])
session.commit()

# Проверка введенных данных
print('Проверка введенных данных')
print(st_1.id_sport, st_1.name)
print(ct_1.id_city, ct_1.name)
print(ad_1.id_anthropological_data, ad_1.height, ad_1.weight, ad_1.arm_length, ad_1.leg_length, ad_1.foot_size)
print(pd_1.id_personal_data, pd_1.surname, pd_1.name, pd_1.middle_name, pd_1.nationality, pd_1.citizenship, pd_1.birthday, pd_1.city_id)
print(cl_1.id_club, cl_1.name, cl_1.city_id)
print(at_1.id_athlete, at_1.personal_data_id, at_1.anthropological_data_id, at_1.sport_id, at_1. club_id)
print(rs_1.id_result, rs_1.name, rs_1.place, rs_1.date, rs_1.time, rs_1.athlete_id, rs_1.city_id)
print(rc_1.id_record, rc_1.result_id)

print(f"Отсоединено от: {engine}")