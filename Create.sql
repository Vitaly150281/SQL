CREATE TABLE IF NOT EXISTS Musik_Genres (
    id   serial      PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
    id       SERIAL      PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresArtists (
    genre_id  INTEGER REFERENCES Musik_Genres(id),
    artist_id INTEGER REFERENCES Artists(id),
              CONSTRAINT pk PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Albums (
    id            SERIAL      PRIMARY KEY,
    name          VARCHAR(40) NOT NULL,
    release_album VARCHAR(4)  NOT NULL
);

CREATE TABLE IF NOT EXISTS ArtistsAlbums (
    artist_id INTEGER REFERENCES Artists(id),
    album_id  INTEGER REFERENCES Albums(id),
              CONSTRAINT pr PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
    id       SERIAL      PRIMARY KEY,
    name     VARCHAR(80) NOT NULL,
    duration TIME,
    album_id INTEGER     NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
    id           SERIAL      PRIMARY KEY,
    name         VARCHAR(40) NOT NULL,
    release_coll VARCHAR(4)  NOT NULL
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
    id            SERIAL  PRIMARY KEY,
    track_id      INTEGER REFERENCES Tracks(id),
    collection_id INTEGER REFERENCES Collections(id)
);

