from getpass4 import getpass
from mysql.connector import connect, Error

# Проверка существующих БД
# try:
#     with connect(
#         host="localhost",
#         user=input("Введите имя пользователя: "),
#         password=getpass("Введите пароль: "),
#     ) as connection:
#         show_db_query = "SHOW DATABASES"
#         with connection.cursor() as cursor:
#             cursor.execute(show_db_query)
#             for db in cursor:
#                 print(db)
# except Error as e:
#     print(e)

try:
    with connect(
        host="localhost",
        user=input("Имя пользователя: "),
        password=getpass("Пароль: "),
    ) as connection:
        create_db_query = """DROP DATABASE IF EXISTS sports_reference;
                            CREATE DATABASE IF NOT EXISTS sports_reference;
                            USE sports_reference;
                            DROP TABLE IF EXISTS sports_type;
                            CREATE TABLE sports_type (
                                id_sport INT NOT NULL AUTO_INCREMENT,
                                name VARCHAR(50) NOT NULL,
                                PRIMARY KEY (id_sport)
                            );
                            DROP TABLE IF EXISTS cities;
                            CREATE TABLE cities (
                                id_city INT NOT NULL AUTO_INCREMENT,
                                name VARCHAR(50) NOT NULL,
                                PRIMARY KEY (id_city)
                            );
                            DROP TABLE IF EXISTS anthropological_data;
                            CREATE TABLE anthropological_data (
                                id_anthropological_data INT NOT NULL AUTO_INCREMENT,
                                height FLOAT NOT NULL,
                                weight FLOAT NOT NULL,
                                arm_length FLOAT NOT NULL,
                                leg_length FLOAT NOT NULL,
                                foot_size FLOAT NOT NULL,
                                PRIMARY KEY (id_anthropological_data)
                            );
                            DROP TABLE IF EXISTS personal_data;
                            CREATE TABLE personal_data (
                                id_personal_data INT NOT NULL AUTO_INCREMENT,
                                surname VARCHAR(50) NOT NULL,
                                name VARCHAR(50) NOT NULL,
                                middle_name VARCHAR(50) NOT NULL,
                                nationality VARCHAR(50) NOT NULL,
                                citizenship VARCHAR(50) NOT NULL,
                                birthday DATE NOT NULL,
                                city_id INT NOT NULL,
                                PRIMARY KEY (id_personal_data),
                                FOREIGN KEY (city_id) REFERENCES cities (id_city)
                            );
                            DROP TABLE IF EXISTS clubs;
                            CREATE TABLE clubs (
                                id_club INT NOT NULL AUTO_INCREMENT,
                                name VARCHAR(50) NOT NULL,
                                city_id INT NOT NULL,
                                PRIMARY KEY (id_club),
                                FOREIGN KEY (city_id) REFERENCES cities (id_city)
                            );
                            DROP TABLE IF EXISTS athletes;
                            CREATE TABLE athletes (
                                id_athlete INT NOT NULL AUTO_INCREMENT,
                                personal_data_id INT NOT NULL,
                                anthropological_data_id INT NOT NULL,
                                sport_id INT NOT NULL,
                                club_id INT NOT NULL,
                                PRIMARY KEY (id_athlete),
                                FOREIGN KEY (personal_data_id) REFERENCES personal_data (id_personal_data),
                                FOREIGN KEY (anthropological_data_id) REFERENCES anthropological_data (id_anthropological_data),
                                FOREIGN KEY (sport_id) REFERENCES sports_type (id_sport),
                                FOREIGN KEY (club_id) REFERENCES clubs (id_club)
                            );
                            DROP TABLE IF EXISTS results;
                            CREATE TABLE results (
                                id_result INT NOT NULL AUTO_INCREMENT,
                                name VARCHAR(50) NOT NULL,
                                place INT NOT NULL,
                                date DATE NOT NULL,
                                time TIME NOT NULL,
                                athlete_id INT NOT NULL,
                                city_id INT NOT NULL,
                                PRIMARY KEY (id_result),
                                FOREIGN KEY (athlete_id) REFERENCES athletes (id_athlete),
                                FOREIGN KEY (city_id) REFERENCES cities (id_city)
                            );
                            DROP TABLE IF EXISTS records;
                            CREATE TABLE records (
                                id_record INT NOT NULL AUTO_INCREMENT,
                                result_id INT NOT NULL,
                                PRIMARY KEY (id_record),
                                FOREIGN KEY (result_id) REFERENCES results (id_result)
                            );
                            """
        with connection.cursor() as cursor:
            cursor.execute(create_db_query)
except Error as e:
    print(e)

