INSERT INTO artists
VALUES
    (1, 'Shakira'),
    (2, 'Abba'),
    (3, 'Ice Cube'),
    (4, 'Eminem'),
    (5, 'Metallica'),
    (6, 'Rammstein'),
    (7, 'Mr. Credo'),
    (8, 'Dapa Deep');
    
INSERT INTO musik_genres
VALUES 
    (1, 'Pop'),
    (2, 'Chanson'),
    (3, 'Hip-Hop'),
    (4, 'Metal'),
    (5, 'House');
    
INSERT INTO albums
VALUES
    (1, 'Sale el sol', 2012),
    (2, 'Voyage', 2021),     
    (3, 'The Predator', 1992),
    (4, 'Kamikaze', 2018),     
    (5, 'Kill Em All', 2011),
    (6, 'Rammstein', 2019),
    (7, 'Чудная Долина', 2002),
    (8, 'Girl Power', 2020);
    
INSERT INTO tracks (name, duration, album_id)
VALUES 
    ('Islands', '02:43', 1),
    ('Rabiosa', '02:53', 1),
    ('Bumblebee', '03:57', 2),
    ('Dont Shut Me Down', '03:58', 2),
    ('Who Got The Camera', '04:36', 3),
    ('The Predator', '04:03', 3),
    ('Nice Guy', '02:30', 4),
    ('Venom', '04:29', 4),
    ('Metal Militia', '05:11', 5),
    ('Am I Evil', '07:50', 5),
    ('Zeig Dich', '4:15', 6),
    ('Was Ich Liebe', '4:29', 6),
    ('Первая Любовь', '03:55', 7),
    ('Медляк', '04:27', 7),
    ('Waiting For You', '03:57', 8),
    ('Let Go', '02:58', 8);
   
INSERT INTO collections (name, release_coll)
VALUES 
    ('Volume up', 2021),
    ('Назад в 90-е', 2010),
    ('Караочная!', 2019),
    ('Твой пятничный релакс', 2020),
    ('Хиты всех времён', 2015),
    ('Зажигательная дискотека', 2005),
    ('Музыка в машину', 2013),
    ('Музыка в машину - 2', 2014);

INSERT INTO genresartists (genre_id, artist_id)
VALUES (1, 1), (1, 2), (2, 7), (3, 3), (3, 4), (4, 5), (4, 6), (5, 8), (1, 7), (1, 8);

INSERT INTO artistsalbums (artist_id, album_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8);

INSERT INTO collectionstracks (track_id, collection_id)
VALUES (16, 1), (12, 1), (5, 2), (6, 2), (14, 3), (1, 3), (2, 4), (10, 4), (13, 4), (9, 5 ), (1, 5),
       (13, 6),(14, 6), (5, 6), (6, 6), (1, 7), (2, 7), (5, 7), (6, 7), (9, 8), (10, 8), (13, 8), (14, 8);



    
    
    