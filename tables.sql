--^;DSFG)dVJHV
--bp8_user

CREATE TABLE categories
(
    id         BIGINT AUTO_INCREMENT,
    name       VARCHAR(100),
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY key (id)
);

CREATE TABLE stations
(
    id         BIGINT AUTO_INCREMENT,
    name       VARCHAR(100),
    asset      BIGINT,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY key (id)
);

CREATE TABLE station_categories
(
    id         BIGINT AUTO_INCREMENT,
    stationid  BIGINT,
    categoryid BIGINT,
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY key (id)
);


CREATE TABLE uploads (
     id BIGINT AUTO_INCREMENT,
     file_original_name varchar(255) DEFAULT NULL,
     file_name varchar(255) DEFAULT NULL,
     file_size int(11) DEFAULT NULL,
     extension varchar(10) DEFAULT NULL,
     type varchar(15) DEFAULT NULL,
     created_at timestamp NOT NULL DEFAULT current_timestamp(),
     updated_at timestamp NOT NULL DEFAULT current_timestamp(),
     deleted_at timestamp NULL DEFAULT NULL,
     PRIMARY KEY(id)
);

CREATE TABLE workouts(
    id BIGINT AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    asset BIGINT,
    days varchar(500),
    created_at timestamp NOT NULL DEFAULT current_timestamp(),
    updated_at timestamp NOT NULL DEFAULT current_timestamp(),
    deleted_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE workout_pods(
   id BIGINT AUTO_INCREMENT,
   workoutid BIGINT,
   sets int,
   laps int,
   timesplit varchar(500),
   created_at timestamp NOT NULL DEFAULT current_timestamp(),
   updated_at timestamp NOT NULL DEFAULT current_timestamp(),
   deleted_at timestamp NULL DEFAULT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE pod_stations(
    id BIGINT AUTO_INCREMENT,
    podid BIGINT,
    stationid BIGINT,
    created_at timestamp NOT NULL DEFAULT current_timestamp(),
    updated_at timestamp NOT NULL DEFAULT current_timestamp(),
    deleted_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE users
ADD COLUMN api_token VARCHAR(1000);

CREATE TABLE workout_tracks(
   id BIGINT AUTO_INCREMENT,
   workoutid BIGINT,
   guid     VARCHAR(36),
   data     LONGTEXT,
   state    VARCHAR(10),
   created_at timestamp NOT NULL DEFAULT current_timestamp(),
   updated_at timestamp NOT NULL DEFAULT current_timestamp(),
   deleted_at timestamp NULL DEFAULT NULL,
   PRIMARY KEY(id)
);



-- 20/11


alter table workout_pods
ADD COLUMN exercises_videos VARCHAR(2000)

--

ALTER TABLE workouts
ADD COLUMN waterbreak_frequency INT,
ADD COLUMN waterbreak_time INT;



CREATE TABLE pod_laps(
     id BIGINT AUTO_INCREMENT,
     workoutid BIGINT,
     created_at timestamp NOT NULL DEFAULT current_timestamp(),
     updated_at timestamp NOT NULL DEFAULT current_timestamp(),
     deleted_at timestamp NULL DEFAULT NULL,
     PRIMARY KEY(id)
);

ALTER TABLE pod_laps
    ADD COLUMN pod_number BIGINT;

ALTER TABLE workout_pods
 ADD COLUMN lap_id BIGINT;

ALTER TABLE workout_pods
DROP COLUMN laps;