INSERT INTO countries (country_id,country_name,region_id)
	VALUES ('ES','Spain',1);

INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id)
	VALUES (1, 'Pasaje los Nietos', '30397', 'Cartagena', null, 'ES');

select * from locations order by location_id;