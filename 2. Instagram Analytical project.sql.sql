USE ig_clone;
select * from users
order by date(created_at)
limit 5;


select users.username, users.id
from users
where not exists (select* from photos where users.id = photos.user_id)
order by username;


USE ig_clone;
select *
from users
left join photos
on users.id = photos.user_id
where user_id is null;


Use ig_clone;
select users.username, photos.id,photos.image_url,count(*) as total_likes
from likes
join photos on photos.id=likes.photo_id
join users on users.id=likes.photo_id
group by photos.id
order by total_likes desc
limit 10;


select tags.tag_name, count(photo_tags.photo_id) as num_tags 
from photo_tags
inner join tags on photo_tags.tag_id=tags.id
group by tag_name
order by num_tags desc
limit 5;


USE ig_clone;
select dayname(created_at) as day, count(*) as total
from users
group by day
order by total desc;


select dayname(created_at) as day, count(*) as total
from users
group by day
order by total desc;


with cte as (
select users.id as userid, count(photos.id)as photoid
from users
left join photos on users.id=photos.user_id
group by (userid))
select sum(photoid)/count(userid) as photos_per_person
from cte
where photoid>0;


with photo_count as (
select likes.user_id, count(likes.photo_id) num_likes
from likes
group by likes.user_id
order by num_likes desc)
select *
from photo_count
where num_likes = (select count(*) from photos)


