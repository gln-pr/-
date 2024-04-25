/*количество исполнителей в каждом жанре;*/
SELECT g.name, COUNT(band_id) FROM genreband gb
LEFT JOIN genre g ON gb.genre_id = g.id
GROUP BY g.name;

/*количество треков, вошедших в альбомы 2019-2020 годов;*/
SELECT COUNT(s.id) FROM songs s
LEFT JOIN album a ON s.album_id = a.id
where a.year_of between 2019 and 2020;

/*средняя продолжительность треков по каждому альбому;*/
SELECT a.name, avg(s.duration) FROM songs s
LEFT JOIN album a ON s.album_id = a.id
group by a.id;

/*все исполнители, которые не выпустили альбомы в 2020 году;*/
  
select name from bands b2  
left join album a on a.id = ba.album_id
left join bands b on b.id = ba.band_id 
where name not in (select name from bandalbum  where release_date >= '2020.01.01' and release_date < '2021.01.01');


  

/*названия сборников, в которых присутствует конкретный исполнитель (выберите сами);*/
SELECT distinct coll.name FROM collection coll 
JOIN songcollection sc ON sc.collection_id  = coll.id 
join songs s on s.id = sc.song_id 
join album a on a.id = s.album_id 
join bandalbum ba on ba.album_id = a.id 
join bands b on b.id = ba.band_id
where b.name = 'Megadeth'
