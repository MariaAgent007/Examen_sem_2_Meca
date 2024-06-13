-- Select alleys
select name_, ST_Length(geom) as length from alleys;
select *, ST_Length(geom) as length from alleys; 
select name_, ST_Length(geom) as length from alleys where ST_Length(geom) < 1;
select ST_AsText(geom) as geometry from alleys where ST_Length(geom) < 10;
select fid, name_, ST_StartPoint(geom) as start_point, ST_EndPoint(geom) as end_point from alleys;

-- Select sanctuary
select name_, ST_Centroid(geom) as centroid from sanctuary;
select fid, name_, ST_Area(geom) as area, ST_Perimeter(geom) as perimeter, ST_Centroid(geom) as centroid from sanctuary;
select fid, name_, ST_Area(ST_Transform(geom, 3857)) as area_sq_meters,ST_AsText(ST_Centroid(geom)) as centroid from sanctuary;

--Select town
select name_, ST_Area(geom) as area, ST_Perimeter(geom) as perimeter from town;
select fid, name_, ST_Area(geom) as area, ST_Centroid(geom) as centroid from town;
select fid, name_, ST_Perimeter(geom) as perimeter, ST_Simplify(geom, 0.01) as simplified_geom from town;

--Select animal
select a.fid, a.animal_type, ST_AsText(a.geom) as location, ST_Perimeter(s.geom) as sanctuary_perimeter
from animal a join sanctuary s ON a.sanctuary_id = s.fid;
select fid, animal_type, ST_AsText(geom) as location, ST_X(geom) As longitude, ST_Y(geom) as latitude from animal;
select fid, animal_type, ST_AsText(geom) as location from animal where ST_DWithin(geom, ST_GeomFromText('POINT(30.0 -90.0)', 4326), 300);





  
  
  
  
  
  
