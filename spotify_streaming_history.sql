Select user_id,song_id,sum(song_plays) as song_plays
from
(Select user_id,song_id,song_plays
from songs_history
UNION
Select user_id,song_id,count(*) as song_plays
from songs_weekly
group by user_id,song_id)
as concat_table
group by user_id,song_id
order by song_plays DESC