# try:
#     with connect(
#         host="localhost",
#         user=input("Имя пользователя: "),
#         password=getpass("Пароль: "),
#         database="sports_reference"
#     ) as connection:
#         insert_data_query_1 = "INSERT INTO sports_type (id_sport, name) VALUES (1, 'Football'),(2, 'Basketball'),(3, 'Volleyball'),(4, 'Tennis'),(5, 'Hockey');"
#         insert_data_query_2 = "INSERT INTO cities (id_city, name) VALUES (1, 'Madrid'),(2, 'Barcelona'),(3, 'Kyiv'),(4, 'Boston'),(5, 'New-York');"
#         insert_data_query_3 = "INSERT INTO anthropological_data (id_anthropological_data, height, weight, arm_length, leg_length, foot_size) VALUES (1, 160.5, 55.2, 520.5, 699.2, 40.5),(2, 164.5, 52.2, 540.5, 710.2, 42.5),(3, 170.8, 60.1, 532.4, 701.8, 39.9),(4, 184.7, 76.4, 540.3, 750.2, 45.1),(5, 194.5, 85.1, 567.4, 794.6, 47.6);"
#         insert_data_query_4 = "INSERT INTO personal_data (id_personal_data, surname, name, middle_name, nationality, citizenship, birthday, city_id) VALUES (1, 'Giren', 'Alex', 'Vovich', 'Dutchman', 'Dutch', '1979-05-12', 1),(2, 'Adler', 'Thomas', 'Weiss', 'German', 'German', '1984-09-01', 2),(3, 'Stephano', 'James', 'Jason', 'American', 'American', '1979-05-12', 3),(4, 'Torrien', 'Lorenzo', 'Caesar', 'Italian', 'Italian', '1989-03-02', 4),(5, 'Ivanov', 'Roman', 'Vladislavovich', 'Russian', 'Russian', '1999-11-22', 5);"
#         insert_data_query_5 = "INSERT INTO clubs (id_club, name, city_id) VALUES (1, 'Real Madrid Voleibol', 1),(2, 'FC Barcelona', 2),(3, 'NAVI', 3),(4, 'Boston Celtics', 4),(5, 'New-York Rangers', 5);"
#         insert_data_query_6 = "INSERT INTO athletes (id_athlete, personal_data_id, anthropological_data_id, sport_id, club_id) VALUES (1, 1, 1, 1, 1),(2, 2, 2, 2, 2),(3, 3, 3, 3, 3),(4, 4, 4, 4, 4),(5, 5, 5, 5, 5);"
#         insert_data_query_7 = "INSERT INTO results (id_result, name, place, date, time, athlete_id, city_id) VALUES (1, 'UEFA Champions League', 1, '2004-05-20', '20:21:03', 1, 1),(2, 'Basketball World Cup', 2, '2009-11-18', '23:04:23', 2, 2),(3, 'World League', 3, '2012-12-25', '14:49:51', 3, 3),(4, 'Monte-Carlo Masters', 4, '2016-05-21', '08:39:49', 4, 4),(5, 'World Championship', 5, '2020-01-10', '10:14:40', 5, 5);"
#         insert_data_query_8 = "INSERT INTO records (id_record, result_id) VALUES (1, 1),(2, 2),(3, 3),(4, 4),(5, 5);"
#         with connection.cursor() as cursor:
#             for query_num in range(9, 1, 1):
#                 cursor.execute(f"insert_data_query_{query_num}")
# except Error as e:d
#     print(e)
# connection.close()

# try:
#     with connect(
#         host="localhost",
#         user=input("Имя пользователя: "),
#         password=getpass("Пароль: "),
#         database="sports_reference",
#     ) as connection:
#         insert_data_query = f"""
#                             USE sports_reference;
#                             INSERT INTO sports_type VALUES {(1, 'Football'),(2, 'Basketball'),(3, 'Volleyball'),(4, 'Tennis'),(5, 'Hockey')};
#                             INSERT INTO cities VALUES {(1, 'Madrid'),(2, 'Barcelona'),(3, 'Kyiv'),(4, 'Boston'),(5, 'New-York')};
#                             INSERT INTO anthropological_data VALUES {(1, 160.5, 55.2, 520.5, 699.2, 40.5),(2, 164.5, 52.2, 540.5, 710.2, 42.5),(3, 170.8, 60.1, 532.4, 701.8, 39.9),(4, 184.7, 76.4, 540.3, 750.2, 45.1),(5, 194.5, 85.1, 567.4, 794.6, 47.6)};
#                             INSERT INTO personal_data VALUES {(1, 'Giren', 'Alex', 'Vovich', 'Dutchman', 'Dutch', '1979-05-12', 1),(2, 'Adler', 'Thomas', 'Weiss', 'German', 'German', '1984-09-01', 2),(3, 'Stephano', 'James', 'Jason', 'American', 'American', '1979-05-12', 3),(4, 'Torrien', 'Lorenzo', 'Caesar', 'Italian', 'Italian', '1989-03-02', 4),(5, 'Ivanov', 'Roman', 'Vladislavovich', 'Russian', 'Russian', '1999-11-22', 5)};
#                             INSERT INTO clubs VALUES {(1, 'Real Madrid Voleibol', 1),(2, 'FC Barcelona', 2),(3, 'NAVI', 3),(4, 'Boston Celtics', 4),(5, 'New-York Rangers', 5)};
#                             INSERT INTO athletes VALUES {(1, 1, 1, 1, 1),(2, 2, 2, 2, 2),(3, 3, 3, 3, 3),(4, 4, 4, 4, 4),(5, 5, 5, 5, 5)};
#                             INSERT INTO results VALUES {(1, 'UEFA Champions League', 1, '2004-05-20', '20:21:03', 1, 1),(2, 'Basketball World Cup', 2, '2009-11-18', '23:04:23', 2, 2),(3, 'World League', 3, '2012-12-25', '14:49:51', 3, 3),(4, 'Monte-Carlo Masters', 4, '2016-05-21', '08:39:49', 4, 4),(5, 'World Championship', 5, '2020-01-10', '10:14:40', 5, 5)};
#                             INSERT INTO records VALUES {(1, 1),(2, 2),(3, 3),(4, 4),(5, 5)};
#                             """
#         with connection.cursor() as cursor:
#             cursor.execute(insert_data_query)
# except Error as e:
#     print(e)
    
