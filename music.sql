DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO artists (name)
VALUES ('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'), ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'), ('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'), ('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO producers (name)
VALUES ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'), ('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), ('Darkchild');

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  artist_id INTEGER REFERENCES artists(id)
);

INSERT INTO albums (title, artist_id)
VALUES ('Middle of Nowhere', 1), ('A Night at the Opera', 2), ('Daydream', 3), ('A Star Is Born', 5), ('Silver Side Up', 7), ('The Blueprint 3', 8), ('Prism', 10), ('Hands All Over', 12), ('Let Go', 14), ('The Writing''s on the Wall', 15);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums(id)
);

INSERT INTO songs (title, duration_in_seconds, release_date, album_id)
VALUES ('MMMBop', 238, '04-15-1997', 1), ('Bohemian Rhapsody', 355, '10-31-1975', 2), ('One Sweet Day', 282, '11-14-1995', 3), ('Shallow', 216, '09-27-2018', 4), ('How You Remind Me', 223, '08-21-2001', 5), ('New York State of Mind', 276, '10-20-2009', 6), ('Dark Horse', 215, '12-17-2013', 7), ('Moves Like Jagger', 201, '06-21-2011', 8), ('Complicated', 244, '05-14-2002', 9), ('Say My Name', 240, '11-07-1999', 10);

CREATE TABLE song_artists
(
  song_id INTEGER REFERENCES songs(id),
  artist_id INTEGER REFERENCES artists(id),
  PRIMARY KEY (song_id, artist_id)
);

INSERT INTO song_artists (song_id, artist_id)
VALUES (1, 1), (2, 2), (3, 3), (3, 4), (4, 5), (4, 6), (5, 7), (6, 8), (6, 9), (7, 10), (7, 11), (8, 12), (8, 13), (9, 14), (10, 15);

CREATE TABLE song_producers
(
  song_id INTEGER REFERENCES songs(id),
  producer_id INTEGER REFERENCES producers(id),
  PRIMARY KEY (song_id, producer_id)
);

INSERT INTO song_producers (song_id, producer_id)
VALUES (1, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (7, 9), (8, 10), (8, 11), (9, 12), (10, 13);