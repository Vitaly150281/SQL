SELECT name, release_album  
  FROM albums
 WHERE release_album = '2018';

SELECT name, duration 
  FROM tracks
 ORDER by duration desc 
 LIMIT 1;

SELECT name 
  FROM tracks
 WHERE duration >= '03:30:00';

SELECT name 
  FROM collections
 WHERE release_coll BETWEEN '2018' AND '2020';

SELECT nickname 
  FROM artists
 WHERE nickname NOT LIKE '% %';

SELECT name 
  FROM tracks
 WHERE name LIKE '%My%' 
    OR name LIKE '%мой%';

--количество исполнителей в каждом жанре
SELECT genre_id, count(*) 
  FROM genresartists
 GROUP BY genre_id
 ORDER BY count(*) DESC;

--количество треков, вошедших в альбомы 2019-2020 годов
SELECT count(*) 
  FROM tracks t 
  JOIN albums a 
    ON t.album_id = a.id 
 WHERE release_album BETWEEN '2019' AND '2020';

--средняя продолжительность треков по каждому альбому
SELECT a.name, AVG(t.duration) 
  FROM albums a 
  JOIN tracks t 
    ON a.id = t.album_id
 GROUP BY a.id;

--все исполнители, которые не выпустили альбомы в 2020 году
SELECT nickname 
  FROM artists a 
       JOIN artistsalbums a2 
       ON a.id = a2.artist_id 
       
       JOIN albums a3 
       ON a2.album_id = a3.id      
 GROUP BY nickname, a3.release_album
HAVING a3.release_album <> '2020';

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT c.name 
  FROM collections c
       JOIN collectionstracks ct 
       ON c.id = ct.collection_id 
       
       JOIN tracks t 
       ON ct.track_id = t.id 
       
       JOIN albums a 
       ON t.album_id = a.id 
       
       JOIN artistsalbums a2 
       ON a.id = a2.album_id 
       
       JOIN artists a3 
       ON a2.artist_id = a3.id       
 WHERE a3.nickname = 'Mr. Credo'
 GROUP BY c.name;

--название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT a.name 
  FROM albums a
       JOIN artistsalbums aa 
       ON a.id = aa.album_id 
       
       JOIN artists a2 
       ON aa.artist_id  = a2.id
       
       JOIN genresartists g 
       ON a2.id = g.artist_id 
       
       JOIN musik_genres mg 
       ON g.genre_id = mg.id 
 GROUP BY a.name, a2.id
HAVING COUNT(mg.id) > 1;

--наименование треков, которые не входят в сборники
SELECT t.name 
  FROM tracks t 
       LEFT JOIN collectionstracks c 
       ON t.id = c.track_id 
 WHERE c.collection_id IS NULL;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT a.nickname 
  FROM artists a 
       JOIN artistsalbums a2 
       ON a.id = a2.artist_id 
       
       JOIN albums a3 
       ON a2.album_id = a3.id 
       
       JOIN tracks t 
       ON a3.id = t.album_id 
 WHERE t.duration = (SELECT MIN(duration) FROM tracks);

--название альбомов, содержащих наименьшее количество треков
SELECT a_name 
  FROM (SELECT a.name a_name, COUNT(t.id) t_count 
          FROM albums a 
               JOIN tracks t 
               ON a.id = t.album_id 
         GROUP BY a.name) alb
 WHERE t_count = 
       (SELECT MIN(c) 
          FROM (SELECT album_id, COUNT(album_id) c 
                  FROM tracks 
                 GROUP BY album_id) tr)
 ORDER BY a_name;





