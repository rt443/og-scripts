CREATE TABLE public.fields_v3 AS
SELECT gid, country, field_name, hc_type, field_status, disc_date, prod_date, 
       abandon_date, facturl, fieldurl, ST_Transform(st_transform,4326) as geom, source_id, source_table, 
       source_vintage, depth
  FROM fields_900913;
SELECT Populate_Geometry_Columns('public.fields_v3'::regclass);


