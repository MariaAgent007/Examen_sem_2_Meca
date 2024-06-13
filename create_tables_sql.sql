create extension postgis;

create table if not exists town(
fid serial primary key not null,
name_ text not null,
geom geometry ('Polygon', 4326),
zip_code varchar not null
);

create table if not exists sanctuary(
fid serial primary key not null,
name_ text not null,
geom geometry ('Polygon', 4326) not null,
email varchar (20) not null,
phone_number varchar (20),
town_id int not null,
foreign key (town_id) references town (fid)
);

create table if not exists alleys(
fid serial primary key not null,
name_ text not null,
geom geometry ('LineString', 4326),
sanctuary_id int not null,
foreign key (sanctuary_id) references sanctuary (fid)
);

create table if not exists animal(
fid serial primary key not null,
animal_type text not null,
health_condition text not null,
geom geometry ('Point', 4326),
sanctuary_id int not null,
foreign key (sanctuary_id) references sanctuary (fid)
);

create table if not exists keeper(
fid serial primary key not null,
name_ text not null,
phone_number varchar(20) not null
);

create table if not exists animal_keeper(
fid serial primary key not null,
animal_id int not null,
keeper_id int not null,
foreign key (animal_id) references animal (fid),
foreign key (keeper_id) references keeper (fid)
);






























	





