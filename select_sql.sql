SELECT
  fid,
  name_,
  ST_Area(geom) AS area,
  ST_Perimeter(geom) AS perimeter
FROM
  town;
