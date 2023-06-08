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
    {"id_sport": 1, "personal_data_id": 1, "anthropological_data_id": 1, "sport_id": 1, "club_id": 1},
    {"id_sport": 2, "personal_data_id": 2, "anthropological_data_id": 2, "sport_id": 2, "club_id": 2},
    {"id_sport": 3, "personal_data_id": 3, "anthropological_data_id": 3, "sport_id": 3, "club_id": 3},
    {"id_sport": 4, "personal_data_id": 4, "anthropological_data_id": 4, "sport_id": 4, "club_id": 4},
    {"id_sport": 5, "personal_data_id": 5, "anthropological_data_id": 5, "sport_id": 5, "club_id": 5}
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

with engine.begin() as conn:
    conn.execute(insert_st_query)
    conn.execute(insert_ct_query)
    conn.execute(insert_ad_query)
    conn.execute(insert_pd_query)
    conn.execute(insert_cl_query)
    conn.execute(insert_at_query)
    conn.execute(insert_rs_query)
    conn.execute(insert_rc_query)