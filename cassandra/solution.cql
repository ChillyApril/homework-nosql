-- TODO: Implementation
describe cluster;
create keyspace my_ks with replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};
create table my_ks.posts(
    user_id int,
    post_id int,
    content text,
    created_at timestamp,
    username text,
    PRIMARY KEY (user_id, created_at, post_id)
) with clustering order by (created_at desc, post_id asc);

select (post_id, content, created_at) from my_ks.posts where user_id = 1;
select (post_id, content, created_at, username) from my_ks.posts where user_id = 1 limit 1;
select (post_id, content, created_at, username) from my_ks.posts where (user_id = 1) and (created_at > '2024-01-01 00:00:00');
create table my_ks.publications (
    user_id int,
    post_id int,
    topic_id int,
    created_at timestamp,
    username text,
    PRIMARY KEY (created_at, topic_id)
);
select (user_id, username, post_id, created_at) 
from my_ks.publications 
where (EXTRACT(DATE from created_at) = '2024-01-01') and (topic_id = 1)
order by created_at desc;
