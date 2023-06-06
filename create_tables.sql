DROP DATABASE IF EXISTS sports_reference;
CREATE DATABASE IF NOT EXISTS sports_reference;
USE sports_reference;
DROP TABLE IF EXISTS sports_type;
CREATE TABLE sports_type (
    id_sport INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id_sport)
);
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    id_city INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
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
    surname VARCHAR(50),
    name VARCHAR(50),
    middle_name VARCHAR(50),
    nationality VARCHAR(50),
    citizenship VARCHAR(50),
    birthday DATE NOT NULL,
    city_id INT NOT NULL,
    PRIMARY KEY (id_personal_data),
    FOREIGN KEY (city_id) REFERENCES cities (id_city)
);
DROP TABLE IF EXISTS clubs;
CREATE TABLE clubs (
    id_club INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
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
    name VARCHAR(50),
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