try:
    with connect(
        host="localhost",
        user=input("Имя пользователя: "),
        password=getpass("Пароль: "),
        database="sports_reference",
    ) as connection:
        st = "INSERT INTO sports_type VALUES ;"
        ct = "INSERT INTO cities VALUES ;"
        ad = "INSERT INTO anthropological_data VALUES ;"
        pd = "INSERT INTO personal_data VALUES ;"
        cl = "INSERT INTO clubs VALUES ;"
        ath = "INSERT INTO athletes VALUES ;"
        res = "INSERT INTO results VALUES ;"
        rec = "INSERT INTO records VALUES ;"
        tables = [st, ct, ad, pd, cl, ath, res, rec]
        st_data = [(1, 'Football'),(2, 'Basketball'),(3, 'Volleyball'),(4, 'Tennis'),(5, 'Hockey')]
        ct_data = [(1, 'Madrid'),(2, 'Barcelona'),(3, 'Kyiv'),(4, 'Boston'),(5, 'New-York')]
        ad_data = [(1, 160.5, 55.2, 520.5, 699.2, 40.5),(2, 164.5, 52.2, 540.5, 710.2, 42.5),(3, 170.8, 60.1, 532.4, 701.8, 39.9),(4, 184.7, 76.4, 540.3, 750.2, 45.1),(5, 194.5, 85.1, 567.4, 794.6, 47.6)]
        pd_data = [(1, 'Giren', 'Alex', 'Vovich', 'Dutchman', 'Dutch', '1979-05-12', 1),(2, 'Adler', 'Thomas', 'Weiss', 'German', 'German', '1984-09-01', 2),(3, 'Stephano', 'James', 'Jason', 'American', 'American', '1979-05-12', 3),(4, 'Torrien', 'Lorenzo', 'Caesar', 'Italian', 'Italian', '1989-03-02', 4),(5, 'Ivanov', 'Roman', 'Vladislavovich', 'Russian', 'Russian', '1999-11-22', 5)]
        cl_data = [(1, 'Real Madrid Voleibol', 1),(2, 'FC Barcelona', 2),(3, 'NAVI', 3),(4, 'Boston Celtics', 4),(5, 'New-York Rangers', 5)]
        ath_data = [(1, 1, 1, 1, 1),(2, 2, 2, 2, 2),(3, 3, 3, 3, 3),(4, 4, 4, 4, 4),(5, 5, 5, 5, 5)]
        res_data = [(1, 'UEFA Champions League', 1, '2004-05-20', '20:21:03', 1, 1),(2, 'Basketball World Cup', 2, '2009-11-18', '23:04:23', 2, 2),(3, 'World League', 3, '2012-12-25', '14:49:51', 3, 3),(4, 'Monte-Carlo Masters', 4, '2016-05-21', '08:39:49', 4, 4),(5, 'World Championship', 5, '2020-01-10', '10:14:40', 5, 5)]
        rec_data = [(1, 1),(2, 2),(3, 3),(4, 4),(5, 5)]
        data = {st: st_data, ct: ct_data, ad: ad_data, pd: pd_data, cl: cl_data, ath: ath_data, res: res_data, rec: rec_data}
        with connection.cursor() as cursor:
            for table in tables:
                cursor.execute(data[table])
except Error as e:
    print(e)
    
# try:
#     with connect(
#         host="localhost",
#         user=input("Имя пользователя: "),
#         password=getpass("Пароль: "),
#         database="sports_reference",
#     ) as connection:
#         select_query = "select * from sports_type;"
#         with connection.cursor() as cursor:
#             cursor.execute(select_query)
#             result = cursor.fetchall()
#             for row in result:
#                 print(row)
# except Error as e:
#     print(e)

