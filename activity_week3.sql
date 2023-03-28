CREATE DATABASE Music DEFAULT CHARACTER SET utf8mb4;

USE Music;  /*(Command line only)*/

/* Create the tables for
Artists, Albums, Genre & Track */

CREATE TABLE Artist (
  artist_id INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY(artist_id)
) ENGINE = InnoDB;

CREATE TABLE Album (
  album_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  artist_id INTEGER,

  PRIMARY KEY(album_id),
  INDEX USING BTREE (title),

  CONSTRAINT FOREIGN KEY (artist_id)
    REFERENCES Artist (artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Genre (
  genre_id INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY(genre_id)
) ENGINE = InnoDB;

CREATE TABLE Track (
  track_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  album_id INTEGER,
  genre_id INTEGER,

  PRIMARY KEY(track_id),
  INDEX USING BTREE (title),

  CONSTRAINT FOREIGN KEY (album_id) REFERENCES Album (album_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (genre_id) REFERENCES Genre (genre_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;


/* Insert items into Artists */
INSERT INTO Artist (`name`) VALUES ('Pink Floyd');
INSERT INTO Artist (`name`) VALUES ('Vashti Bunyan');
INSERT INTO Artist (`name`) VALUES ('Daniel, me estás matando');


/* Insert items into Genres */
INSERT INTO Genre (`name`) VALUES ('Progressive Rock');
INSERT INTO Genre (`name`) VALUES ('Jazz Fusion');
INSERT INTO Genre (`name`) VALUES ('Art Rock');
INSERT INTO Genre (`name`) VALUES ('Psychedelic Folk');
INSERT INTO Genre (`name`) VALUES ('Folk');
INSERT INTO Genre (`name`) VALUES ('Bolero Glam');


/* Insert items into Albums */
INSERT INTO Album (title, artist_id) VALUES ('The Dark Side of The Moon', 1);
INSERT INTO Album (title, artist_id) VALUES ('The Wall', 1);
INSERT INTO Album (title, artist_id) VALUES ('Lookaftering', 2);
INSERT INTO Album (title, artist_id) VALUES ('Just Another Diamond Day', 2);
INSERT INTO Album (title, artist_id) VALUES ('Suspiros', 3);


/* Insert items into Tracks */
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Breathe (in the air)', 1, 1);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Time', 1, 1);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Us and Them', 1, 2);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Brain Damage', 1, 1);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Mother', 2, 1);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Comfortably Numb', 2, 3);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Hey You', 2, 1);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Waiting For The Worms', 2, 1);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('If I Were', 3, 4);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Same But Different', 3, 4);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Here Before', 3, 5);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Against The Sky', 3, 5);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ("I'd Like To Walk Around In Your Mind", 4, 5);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Winter Is Blue', 4, 5);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Rainbow River', 4, 5);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Love Song', 4, 5);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Qué Casualidad Pt. 1', 5, 6);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('¿Qué Se Siente Que Me Gustes Tanto?', 5, 6);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Lo Hice, Te Dejé', 5, 6);
INSERT INTO Track (title, album_id, genre_id)
    VALUES ('Diez Pasos Hacia Ti (con Alex Ferreira)', 5, 6);


/* To see the results */

/* Albums and their artist */
SELECT Album.title, Artist.name FROM Album JOIN Artist ON
    Album.artist_id = Artist.artist_id;

/* Display artist ID & album ID */
SELECT Album.title, Album.artist_id, Artist.artist_id, Artist.name 
    FROM Album JOIN Artist ON Album.artist_id = Artist.artist_id;

/* This will display many times the genre table and 
repeat track for each genre table */
SELECT Track.title, Track.genre_id, Genre.genre_id, Genre.name 
    FROM Track JOIN Genre;

/* Tracks and their Genre */
SELECT Track.title, Genre.name FROM Track JOIN Genre ON 
    Track.genre_id = Genre.genre_id;

/* Display the complete table */
SELECT Track.title, Artist.name, Album.title, Genre.name 
    FROM Track JOIN Genre JOIN Album JOIN Artist 
    ON Track.genre_id = Genre.genre_id AND Track.album_id = 
    Album.album_id AND Album.artist_id = Artist.artist_id;