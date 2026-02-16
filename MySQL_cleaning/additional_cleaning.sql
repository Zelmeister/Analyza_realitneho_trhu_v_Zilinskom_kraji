SELECT l.location_district, ROUND(AVG(p.price_m2)) AS avg_price_m2
FROM sale_prices p
JOIN offer_locations l
	ON p.offer_id = l.offer_id
JOIN offer_attributes a
	ON p.offer_id = a.offer_id
WHERE a.property_type = 'studio apartment'
	OR a.property_type = '1-room apartment'
    OR a.property_type = '2-room apartment'
    OR a.property_type = '3-room apartment'
    OR a.property_type = '4-room apartment'
    OR a.property_type = '5+ room apartment'
GROUP BY l.location_district
ORDER BY l.location_district;

SELECT l.location_district, COUNT(p.price_m2) AS count
FROM sale_prices p
JOIN offer_locations l
	ON p.offer_id = l.offer_id
JOIN offer_attributes a
	ON p.offer_id = a.offer_id
WHERE a.property_type = 'holiday apartment'
GROUP BY l.location_district
ORDER BY l.location_district;

SELECT DISTINCT property_type
FROM offer_attributes;

UPDATE sale_prices
SET price_m2 = NULL
WHERE offer_id IN (
	'Ju7QtyDiguT',
	'JufSen-CtV2',
	'JuQ6y__HQN4',
	'JuzURL47734',
	'Juhv-0ib6ND',
	'Ju-OE670leB',
	'JupJ40WhVz4',
	'JuHn9lViGyf',
	'JuFs-_Bf_af',
	'JuzJzITWl1v',
	'JulcRSD3gjg',
	'JudexsMMWLq');


UPDATE sale_prices
SET price_m2 = 90 
WHERE offer_id = 'JuqT9jZ4Nn0';

UPDATE sale_prices
SET price = NULL 
WHERE offer_id = 'JuqT9jZ4Nn0';

UPDATE offer_attributes
SET area = NULL
WHERE offer_id = 'JuqT9jZ4Nn0';


UPDATE sale_prices
SET price = NULL
WHERE offer_id IN (
	'JupACoTE9Yo',
    'JuHU9WStTAs',
	'JuTnsSFnlFI',
	'JuN4KXjUyk-',
	'JuOr71wM3AE',
	'JuaFgvo5Zms',
	'Ju6MtpU11Ir',
	'JuFG7fBeyGR',
	'JuTZyCvuUzR',
	'JupIznadChw',
	'JuXhj_2xCZd',
	'Ju_mj9AejcW',
	'JueuOSIj-04');

UPDATE sale_prices
SET price_m2 = NULL
WHERE offer_id IN (
	'JupACoTE9Yo',
    'JuHU9WStTAs',
	'JuTnsSFnlFI',
	'JuN4KXjUyk-',
	'JuOr71wM3AE',
	'JuaFgvo5Zms',
	'Ju6MtpU11Ir',
	'JuFG7fBeyGR',
	'JuTZyCvuUzR',
	'JupIznadChw',
	'JuXhj_2xCZd',
	'Ju_mj9AejcW',
	'JueuOSIj-04');

UPDATE offer_attributes
SET offer_type = 'rent'
WHERE offer_id = 'JusqNW2Fg5o';

DELETE FROM sale_prices
WHERE offer_id = 'JusqNW2Fg5o';

INSERT INTO rent_prices VALUES ('JusqNW2Fg5o', '500.00', '18.52');

DELETE FROM sale_prices
WHERE offer_id = 'JuQnZXQrlxH';

DELETE FROM offer_attributes
WHERE offer_id = 'JuQnZXQrlxH';

DELETE FROM apartment_attributes
WHERE offer_id = 'JuQnZXQrlxH';

SELECT 
    p.price_m2, 
    o.property_type, 
    l.location_district, 
    l.location_city, 
    l.location_area
FROM sale_prices p
JOIN offer_attributes o
	ON p.offer_id = o.offer_id
JOIN offer_locations l
	ON p.offer_id = l.offer_id
WHERE o.property_type LIKE '%apartment%'
	AND p.price_m2 IS NOT NULL;
    
UPDATE offer_locations
SET location_area = 'Trstená'
WHERE location_city = 'Trstená';

ALTER TABLE offer_attributes
MODIFY COLUMN area INT;

ALTER TABLE apartment_attributes
MODIFY COLUMN floor INT;

ALTER TABLE agencies
MODIFY COLUMN offer_id VARCHAR(255);

ALTER TABLE agencies
MODIFY COLUMN agency VARCHAR(255);

ALTER TABLE agencies
MODIFY COLUMN office_city VARCHAR(255);

ALTER TABLE apartment_attributes
MODIFY COLUMN offer_id VARCHAR(255);

ALTER TABLE apartment_attributes
MODIFY COLUMN position VARCHAR(255);

ALTER TABLE apartment_attributes
MODIFY COLUMN energy_certificate VARCHAR(255);

ALTER TABLE house_attributes
MODIFY COLUMN offer_id VARCHAR(255);

ALTER TABLE land_attributes
MODIFY COLUMN offer_id VARCHAR(255);

ALTER TABLE offer_attributes
MODIFY COLUMN offer_id VARCHAR(255);

ALTER TABLE offer_attributes
MODIFY COLUMN offer_type VARCHAR(255);

ALTER TABLE offer_attributes
MODIFY COLUMN property_type VARCHAR(255);

ALTER TABLE offer_attributes
MODIFY COLUMN `condition` VARCHAR(255);

ALTER TABLE offer_attributes
MODIFY COLUMN ownership VARCHAR(255);

ALTER TABLE offer_locations
MODIFY COLUMN offer_id VARCHAR(255);

ALTER TABLE offer_locations
MODIFY COLUMN location_district VARCHAR(255);

ALTER TABLE offer_locations
MODIFY COLUMN location_city VARCHAR(255);

ALTER TABLE offer_locations
MODIFY COLUMN location_area VARCHAR(255);

ALTER TABLE rent_prices
MODIFY COLUMN offer_id VARCHAR(255);

ALTER TABLE sale_prices
MODIFY COLUMN offer_id VARCHAR(255);


CREATE VIEW sale_apartments_full AS    
SELECT 
	o.offer_id,
	o.property_type, 
    o.area, 
    s.price_m2, 
    o.`condition`, 
    a.position, 
    a.floor,
    a.elevator, 
    a.built_in, 
    a.energy_certificate, 
    a.north, 
    a.south, 
    a.east, 
    a.west,
    l.location_district,
    l.location_city,
    l.location_area,
    ag.agency,
    ag.office_city
FROM offer_attributes o
JOIN apartment_attributes a
	ON o.offer_id = a.offer_id
JOIN sale_prices s
	ON o.offer_id = s.offer_id
JOIN offer_locations l
	ON o.offer_id = l.offer_id
JOIN agencies ag
	ON o.offer_id = ag.offer_id
WHERE offer_type = 'sale';


CREATE VIEW rent_apartments_full AS
SELECT 
	o.offer_id,
    o.property_type, 
    o.area, 
    r.monthly_rent_m2, 
    o.`condition`, 
    a.position, 
    a.floor,
    a.elevator, 
    a.built_in, 
    a.energy_certificate, 
    a.north, 
    a.south, 
    a.east, 
    a.west,
    l.location_district,
    l.location_city,
    l.location_area,
    ag.agency,
    ag.office_city
FROM offer_attributes o
JOIN apartment_attributes a
	ON o.offer_id = a.offer_id
JOIN rent_prices r
	ON o.offer_id = r.offer_id
JOIN offer_locations l
	ON o.offer_id = l.offer_id
JOIN agencies ag
	ON o.offer_id = ag.offer_id
WHERE offer_type = 'rent'
	AND r.monthly_rent_m2;

CREATE VIEW sale_houses_full AS 
SELECT 
	o.offer_id,
    o.property_type, 
    o.area, 
    o.`condition`,
    p.price_m2,
    a.built_in,
    a.house_area,
    ROUND(a.land_area) AS land_area,
    ROUND(a.built_up_area) AS built_up_area,
    a.terrain,
    a.energy_certificate,
    a.electricity,
    a.water,
    l.location_district,
    l.location_city,
    l.location_area,
    ag.agency,
    ag.office_city
FROM offer_attributes o
JOIN house_attributes a
	ON o.offer_id = a.offer_id
JOIN sale_prices p
	ON o.offer_id = p.offer_id
JOIN offer_locations l
	ON o.offer_id = l.offer_id
JOIN agencies ag
	ON o.offer_id = ag.offer_id;
    
CREATE VIEW rent_houses_full AS 
SELECT 
	o.offer_id,
    o.property_type, 
    o.area, 
    o.`condition`,
    r.monthly_rent_m2,
    a.built_in,
    a.house_area,
    ROUND(a.land_area) AS land_area,
    ROUND(a.built_up_area) AS built_up_area,
    a.terrain,
    a.energy_certificate,
    a.electricity,
    a.water,
    l.location_district,
    l.location_city,
    l.location_area,
    ag.agency,
    ag.office_city
FROM offer_attributes o
JOIN house_attributes a
	ON o.offer_id = a.offer_id
JOIN rent_prices r
	ON o.offer_id = r.offer_id
JOIN offer_locations l
	ON o.offer_id = l.offer_id
JOIN agencies ag
	ON o.offer_id = ag.offer_id;

CREATE VIEW sale_lands_full AS    
SELECT 
	o.offer_id,
    o.property_type, 
    o.area,
    la.terrain,
    s.price_m2,
    l.location_district,
    l.location_city,
    l.location_area,
    ag.agency,
    ag.office_city
FROM offer_attributes o
JOIN land_attributes la
	ON o.offer_id = la.offer_id
JOIN sale_prices s
	ON o.offer_id = s.offer_id
JOIN offer_locations l
	ON o.offer_id = l.offer_id
JOIN agencies ag
	ON o.offer_id = ag.offer_id;

CREATE VIEW overall_vs_district_price AS
SELECT 
	gen.property_type, 
    gen.`condition`, 
    dis.location_district, 
    gen.gen_count, 
    gen.gen_avg_price, 
    dis.dis_count, 
    dis.dis_avg_price,
    ((dis.dis_avg_price / gen.gen_avg_price) - 1) * 100 AS price_diff
FROM
	(SELECT o.property_type, o.`condition`, COUNT(o.offer_id) AS gen_count, AVG(s.price_m2) AS gen_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`
    UNION ALL
	SELECT o.property_type, "n/a" AS `condition`, COUNT(o.offer_id) AS gen_count, AVG(s.price_m2) AS gen_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	WHERE o.property_type = 'land'
	GROUP BY o.property_type) gen
JOIN
	(SELECT o.property_type, o.`condition`, l.location_district, COUNT(o.offer_id) AS dis_count, AVG(s.price_m2) AS dis_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`, l.location_district
    UNION ALL
	SELECT o.property_type, "n/a" AS `condition`, l.location_district, COUNT(o.offer_id) AS dis_count, AVG(s.price_m2) AS dis_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE o.property_type = 'land'
	GROUP BY o.property_type, l.location_district) dis
ON gen.property_type = dis.property_type
	AND gen.`condition` = dis.`condition`;
    
UPDATE sale_prices
SET price_m2 = NULL
WHERE offer_id = 'JuQ_I0ff1WB';

UPDATE offer_attributes
SET area = NULL
WHERE offer_id = 'JuQ_I0ff1WB';

UPDATE house_attributes
SET house_area  = NULL
WHERE offer_id = 'JuQ_I0ff1WB';

UPDATE house_attributes
SET built_up_area  = NULL
WHERE offer_id = 'JuQ_I0ff1WB';
    

CREATE VIEW overall_vs_area_price AS
SELECT 
	gen.property_type, 
    gen.`condition`, 
    dis.location_district,
    dis.location_area,
    gen.gen_count, 
    gen.gen_avg_price, 
    dis.area_count, 
    dis.dis_avg_price,
    ((dis.dis_avg_price / gen.gen_avg_price) - 1) * 100 AS price_diff
FROM
	(SELECT o.property_type, o.`condition`, COUNT(o.offer_id) AS gen_count, AVG(s.price_m2) AS gen_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`
    UNION ALL
	SELECT o.property_type, "n/a" AS `condition`, COUNT(o.offer_id) AS gen_count, AVG(s.price_m2) AS gen_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	WHERE o.property_type = 'land'
	GROUP BY o.property_type) gen
JOIN
	(SELECT o.property_type, o.`condition`, l.location_district, l.location_area, COUNT(o.offer_id) AS area_count, AVG(s.price_m2) AS dis_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`, l.location_district, l.location_area
    UNION ALL
	SELECT o.property_type, "n/a" AS `condition`, l.location_district, l.location_area, COUNT(o.offer_id) AS dis_count, AVG(s.price_m2) AS dis_avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE o.property_type = 'land'
	GROUP BY o.property_type, l.location_district, l.location_area) dis
ON gen.property_type = dis.property_type
	AND gen.`condition` = dis.`condition`;
    

CREATE VIEW overall_vs_district_rent AS
SELECT 
	gen.property_type, 
    gen.`condition`, 
    dis.location_district, 
    gen.gen_count, 
    gen.gen_avg_rent, 
    dis.area_count, 
    dis.dis_avg_rent,
    ((dis.dis_avg_rent / gen.gen_avg_rent) - 1) * 100 AS rent_diff
FROM
	(SELECT o.property_type, o.`condition`, COUNT(o.offer_id) AS gen_count, AVG(r.monthly_rent_m2) AS gen_avg_rent
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`) gen
JOIN
	(SELECT o.property_type, o.`condition`, l.location_district, COUNT(o.offer_id) AS area_count, AVG(r.monthly_rent_m2) AS dis_avg_rent
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`, l.location_district) dis
ON gen.property_type = dis.property_type
	AND gen.`condition` = dis.`condition`;
    
CREATE VIEW overall_vs_area_rent AS    
SELECT 
	gen.property_type, 
    gen.`condition`, 
    dis.location_district, 
    dis.location_area,
    gen.gen_count, 
    gen.gen_avg_rent, 
    dis.area_count, 
    dis.dis_avg_rent,
    ((dis.dis_avg_rent / gen.gen_avg_rent) - 1) * 100 AS rent_diff
FROM
	(SELECT o.property_type, o.`condition`, COUNT(o.offer_id) AS gen_count, AVG(r.monthly_rent_m2) AS gen_avg_rent
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`) gen
JOIN
	(SELECT o.property_type, o.`condition`, l.location_district, l.location_area, COUNT(o.offer_id) AS area_count, AVG(r.monthly_rent_m2) AS dis_avg_rent
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE o.property_type != 'land'
	GROUP BY o.property_type, o.`condition`, l.location_district, l.location_area) dis
ON gen.property_type = dis.property_type
	AND gen.`condition` = dis.`condition`;

CREATE VIEW terrain_location AS    
SELECT h.offer_id, "house" AS property_type, h.terrain, l.location_district, l.location_city, l.location_area
FROM house_attributes h
JOIN offer_locations l
	ON h.offer_id = l.offer_id
UNION ALL
SELECT p.offer_id, "land" AS property_type, p.terrain, l.location_district, l.location_city, l.location_area
FROM land_attributes p
JOIN offer_locations l
	ON p.offer_id = l.offer_id;
 
CREATE VIEW apartment_attributes_locations AS
SELECT
	a.offer_id,
    a.position,
    a.floor,
    a.total_floors,
    a.elevator,
    a.built_in,
    a.energy_certificate,
    a.north,
    a.south,
    a.east,
    a.west,
    o.offer_type,
    o.property_type,
    o.area,
    o.`condition`,
    l.location_district,
    l.location_city,
    l.location_area
FROM apartment_attributes a
JOIN offer_attributes o
	ON a.offer_id = o.offer_id
JOIN offer_locations l
	ON a.offer_id = l.offer_id;

UPDATE sale_prices
SET price = 149700.00
WHERE offer_id = 'JupXbR8DGJn';

UPDATE sale_prices
SET price_m2 = (149700.00 / 629)
WHERE offer_id = 'JupXbR8DGJn';

UPDATE sale_prices
SET price = 35000.00
WHERE offer_id = 'JuFdP62I-_O';

UPDATE sale_prices
SET price_m2 = (35000.00 / 1872)
WHERE offer_id = 'JuFdP62I-_O';

DELETE FROM sale_prices
WHERE offer_id = 'JuqAOfMLMS5';


CREATE VIEW overall_vs_agency_price AS
SELECT 
	d.property_type, 
    d.`condition`, 
    d.location_district, 
    d.dis_avg_price, 
    a.agency, 
    a.agency_avg_price,
    ((a.agency_avg_price / d.dis_avg_price) - 1) AS price_diff
FROM overall_vs_district_price d
JOIN
	(SELECT property_type, `condition`, location_district, AVG(price_m2) AS agency_avg_price, agency
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	GROUP BY property_type, `condition`, location_district, agency) a
ON d.property_type = a.property_type
	AND d.`condition` = a.`condition`
    AND d.location_district = a.location_district
LIMIT 3000;


CREATE VIEW overall_vs_agency_rent AS
SELECT 
	d.property_type, 
    d.`condition`, 
    d.location_district, 
    d.dis_avg_rent, 
    a.agency, 
    a.agency_avg_rent,
    ((a.agency_avg_rent / d.dis_avg_rent) - 1) AS rent_diff
FROM overall_vs_district_rent d
JOIN
	(SELECT o.property_type, o.`condition`, l.location_district, AVG(r.monthly_rent_m2) AS agency_avg_rent, agency
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	GROUP BY property_type, `condition`, location_district, agency) a
ON d.property_type = a.property_type
	AND d.`condition` = a.`condition`
    AND d.location_district = a.location_district
LIMIT 3000;

UPDATE offer_locations
SET location_area = 'Marček'
WHERE location_area = 'Marčk';

UPDATE offer_locations
SET location_district = 'okres Martin'
WHERE location_area = 'Priekopa'
AND location_district = 'okres Žilina';

CREATE VIEW price_to_rent_area_level AS
SELECT 
	s.location_district,
    s.location_area,
    s.property_type,
    s.`condition`,
    s.avg_price,
    r.avg_monthly_rent,
    (s.avg_price / (12 * r.avg_monthly_rent)) AS PTR
FROM
	(SELECT l.location_district, l.location_area, o.property_type, o.`condition`, AVG(s.price_m2) AS avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	GROUP BY l.location_district, l.location_area, o.property_type, o.`condition`) s
JOIN
	(SELECT l.location_district, l.location_area, o.property_type, o.`condition`, AVG(r.monthly_rent_m2) AS avg_monthly_rent
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	GROUP BY l.location_district, l.location_area, o.property_type, o.`condition`) r
ON s.location_district = r.location_district
	AND s.location_area = r.location_area
    AND s.property_type = r.property_type
    AND s.`condition` = r.`condition`;
    

CREATE VIEW price_to_rent_district_level AS    
SELECT 
	s.location_district,
    s.property_type,
    s.`condition`,
    s.avg_price,
    r.avg_monthly_rent,
    (s.avg_price / (12 * r.avg_monthly_rent)) AS PTR
FROM
	(SELECT l.location_district, o.property_type, o.`condition`, AVG(s.price_m2) AS avg_price
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	GROUP BY l.location_district, o.property_type, o.`condition`) s
JOIN
	(SELECT l.location_district, o.property_type, o.`condition`, AVG(r.monthly_rent_m2) AS avg_monthly_rent
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	GROUP BY l.location_district, o.property_type, o.`condition`) r
ON s.location_district = r.location_district
    AND s.property_type = r.property_type
    AND s.`condition` = r.`condition`;

SELECT *
FROM price_to_rent_area_level
WHERE location_area = 'Bôrik';

SELECT 
	l.location_district, 
    l.location_area, 
    a.agency, 
    COUNT(l.offer_id) AS count,
    ROW_NUMBER() OVER w AS rank_no
FROM agencies a
JOIN offer_locations l
	ON a.offer_id = l.offer_id
WHERE agency IS NOT NULL
	AND location_area IS NOT NULL
GROUP BY l.location_district, l.location_area, a.agency
WINDOW w AS (PARTITION BY l.location_district, l.location_area ORDER BY COUNT(l.offer_id) DESC)
LIMIT 5000;

SELECT DISTINCT location_city, location_area
FROM offer_locations
WHERE location_district = 'okres Čadca';

CREATE VIEW price_to_rent AS
SELECT location_district, location_area, property_type, `condition`, avg_price, avg_monthly_rent, PTR
FROM price_to_rent_area_level
UNION ALL
SELECT location_district, "all district" AS location_area, property_type, `condition`, avg_price, avg_monthly_rent, PTR
FROM price_to_rent_district_level
LIMIT 1000;

UPDATE offer_locations
SET location_area = 'U Siheľníka'
WHERE location_area = "U Sneheľníka";

SELECT *
FROM offer_locations
WHERE location_area = 'Turčiansky Jaseno';

UPDATE offer_locations
SET location_city = 'Turčianske Jaseno'
WHERE location_city = 'Turčiansky Jaseno';

UPDATE offer_locations
SET location_area = 'Turčianske Jaseno'
WHERE location_area = 'Turčiansky Jaseno';

UPDATE offer_locations
SET location_area = 'Záturčie'
WHERE location_area = 'Záturčia';

SELECT COUNT(location_area)
FROM offer_locations
WHERE location_district = 'okres Liptovský Mikuláš';

SELECT ptr.location_district, ptr.location_area, ptr.property_type, ptr.`condition`, ptr.PTR, c.latitude, c.longitude
FROM price_to_rent_area_level ptr
JOIN location_coordinates c
	ON ptr.location_district = c.location_district
		AND ptr.location_area = c.location_area
LIMIT 1000;

SELECT *
FROM location_coordinates
LIMIT 1000;

CREATE VIEW area_price_index AS
SELECT location_district, location_area, AVG(price_diff) AS area_price_index
FROM overall_vs_area_price
GROUP BY location_district, location_area;

CREATE VIEW hedonic_sale_apartments AS
SELECT
	price_m2,
	LOG(price_m2) AS ln_price_m2,
	CASE
		WHEN property_type = 'holiday apartment' THEN 1
        ELSE 0
	END AS holiday_apartment,
	CASE
		WHEN property_type = 'studio apartment' THEN 0
        WHEN property_type = '1-room apartment' THEN 1
        WHEN property_type = '2-room apartment' THEN 2
        WHEN property_type = '3-room apartment' THEN 3
        WHEN property_type = '4-room apartment' THEN 4
        WHEN property_type = '5+ room apartment' THEN 5
		ELSE 2.5 # This the average, the mean is 2 or 3, so this is neutral in respect to 2 and 3
	END AS rooms,
    area,
    LOG(area) AS ln_area, # area-price is usually nonlinear and concave → I, therefore, use logarithm instead
    CASE
		WHEN `condition` = "unrenovated" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS unrenovated,
    CASE
		WHEN `condition` = "partially renovated" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS partially_renovated,
	CASE
		WHEN `condition` = "fully renovated" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS fully_renovated,
	CASE
		WHEN `condition` = "new construction" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS new_construction,
	CASE
		WHEN `condition` = "under construction" 
			OR `condition`= "development project" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS new_project, # "under construction" and "development project" joined, because they added up to only 7.6% and 2.1% of all records
    CASE
		WHEN position = "basement"
			OR position = "ground floor"
            OR position = "raised ground floor"
				THEN 1
        ELSE 0
	END AS ground_floor,
    CASE
		WHEN position = "upper floor" THEN 1
        ELSE 0
	END AS upper_floor,
    CASE
		WHEN position = "top floor"
			OR position = "attic"
            OR position = "added floor"
				THEN 1
        ELSE 0
	END AS top_floor,
    CASE
		WHEN floor IS NULL THEN 1
        ELSE 0
	END AS missing_floor,
    CASE
		WHEN floor BETWEEN 0 AND 8 THEN floor
        WHEN floor > 8 THEN 9
        ELSE 2.8 # The average of properties that are located on floors 0-8
	END AS floor_upto_8,
    CASE
		WHEN floor > 8 THEN 1
        ELSE 0
	END AS very_high_floor,
    CASE
		WHEN elevator = 'yes' THEN 1
        ELSE 0
	END elevator,
    CASE
		WHEN built_in > 2025 THEN 0
  		WHEN built_in > 2025 THEN LOG(0 + 1)
        WHEN built_in IS NULL AND `condition` = "development project" THEN 1.05 + 1 # For missing values I am using the average age of property with particular condition
        WHEN built_in IS NULL AND `condition` = "under construction" THEN 0
        WHEN built_in IS NULL AND `condition` = "new construction" THEN 4.47
        WHEN built_in IS NULL AND `condition` = "fully renovated" THEN 42.02
        WHEN built_in IS NULL AND `condition` = "partially renovated" THEN 44.74
		WHEN built_in IS NULL AND `condition` = "unrenovated" THEN 45.01
        ELSE YEAR(CURRENT_DATE) - built_in
	END AS age,
    CASE
		WHEN built_in > 2025 THEN LOG(0 + 1)
        WHEN built_in IS NULL AND `condition` = "development project" THEN LOG(1.05 + 1) # For missing values I am using the average age of property with particular condition
        WHEN built_in IS NULL AND `condition` = "under construction" THEN LOG(0 + 1)
        WHEN built_in IS NULL AND `condition` = "new construction" THEN LOG(4.47 + 1)
        WHEN built_in IS NULL AND `condition` = "fully renovated" THEN LOG(42.02 + 1)
        WHEN built_in IS NULL AND `condition` = "partially renovated" THEN LOG(44.74 + 1)
		WHEN built_in IS NULL AND `condition` = "unrenovated" THEN LOG(45.01 + 1)
        ELSE LOG(YEAR(CURRENT_DATE) - built_in + 1)
	END AS ln_age,
	CASE 
		WHEN energy_certificate = 'A' THEN 1
        WHEN energy_certificate = 'B' THEN 2
        WHEN energy_certificate = 'C' THEN 3
        WHEN energy_certificate = 'D' THEN 4
        WHEN energy_certificate = 'E' THEN 5
        WHEN energy_certificate = 'F' THEN 6
        WHEN energy_certificate = 'G' THEN 7
		ELSE 0
	END AS energy_certificate,
    CASE
		WHEN north = "yes" THEN 1
        ELSE 0
	END AS north,
    CASE
		WHEN south = "yes" THEN 1
        ELSE 0
	END AS south,
    CASE
		WHEN east = "yes" THEN 1
        ELSE 0
	END AS east,
    CASE
		WHEN west = "yes" THEN 1
        ELSE 0
	END AS west,
    CASE
		WHEN a.location_district = "okres Bytča" THEN 1
        ELSE 0
	END AS "BY",
	CASE
		WHEN a.location_district = "okres Žilina" THEN 1
        ELSE 0
	END AS "ZA",   
    CASE
		WHEN a.location_district = "okres Kysucké Nové Mesto" THEN 1
        ELSE 0
	END AS "KM",
    CASE
		WHEN a.location_district = "okres Čadca" THEN 1
        ELSE 0
	END AS "CA",
    CASE
		WHEN a.location_district = "okres Martin" THEN 1
        ELSE 0
	END AS "MT",
    CASE
		WHEN a.location_district = "okres Turčianske Teplice" THEN 1
        ELSE 0
	END AS "TR",
    CASE
		WHEN a.location_district = "okres Dolný Kubín" THEN 1
        ELSE 0
	END AS "DK",
    CASE
		WHEN a.location_district = "okres Námestovo" THEN 1
        ELSE 0
	END AS "NO",
    CASE
		WHEN a.location_district = "okres Tvrdošín" THEN 1
        ELSE 0
	END AS "TS",
    CASE
		WHEN a.location_district = "okres Ružomberok" THEN 1
        ELSE 0
	END AS "RK",
    CASE
		WHEN a.location_district = "okres Liptovský Mikuláš" THEN 1
        ELSE 0
	END AS "LM",
    i.area_price_index
FROM sale_apartments_full a
JOIN area_price_index i
	ON a.location_district = i.location_district
		AND a.location_area = i.location_area
WHERE price_m2 IS NOT NULL
LIMIT 3000;   


SELECT *
FROM hedonic_sale_apartments
LIMIT 3000;

SELECT *
FROM sale_apartments_full
WHERE offer_id = 'JuiTYBIhgYl';

SELECT *
FROM apartment_attributes
WHERE offer_id = 'JuiTYBIhgYl';

CREATE VIEW locations_effect_on_apartments_price AS
SELECT DISTINCT
	a.location_district,
    a.location_area,
    CASE
		WHEN a.location_district = 'okres Bytča' THEN ROUND(a.index_effect + 45.9024)
        WHEN a.location_district = 'okres Žilina' THEN ROUND(a.index_effect + 348.1937)
        WHEN a.location_district = 'okres Kysucké Nové Mesto' THEN ROUND(a.index_effect + 81.7961)
        WHEN a.location_district = 'okres Čadca' THEN ROUND(a.index_effect + 151.3843)
        WHEN a.location_district = 'okres Martin' THEN ROUND(a.index_effect -30.0813)
        WHEN a.location_district = 'okres Turčianske Teplice' THEN ROUND(a.index_effect + 472.1369)
        WHEN a.location_district = 'okres Dolný Kubín' THEN ROUND(a.index_effect + 470.0865)
        WHEN a.location_district = 'okres Námestovo' THEN ROUND(a.index_effect + 185.6979)
        WHEN a.location_district = 'okres Tvrdošín' THEN ROUND(a.index_effect + 260.399)
        WHEN a.location_district = 'okres Ružomberok' THEN ROUND(a.index_effect + 133.6125)
        WHEN a.location_district = 'okres Liptovský Mikuláš' THEN ROUND(a.index_effect + 449.6457)
	END AS location_effect
FROM
	(SELECT *, area_price_index * 19.8666 AS index_effect
	FROM area_price_index) a
JOIN sale_apartments_full s
	ON a.location_district = s.location_district
		AND a.location_area = s.location_area
ORDER BY location_effect DESC;

SELECT *
FROM hedonic_sale_apartments;

CREATE VIEW hedonic_sale_houses AS
SELECT
	h.price_m2,
    h.area,
    h.house_area,
    CASE
		WHEN land_area IS NOT NULL THEN land_area
        ELSE 0
	END AS land_area,
    CASE
		WHEN `condition` = "unrenovated" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS unrenovated,
    CASE
		WHEN `condition` = "partially renovated" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS partially_renovated,
	CASE
		WHEN `condition` = "fully renovated" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS fully_renovated,
	CASE
		WHEN `condition` = "new construction" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS new_construction,
	CASE
		WHEN `condition` = "under construction" 
			OR `condition`= "development project" THEN 1
        WHEN `condition` IS NULL THEN NULL
        ELSE 0
	END AS in_development,
    CASE
		WHEN (YEAR(CURRENT_DATE) - h.built_in) < 0 THEN 0
        ELSE YEAR(CURRENT_DATE) - h.built_in 
	END AS age,
    CASE
		WHEN terrain = "flat" 
			OR terrain = "mostly flast" THEN 1
        ELSE 0
	END AS "flat",
    CASE
		WHEN terrain = "sloped"
			OR terrain = "gently sloped"
            OR terrain = "terraced" THEN 1
		ELSE 0
	END AS "sloped",
    CASE
		WHEN h.location_district = "okres Bytča" THEN 1
        ELSE 0
	END AS "BY",
	CASE
		WHEN h.location_district = "okres Žilina" THEN 1
        ELSE 0
	END AS "ZA",   
    CASE
		WHEN h.location_district = "okres Kysucké Nové Mesto" THEN 1
        ELSE 0
	END AS "KM",
    CASE
		WHEN h.location_district = "okres Čadca" THEN 1
        ELSE 0
	END AS "CA",
    CASE
		WHEN h.location_district = "okres Martin" THEN 1
        ELSE 0
	END AS "MT",
    CASE
		WHEN h.location_district = "okres Turčianske Teplice" THEN 1
        ELSE 0
	END AS "TR",
    CASE
		WHEN h.location_district = "okres Dolný Kubín" THEN 1
        ELSE 0
	END AS "DK",
    CASE
		WHEN h.location_district = "okres Námestovo" THEN 1
        ELSE 0
	END AS "NO",
    CASE
		WHEN h.location_district = "okres Tvrdošín" THEN 1
        ELSE 0
	END AS "TS",
    CASE
		WHEN h.location_district = "okres Ružomberok" THEN 1
        ELSE 0
	END AS "RK",
    CASE
		WHEN h.location_district = "okres Liptovský Mikuláš" THEN 1
        ELSE 0
	END AS "LM",
    i.area_price_index
FROM sale_houses_full h
JOIN area_price_index i
	ON h.location_district = i.location_district
		AND h.location_area = i.location_area
WHERE price_m2 IS NOT NULL
	AND `condition` IS NOT NULL
    AND area IS NOT NULL
LIMIT 3000;   

CREATE VIEW locations_effect_on_houses_price AS
SELECT DISTINCT
	a.location_district,
    a.location_area,
    CASE
		WHEN a.location_district = 'okres Bytča' THEN ROUND(a.index_effect + 241.1857)
        WHEN a.location_district = 'okres Žilina' THEN ROUND(a.index_effect + 415.0837)
        WHEN a.location_district = 'okres Kysucké Nové Mesto' THEN ROUND(a.index_effect + 328.2384)
        WHEN a.location_district = 'okres Čadca' THEN ROUND(a.index_effect + 222.1532)
        WHEN a.location_district = 'okres Martin' THEN ROUND(a.index_effect + 323.7747)
        WHEN a.location_district = 'okres Turčianske Teplice' THEN ROUND(a.index_effect + 187.3621)
        WHEN a.location_district = 'okres Dolný Kubín' THEN ROUND(a.index_effect + 426.4999)
        WHEN a.location_district = 'okres Námestovo' THEN ROUND(a.index_effect + 304.6056)
        WHEN a.location_district = 'okres Tvrdošín' THEN ROUND(a.index_effect + 279.8433)
        WHEN a.location_district = 'okres Ružomberok' THEN ROUND(a.index_effect + 358.6612)
        WHEN a.location_district = 'okres Liptovský Mikuláš' THEN ROUND(a.index_effect + 457.7634)
	END AS location_effect
FROM
	(SELECT *, area_price_index * 9.0625 AS index_effect
	FROM area_price_index) a
JOIN sale_houses_full s
	ON a.location_district = s.location_district
		AND a.location_area = s.location_area
        AND a.index_effect IS NOT NULL
ORDER BY location_effect DESC;

SELECT *
FROM locations_effect_on_houses_price;


CREATE VIEW actual_vs_predicted_house_price AS
SELECT
	ROW_NUMBER() OVER () AS house_no,
    price_m2 AS actual_price_m2,
	ROUND(	
		constant
		+ ln_house_area
        + land_area
        + `condition`
        + age
        + terrain
        + location_district
        + area_price_index, 2) AS predicted_price_m2
FROM
(SELECT
	h.price_m2,
	3545.1712 AS constant,
    -577.5589 * LOG(h.house_area) AS ln_house_area,
    CASE 
		WHEN h.land_area IS NULL THEN 0
        ELSE 0.1305 * h.land_area 
	END AS land_area,
    CASE
		WHEN h.`condition` = 'unrenovated' THEN 328.6121
		WHEN h.`condition` = 'partially renovated' THEN 443.186
        WHEN h.`condition` = 'fully renovated' THEN 860.1252
        WHEN h.`condition` = 'new construction' THEN 1053.1995
        WHEN h.`condition` = 'under construction' THEN 860.0485
        WHEN h.`condition` = 'development project' THEN 860.0485
	END AS `condition`,
    CASE
		WHEN YEAR(CURRENT_TIMESTAMP()) - h.built_in < 0 THEN 0
        ELSE -3.4978 * (YEAR(CURRENT_TIMESTAMP()) - h.built_in)
	END AS age,
    CASE
		WHEN h.terrain = 'flat' THEN 43.6099
		WHEN h.terrain = 'mostly flat' THEN 43.6099
        WHEN h.terrain = 'gently sloped' THEN -177.9035
		WHEN h.terrain = 'sloped' THEN -177.9035
        WHEN h.terrain = 'terraced' THEN -177.9035
        ELSE 0
	END AS terrain,
    CASE
		WHEN h.location_district = 'okres Bytča' THEN 241.1857
        WHEN h.location_district = 'okres Žilina' THEN 415.0837
        WHEN h.location_district = 'okres Kysucké Nové Mesto' THEN 328.2384
        WHEN h.location_district = 'okres Čadca' THEN 222.1532
        WHEN h.location_district = 'okres Martin' THEN 323.7747
        WHEN h.location_district = 'okres Turčianske Teplice' THEN 187.3621
        WHEN h.location_district = 'okres Dolný Kubín' THEN 426.4999
        WHEN h.location_district = 'okres Námestovo' THEN 304.6056
        WHEN h.location_district = 'okres Tvrdošín' THEN 279.8433
        WHEN h.location_district = 'okres Ružomberok' THEN 358.6612
        WHEN h.location_district = 'okres Liptovský Mikuláš' THEN 457.7634
	END location_district,
    9.0625 * i.area_price_index AS area_price_index
FROM sale_houses_full h
JOIN area_price_index i
	ON h.location_district = i.location_district
		AND h.location_area = i.location_area
WHERE h.price_m2 IS NOT NULL) x;


CREATE VIEW hedonic_sale_lands AS
SELECT
	l.price_m2,
    l.area,
    LOG(l.area) AS ln_area,
    CASE
		WHEN l.terrain = 'flat'
			OR l.terrain = 'mostly flat'
				THEN 1
		ELSE 0
	END AS flat,
    CASE
		WHEN l.terrain = 'sloped'
			OR l.terrain = 'gently sloped'
				THEN 1
		ELSE 0
	END AS sloped,
	    CASE
		WHEN l.location_district = "okres Bytča" THEN 1
        ELSE 0
	END AS "BY",
	CASE
		WHEN l.location_district = "okres Žilina" THEN 1
        ELSE 0
	END AS "ZA",   
    CASE
		WHEN l.location_district = "okres Kysucké Nové Mesto" THEN 1
        ELSE 0
	END AS "KM",
    CASE
		WHEN l.location_district = "okres Čadca" THEN 1
        ELSE 0
	END AS "CA",
    CASE
		WHEN l.location_district = "okres Martin" THEN 1
        ELSE 0
	END AS "MT",
    CASE
		WHEN l.location_district = "okres Turčianske Teplice" THEN 1
        ELSE 0
	END AS "TR",
    CASE
		WHEN l.location_district = "okres Dolný Kubín" THEN 1
        ELSE 0
	END AS "DK",
    CASE
		WHEN l.location_district = "okres Námestovo" THEN 1
        ELSE 0
	END AS "NO",
    CASE
		WHEN l.location_district = "okres Tvrdošín" THEN 1
        ELSE 0
	END AS "TS",
    CASE
		WHEN l.location_district = "okres Ružomberok" THEN 1
        ELSE 0
	END AS "RK",
    CASE
		WHEN l.location_district = "okres Liptovský Mikuláš" THEN 1
        ELSE 0
	END AS "LM",
    i.area_price_index
FROM sale_lands_full l
JOIN area_price_index i 
	ON l.location_district = i.location_district
		AND l.location_area = i.location_area
WHERE l.price_m2 IS NOT NULL
	AND l.area IS NOT NULL;


CREATE VIEW house_and_land_worth AS
SELECT
	x.`condition`,
    AVG(x.land_price_m2) AS avg_land_worth_m2,
    AVG(x.house_worth_m2) AS avg_house_worth_m2,
    AVG(x.land_worth_percent) AS avg_land_worth_percent,
    AVG(x.house_worth_percent) AS avg_house_worth_percent
FROM
(SELECT 
	l.price_m2 AS land_price_m2, 
    l.area AS land_area_m2, 
    h.price_m2 AS house_price_m2,
	h.house_area, 
    h.land_area AS house_land_area,
    l.terrain, 
    h.`condition`,
    l.location_district, 
    l.location_area,
    h.price_m2 - l.price_m2 AS house_worth_m2,
    l.price_m2 / h.price_m2 AS land_worth_percent, 
    (h.price_m2 - l.price_m2) / h.price_m2 AS house_worth_percent 
FROM sale_lands_full l
JOIN sale_houses_full h
	ON l.location_district = h.location_district
		AND l.location_area = h.location_area
        AND l.terrain = h.terrain
        AND l.area >= 0.9 * h.land_area # I am comparing land plots of similar size 
        AND l.area <= 1.1 * h.land_area # Land without house has to be at most 10% bigger/smaller than its counterpart with a house
WHERE
	l.price_m2 IS NOT NULL
    AND h.price_m2 IS NOT NULL
    AND l.price_m2 > 1
    AND h.price_m2 > 1
    AND h.house_area < 100000) x
GROUP BY x.`condition`;

CREATE VIEW locations_effect_on_land_price AS
SELECT DISTINCT
	i.location_district,
    i.location_area,
    CASE
		WHEN i.location_district = 'okres Bytča' THEN 1.0739 * i.area_price_index + 28.9906
        WHEN i.location_district = 'okres Žilina' THEN 1.0739 * i.area_price_index + 53.4107
        WHEN i.location_district = 'okres Kysucké Nové Mesto' THEN 1.0739 * i.area_price_index -1.1617
        WHEN i.location_district = 'okres Čadca' THEN 1.0739 * i.area_price_index + 10.5287
        WHEN i.location_district = 'okres Martin' THEN 1.0739 * i.area_price_index + 34.4078
        WHEN i.location_district = 'okres Turčianske Teplice' THEN 1.0739 * i.area_price_index + 12.2042
        WHEN i.location_district = 'okres Dolný Kubín' THEN 1.0739 * i.area_price_index + 23.2494
        WHEN i.location_district = 'okres Námestovo' THEN 1.0739 * i.area_price_index + 29.6261
        WHEN i.location_district = 'okres Tvrdošín' THEN 1.0739 * i.area_price_index + 28.6401
        WHEN i.location_district = 'okres Ružomberok' THEN 1.0739 * i.area_price_index + 20.0841
        WHEN i.location_district = 'okres Liptovský Mikuláš' THEN 1.0739 * i.area_price_index + 25.8603
	END AS location_effect
FROM area_price_index i
JOIN sale_lands_full l
	ON i.location_district = l.location_district
		AND i.location_area = l.location_area
        AND i.area_price_index IS NOT NULL;
        
SELECT *
FROM locations_effect_on_land_price;

CREATE VIEW area_rent_index AS
SELECT location_district, location_area, AVG(rent_diff) AS area_rent_index
FROM overall_vs_area_rent
GROUP BY location_district, location_area;

CREATE VIEW hedonic_rent_apartments AS
SELECT 
	monthly_rent_m2,
	CASE
		WHEN property_type = "studio apartment" THEN 0
        WHEN property_type = "1-room apartment" THEN 1
        WHEN property_type = "2-room apartment" THEN 2
        WHEN property_type = "3-room apartment" THEN 3
        WHEN property_type = "4-room apartment" THEN 4
	END AS rooms,
    area,
    LOG(area) AS ln_area,
    CASE
		WHEN `condition` = "unrenovated" THEN 1
        ELSE 0
	END AS unrenovated,
    CASE
		WHEN `condition` = "partially renovated" THEN 1
        ELSE 0
	END AS partially_renovated,
    CASE
		WHEN `condition` = "fully renovated" THEN 1
        ELSE 0
	END AS fully_renovated,
    CASE
		WHEN `condition` = "new construction"
			OR `condition` = "development project"
				THEN 1
		ELSE 0
	END AS new_construction,
    CASE
		WHEN position = "basement"
			OR position = "ground floor"
            OR position = "raised ground floor"
				THEN 1
		ELSE 0
	END AS ground_floor,
    CASE
		WHEN position = "upper floor" THEN 1
        ELSE 0
	END AS upper_floor,
    CASE
		WHEN position = "added floor"
			OR position = "attic"
            OR position = "top floor"
				THEN 1
		ELSE 0
	END AS top_floor,
    CASE
		WHEN floor IS NULL
			AND position IN ('basement', 'ground floor', 'raised ground floor') THEN 1
		WHEN floor IS NULL
			AND position IN ('added floor', 'attic', 'top floor') THEN 4.1778 -- The average of top floors
		WHEN floor IS NULL
			AND position = 'upper floor' THEN 3.4104 -- The average of upper floors
		WHEN floor IS NULL
			AND position IS NULL
            AND `condition` = 'unrenovated' THEN 3.3636 -- The average of unrenovated
		WHEN floor IS NULL
			AND position IS NULL
            AND `condition` = 'partially renovated' THEN 3.0541 -- The average of partially renovated
		WHEN floor IS NULL
			AND position IS NULL
            AND `condition` = 'fully renovated' THEN 2.9063 -- The average of fully renovated
		WHEN floor IS NULL
			AND position IS NULL
            AND `condition` = 'new construction' THEN 2.7612 -- The average of new construction
		WHEN floor IS NULL
			AND position IS NULL
            AND `condition` = 'development project' THEN 4.0000
		ELSE floor
	END AS floor,
    CASE
		WHEN elevator = 'yes' THEN 1
        ELSE 0
	END AS elevator,
    CASE
		WHEN a.location_district = 'okres Bytča' THEN 1
        ELSE 0
	END AS `BY`,
    CASE
		WHEN a.location_district = 'okres Žilina' THEN 1
        ELSE 0
	END AS ZA,
    CASE
		WHEN a.location_district = 'okres Kysucké Nové Mesto' THEN 1
        ELSE 0
	END AS KM,
    CASE
		WHEN a.location_district = 'okres Čadca' THEN 1
        ELSE 0
	END AS CA,
    CASE
		WHEN a.location_district = 'okres Martin' THEN 1
        ELSE 0
	END AS MT,
    CASE
		WHEN a.location_district = 'okres Turčianske Teplice' THEN 1
        ELSE 0
	END AS TR,
    CASE
		WHEN a.location_district = 'okres Dolný Kubín' THEN 1
        ELSE 0
	END AS DK,
    CASE
		WHEN a.location_district = 'okres Námestovo' THEN 1
        ELSE 0
	END AS `NO`,
    CASE
		WHEN a.location_district = 'okres Tvrdošín' THEN 1
        ELSE 0
	END AS TS,
    CASE
		WHEN a.location_district = 'okres Ružomberok' THEN 1
        ELSE 0
	END AS RK,
    CASE
		WHEN a.location_district = 'okres Liptovský Mikuláš' THEN 1
        ELSE 0
	END AS LM,
    i.area_rent_index
FROM rent_apartments_full a
JOIN area_rent_index i
	ON a.location_district = i.location_district
		AND a.location_area = i.location_area
        AND i.location_area IS NOT NULL
WHERE monthly_rent_m2 IS NOT NULL
	AND property_type IN ("studio apartment", "1-room apartment", "2-room apartment", "3-room apartment", "4-room apartment");

CREATE VIEW locations_effect_on_apartments_rent AS
SELECT DISTINCT
	i.location_district,
    i.location_area,
    CASE
		WHEN i.location_district = 'okres Bytča' THEN 0.0802 * i.area_rent_index + 0.5278
        WHEN i.location_district = 'okres Žilina' THEN 0.0802 * i.area_rent_index + 1.3551
        WHEN i.location_district = 'okres Kysucké Nové Mesto' THEN 0.0802 * i.area_rent_index + 0.6528
        WHEN i.location_district = 'okres Čadca' THEN 0.0802 * i.area_rent_index + 0.3427
        WHEN i.location_district = 'okres Martin' THEN 0.0802 * i.area_rent_index + 0.7494
        WHEN i.location_district = 'okres Turčianske Teplice' THEN 0.0802 * i.area_rent_index + 4.9049
        WHEN i.location_district = 'okres Dolný Kubín' THEN 0.0802 * i.area_rent_index + 1.1136
        WHEN i.location_district = 'okres Námestovo' THEN 0.0802 * i.area_rent_index + 1.1136
        WHEN i.location_district = 'okres Ružomberok' THEN 0.0802 * i.area_rent_index + 0.0842
        WHEN i.location_district = 'okres Liptovský Mikuláš' THEN 0.0802 * i.area_rent_index + 1.0603
	END AS location_effect
FROM rent_apartments_full a
JOIN area_rent_index i
	ON a.location_district = i.location_district
		AND a.location_area = i.location_area
        AND i.location_area IS NOT NULL
WHERE monthly_rent_m2 IS NOT NULL
	AND property_type IN ("studio apartment", "1-room apartment", "2-room apartment", "3-room apartment", "4-room apartment");

SELECT *
FROM overall_vs_agency_price
WHERE agency_avg_price IS NOT NULL
	AND agency IS NOT NULL;
    

CREATE VIEW agencies_by_total_offers_count AS
SELECT agency, COUNT(offer_id) AS offers_count, COUNT(offer_id) / 3873 AS market_share
FROM agencies
GROUP BY agency;


CREATE VIEW agencies_by_offer_locations AS
SELECT a.offer_id, a.agency, a.office_city, l.location_district, l.location_city, l.location_area
FROM agencies a
JOIN offer_locations l
	ON a.offer_id = l.offer_id;

SELECT *
FROM agencies_by_total_offers_count;

SELECT *
FROM agencies_by_offer_locations;

SELECT *
FROM overall_vs_agency_price
GROUP BY agency;

CREATE VIEW agencies_by_offer_attributes AS
SELECT o.offer_id, o.offer_type, o.property_type, o.area, o.`condition`, a.agency, a.office_city
FROM offer_attributes o
JOIN agencies a
	ON o.offer_id = a.offer_id;
  
CREATE VIEW agency_price_index_area_level AS
SELECT 
	a.offer_id, 
    a.price_m2, 
    a.property_type, 
    a.`condition`, 
    a.location_district, 
    a.location_area, 
    a.agency,
    ROUND((a.price_m2 - ag.avg_price_m2) / ag.avg_price_m2, 4) AS price_index
FROM sale_apartments_full a
JOIN
	(SELECT AVG(price_m2) AS avg_price_m2, COUNT(offer_id) AS offer_count, property_type, `condition`, location_district, location_area
	FROM sale_apartments_full
	WHERE price_m2 IS NOT NULL
	GROUP BY property_type, `condition`, location_district, location_area) ag
    ON a.property_type = ag.property_type
		AND a.`condition` = ag.`condition`
        AND a.location_district = ag.location_district
        AND a.location_area = ag.location_area
WHERE a.price_m2 IS NOT NULL
	AND ag.offer_count > 1 -- To make sure that I'm not basing the price index on a single offer and comparing the offer to itself
UNION ALL
SELECT 
	h.offer_id, 
    h.price_m2, 
    h.property_type, 
    h.`condition`, 
    h.location_district, 
    h.location_area, 
    h.agency,
    ROUND((h.price_m2 - hg.avg_price_m2) / hg.avg_price_m2, 4) AS price_index
FROM sale_houses_full h
JOIN
	(SELECT AVG(price_m2) AS avg_price_m2, COUNT(offer_id) AS offer_count, property_type, `condition`, location_district, location_area
	FROM sale_houses_full
	WHERE price_m2 IS NOT NULL
	GROUP BY property_type, `condition`, location_district, location_area) hg
    ON h.property_type = hg.property_type
		AND h.`condition` = hg.`condition`
        AND h.location_district = hg.location_district
        AND h.location_area = hg.location_area
WHERE h.price_m2 IS NOT NULL
	AND hg.offer_count > 1 -- To make sure that I'm not basing the price index on a single offer and comparing the offer to itself
UNION ALL
SELECT
	l.offer_id,
    l.price_m2,
    l.property_type,
    NULL AS `condition`,
    l.location_district,
    l.location_area,
    l.agency,
    ROUND((l.price_m2 - lg.avg_price_m2) / lg.avg_price_m2, 4) AS price_index
FROM
	sale_lands_full l
JOIN
	(SELECT AVG(price_m2) AS avg_price_m2, COUNT(offer_id) AS offer_count, property_type, location_district, location_area 
	FROM sale_lands_full
	WHERE price_m2 IS NOT NULL
	GROUP BY property_type, location_district, location_area) lg
    ON l.property_type = lg.property_type
		AND l.location_district = lg.location_district
        AND l.location_area = lg.location_area
WHERE l.price_m2 IS NOT NULL
	AND lg.offer_count > 1; -- To make sure that I'm not basing the price index on a single offer and comparing the offer to itself
    
SELECT agency, AVG(price_index) * 100
FROM agency_price_index_area_level
GROUP BY agency;


CREATE VIEW PTR_one_to_one AS
SELECT
	sale.offer_id AS sale_offer_id,
    rent.offer_id AS rent_offer_id,
	sale.location_district,
    sale.location_area,
    sale.property_type,
    sale.`condition`,
    sale.price_m2,
    rent.monthly_rent_m2,
    sale.price_m2 / (12 * rent.monthly_rent_m2) AS PTR
FROM
	(SELECT 
		o.offer_id,
		l.location_district, 
        l.location_area, 
        o.property_type, 
		o.`condition`,
        s.price_m2
	FROM offer_attributes o
	JOIN sale_prices s
		ON o.offer_id = s.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE s.price_m2 IS NOT NULL
		AND o.property_type != 'land') sale
JOIN
	(SELECT o.offer_id, l.location_district, l.location_area, o.property_type, o.`condition`, r.monthly_rent_m2
	FROM offer_attributes o
	JOIN rent_prices r
		ON o.offer_id = r.offer_id
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	WHERE r.monthly_rent_m2 IS NOT NULL) rent
ON sale.location_district = rent.location_district
	AND sale.location_area = rent.location_area
    AND sale.property_type = rent.property_type
    AND sale.`condition` = rent.`condition`;
 
CREATE VIEW PTR_min_avg_max AS
SELECT 
	location_district, 
    location_area, 
    property_type, 
    `condition`, 
    MIN(PTR) AS min_ptr, 
    AVG(PTR) AS avg_ptr, 
    MAX(PTR) AS max_ptr
FROM PTR_one_to_one ptr
GROUP BY location_district, location_area, property_type, `condition`;

CREATE VIEW ptr_min_avg_max_combination_count AS
SELECT
	ptr.location_district,
    ptr.location_area,
    ptr.property_type,
    ptr.`condition`,
    rc.rent_count,
    sc.sale_count,
    rc.rent_count / (rc.rent_count + sc.sale_count) AS rent_share,
    ptr.min_ptr,
    ptr.avg_ptr,
    ptr.max_ptr
FROM PTR_min_avg_max ptr
JOIN
	(SELECT
		r.location_district,
		r.location_area,
		r.property_type,
		r.`condition`,
		COUNT(offer_id) AS rent_count
	FROM
	(SELECT o.offer_id, l.location_district, l.location_area, o.property_type, o.`condition`, r.monthly_rent_m2
	FROM offer_attributes o
		JOIN rent_prices r
			ON o.offer_id = r.offer_id
		JOIN offer_locations l
			ON o.offer_id = l.offer_id) r
	GROUP BY
		r.location_district,
		r.location_area,
		r.property_type,
		r.`condition`) rc
	ON ptr.location_district = rc.location_district
		AND ptr.location_area = rc.location_area
		AND ptr.property_type = rc.property_type
		AND ptr.`condition` = rc.`condition`
JOIN
	(SELECT
		s.location_district,
		s.location_area,
		s.property_type,
		s.`condition`,
		COUNT(s.offer_id) AS sale_count
	FROM
	(SELECT o.offer_id, l.location_district, l.location_area, o.property_type, o.`condition`, s.price_m2
	FROM offer_attributes o
		JOIN sale_prices s
			ON o.offer_id = s.offer_id
		JOIN offer_locations l
			ON o.offer_id = l.offer_id) s
	GROUP BY
		s.location_district,
		s.location_area,
		s.property_type,
		s.`condition`) sc
	ON ptr.location_district = sc.location_district
		AND ptr.location_area = sc.location_area
		AND ptr.property_type = sc.property_type
		AND ptr.`condition` = sc.`condition`;

CREATE VIEW ptr_min_avg_max_area_count AS
SELECT
	ptr.location_district,
    ptr.location_area,
    ptr.property_type,
    ptr.`condition`,
    rc.rent_count,
    sc.sale_count,
    rc.rent_count / (rc.rent_count + sc.sale_count) AS rent_share,
    ptr.min_ptr,
    ptr.avg_ptr,
    ptr.max_ptr
FROM PTR_min_avg_max ptr
JOIN
	(SELECT
		r.location_district,
		r.location_area,
		COUNT(offer_id) AS rent_count
	FROM
	(SELECT o.offer_id, l.location_district, l.location_area, r.monthly_rent_m2
	FROM offer_attributes o
		JOIN rent_prices r
			ON o.offer_id = r.offer_id
		JOIN offer_locations l
			ON o.offer_id = l.offer_id) r
	GROUP BY
		r.location_district,
		r.location_area) rc
	ON ptr.location_district = rc.location_district
		AND ptr.location_area = rc.location_area
JOIN
	(SELECT
		s.location_district,
		s.location_area,
		COUNT(s.offer_id) AS sale_count
	FROM
	(SELECT o.offer_id, l.location_district, l.location_area, s.price_m2
	FROM offer_attributes o
		JOIN sale_prices s
			ON o.offer_id = s.offer_id
		JOIN offer_locations l
			ON o.offer_id = l.offer_id) s
	GROUP BY
		s.location_district,
		s.location_area) sc
	ON ptr.location_district = sc.location_district
		AND ptr.location_area = sc.location_area;

CREATE VIEW ptr_complex AS
SELECT ptr.*, p15.max_price_for_ptr_15, max_price_for_ptr_20
FROM ptr_min_avg_max_area_count ptr
LEFT JOIN
	(SELECT location_district, location_area, property_type, `condition`, MAX(price_m2) AS max_price_for_ptr_15
	FROM PTR_one_to_one
	WHERE PTR < 15
	GROUP BY location_district, location_area, property_type, `condition`) p15
ON ptr.location_district = p15.location_district
	AND ptr.location_area = p15.location_area
    AND ptr.property_type = p15.property_type
    AND ptr.`condition` = p15.`condition`
LEFT JOIN
	(SELECT location_district, location_area, property_type, `condition`, MAX(price_m2) AS max_price_for_ptr_20
	FROM PTR_one_to_one
	WHERE PTR < 20
	GROUP BY location_district, location_area, property_type, `condition`) p20
ON ptr.location_district = p20.location_district
	AND ptr.location_area = p20.location_area
    AND ptr.property_type = p20.property_type
    AND ptr.`condition` = p20.`condition`;

CREATE VIEW land_house_price_ratio AS
SELECT 
	house_condition, 
    AVG(land_price) / AVG(house_price) AS land_price_percent, 
    (AVG(house_price) - AVG(land_price)) / AVG(house_price) AS house_price_percent
FROM
(SELECT
	h.house_area AS house_area,
    h.land_area AS h_land_area,
    l.area AS l_land_area,
    h.`condition` AS house_condition,
    h.price_m2 AS h_price_m2,
    l.price_m2 AS l_price_m2,
    h.price_m2 * h.area AS house_price,
    l.price_m2 * l.area AS land_price,
    h.location_district,
    h.location_area
FROM sale_houses_full h
JOIN sale_lands_full l
	ON h.location_district = l.location_district
		AND h.location_area = l.location_area
        AND (h.land_area BETWEEN (0.9 * l.area) AND (1.1 * l.area))
WHERE h.house_area != h.land_area
	AND h.price_m2 IS NOT NULL
    AND l.price_m2 IS NOT NULL) x
GROUP BY x.house_condition;

SELECT o.property_type, l.location_district, AVG(r.monthly_rent_m2) as avg_rent
FROM offer_attributes o
JOIN rent_prices r
	ON o.offer_id = r.offer_id
JOIN offer_locations l
	ON o.offer_id = l.offer_id
WHERE r.monthly_rent_m2 IS NOT NULL
GROUP BY o.property_type, l.location_district;


# Portfiolo share by district
SELECT x.location_district, ROUND((x.count / y.offers_sum * 100), 2) AS percentage
FROM
	(SELECT location_district, COUNT(location_district) AS count
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE a.agency = 'TUreality s.r.o.'
	GROUP BY location_district) x
JOIN
	(SELECT COUNT(location_district) AS offers_sum
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE a.agency = 'TUreality s.r.o.') y;
    
# Portolio share by city (in a specific district)
SELECT x.location_city, ROUND((x.count / y.offers_sum * 100), 2) AS percentage
FROM
	(SELECT location_city, COUNT(location_city) AS count
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE a.agency = 'TUreality s.r.o.'
		AND l.location_district = 'okres Liptovský Mikuláš'
	GROUP BY location_city) x
JOIN
	(SELECT COUNT(location_city) AS offers_sum
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE a.agency = 'TUreality s.r.o.'
		AND l.location_district = 'okres Liptovský Mikuláš') y;

# Portfolio share by area (in a specific district)
SELECT x.location_area, ROUND((x.count / y.offers_sum * 100), 2) AS percentage
FROM
	(SELECT location_area, COUNT(location_area) AS count
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE a.agency = 'TUreality s.r.o.'
		AND l.location_district = 'okres Liptovský Mikuláš'
	GROUP BY location_area) x
JOIN
	(SELECT COUNT(location_area) AS offers_sum
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE a.agency = 'TUreality s.r.o.'
		AND l.location_district = 'okres Liptovský Mikuláš') y;

# Share of offers in each city of a district
SELECT x.location_city, ROUND((x.count / y.offers_sum * 100), 2) AS percentage
FROM
	(SELECT location_city, COUNT(location_district) AS count
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE l.location_district = 'okres Liptovský Mikuláš'
	GROUP BY location_city) x
JOIN
	(SELECT COUNT(location_city) AS offers_sum
	FROM offer_attributes o
	JOIN offer_locations l
		ON o.offer_id = l.offer_id
	JOIN agencies a
		ON o.offer_id = a.offer_id
	WHERE l.location_district = 'okres Liptovský Mikuláš') y;

SELECT * FROM agencies WHERE agency LIKE '%TUreality%';

CREATE VIEW offers_per_agency_by_district AS
SELECT ac.location_district, oc.offer_count / ac.agency_count AS offers_per_agency
FROM
	(SELECT l.location_district, COUNT(DISTINCT agency) AS agency_count
	FROM agencies a
	JOIN offer_locations l
		ON a.offer_id = l.offer_id
	WHERE a.agency IS NOT NULL
	GROUP BY l.location_district) ac
JOIN
	(SELECT location_district, COUNT(location_district) AS offer_count
	FROM offer_locations
	GROUP BY location_district) oc
	ON ac.location_district = oc.location_district;
    
 
CREATE VIEW agencies_market_share_by_district AS
SELECT
	q.location_district,
    q.agency,
    q.agency_rank,
    q.offer_count,
    q.total_offers,
    q.market_share,
    SUM(q.market_share) OVER (PARTITION BY q.location_district ORDER BY q.agency_rank) AS cum_market_share
FROM   
	(SELECT
		z.location_district,
		z.agency,
		z.agency_rank,
		z.offer_count,
		z.total_offers,
		(z.offer_count / z.total_offers) AS market_share
	FROM
		(SELECT
			x.location_district,
			x.agency,
			ROW_NUMBER() OVER(PARTITION BY x.location_district ORDER BY x.offer_count DESC) AS agency_rank,
			x.offer_count,
			y.total_offers
		FROM
			(SELECT
				a.agency,
				l.location_district,
				COUNT(a.agency) AS offer_count
			FROM agencies a
			JOIN offer_locations l
				ON a.offer_id = l.offer_id
					AND a.agency IS NOT NULL
			GROUP BY a.agency, l.location_district
			ORDER BY l.location_district, offer_count DESC) x
		JOIN
			(SELECT
				l.location_district,
				COUNT(l.location_district) AS total_offers
			FROM agencies a
			JOIN offer_locations l
				ON a.offer_id = l.offer_id
					AND a.agency IS NOT NULL
			GROUP BY l.location_district) y
			ON x.location_district = y.location_district) z) q
;

CREATE VIEW market_competition_rating AS
SELECT
	b.location_district,
    b.offers_per_agency,
    b.cr5,
    b.competition_rating,
    CASE
		WHEN b.competition_rating >= 80 THEN "great"
        WHEN b.competition_rating < 80 AND b.competition_rating >= 60 THEN "ok"
        WHEN b.competition_rating < 60 AND b.competition_rating >= 40 THEN "risky"
        WHEN b.competition_rating < 40 THEN "avoid"
	END AS market_category
FROM
	(SELECT
		o.location_district,
		o.offers_per_agency,
		a.cr5,
		ROUND(
			(50 * ((offers_per_agency - 2.4375) / (9.2301 - 2.4375))) # offers_per_agency rating
			+ (50 * ((0.7125 - cr5) / (0.7125 - 0.2887))) # cr5 rating
			) AS competition_rating
	FROM offers_per_agency_by_district o
	JOIN
		(SELECT location_district, cum_market_share AS cr5
		FROM agencies_market_share_by_district
		WHERE agency_rank = 5) a
		ON o.location_district = a.location_district) b
;


SELECT a.agency, a.office_city, COUNT(a.agency)
FROM agencies a
JOIN offer_attributes o
	ON a.offer_id = o.offer_id
GROUP BY a.agency, a.office_city;

SELECT
	c.property_type,
    (c.count / s.sum) * 100 AS `share`
FROM
	(SELECT property_type, COUNT(property_type) AS count
	FROM offer_attributes
	WHERE (property_type LIKE '%room apartment%'
		OR property_type = 'studio apartment')
        AND offer_type = 'rent'
	GROUP BY property_type) c
JOIN
	(SELECT COUNT(property_type) AS sum
	FROM offer_attributes
	WHERE (property_type LIKE '%room apartment%'
		OR property_type = 'studio apartment')
        AND offer_type = 'rent') s
;

SELECT 
o.`condition`, 
l.location_district, 
COUNT(o.`condition`) / SUM(COUNT(o.`condition`)) OVER(PARTITION BY l.location_district) AS `share`
FROM offer_attributes o
JOIN offer_locations l
	ON o.offer_id = l.offer_id
WHERE o.`condition` IS NOT NULL
GROUP BY o.`condition`, l.location_district;

SELECT l.location_area, COUNT(l.location_area)
FROM agencies a
JOIN offer_locations l
	ON a.offer_id = l.offer_id
WHERE agency = 'TUreality s.r.o.'
GROUP BY l.location_area;

SELECT o.property_type, o.`condition`, l.location_area, COUNT(l.location_area)
FROM agencies a
JOIN offer_locations l
	ON a.offer_id = l.offer_id
JOIN offer_attributes o
	ON a.offer_id = o.offer_id
WHERE agency = 'TUreality s.r.o.'
GROUP BY o.property_type, o.`condition`, l.location_area;

SELECT o.offer_type, COUNT(o.offer_type)
FROM offer_attributes o
JOIN offer_locations l
	ON o.offer_id = l.offer_id
WHERE l.location_district = 'okres Námestovo'
GROUP BY o.offer_type;

# Apartment type distribution across the Žilina Region
CREATE VIEW apartment_type_share_region AS
SELECT
	x.property_type,
    ROUND((x.count / y.sum) * 100) AS `share`
FROM
	(SELECT property_type, COUNT(property_type) AS count
	FROM offer_attributes
	WHERE property_type LIKE '%room apartment%'
		OR property_type = 'studio apartment'
	GROUP BY property_type) x
JOIN
	(SELECT COUNT(property_type) AS sum
	FROM offer_attributes
	WHERE property_type LIKE '%room apartment%'
		OR property_type = 'studio apartment') y
;

# Condition distribution across the Žilina Region
CREATE VIEW	condition_share_region AS
SELECT
	x.`condition`,
    ROUND((x.count / y.sum) * 100) AS `share`
FROM
	(SELECT `condition`, COUNT(`condition`) AS count
	FROM offer_attributes
	WHERE property_type != 'land'
		AND `condition` IS NOT NULL
	GROUP BY `condition`) x
JOIN
	(SELECT COUNT(`condition`) AS sum
	FROM offer_attributes
	WHERE property_type != 'land'
		AND `condition` IS NOT NULL) y;

CREATE VIEW property_category_share_region AS        
SELECT
	x.property_category,
    ROUND((x.count / y.sum) * 100) AS `share`
FROM
	(SELECT c.property_category, COUNT(c.property_category) AS count
	FROM
		(SELECT 
			CASE
				WHEN property_type = 'house' THEN 'house'
				WHEN property_type = 'land' THEN 'land'
				ELSE 'apartment'
			END AS property_category
		FROM offer_attributes) c
	GROUP BY c.property_category) x
JOIN
	(SELECT COUNT(property_type) AS sum
    FROM offer_attributes) y;
    
SELECT *
FROM offer_attributes o 
JOIN offer_locations l
	ON o.offer_id = l.offer_id
WHERE l.location_district = 'okres Námestovo';


SELECT x.property_type, COUNT(x.property_type) / 3872
FROM
(SELECT
	CASE
		WHEN property_type = 'house' THEN 'house'
        WHEN property_type = 'land' THEN 'land'
        ELSE 'apartment'
	END AS property_type
FROM offer_attributes) x
GROUP BY x.property_type;


CREATE VIEW property_type_share_by_district AS
SELECT
	x.location_district,
    x.property_type,
    ROUND((x.count / x.sum) * 100, 2) AS `share`
FROM
	(SELECT
		l.location_district,
		p.property_type,
		COUNT(p.property_type) AS count,
		SUM(COUNT(p.property_type)) OVER(PARTITION BY l.location_district) AS sum
	FROM
		(SELECT
			offer_id,
			CASE
				WHEN property_type = 'house' THEN 'house'
				WHEN property_type = 'land' THEN 'land'
				ELSE 'apartment'
			END AS property_type
		FROM offer_attributes) p
	JOIN offer_locations l
		ON p.offer_id = l.offer_id
	GROUP BY l.location_district, P.property_type) x
UNION
	(SELECT 
		'all region' AS location_district,
        o.property_type,
        ROUND(
				(COUNT(o.property_type) 
				/
				SUM(COUNT(o.property_type)) OVER())
				* 100,
            2) AS `share`
	FROM
		(SELECT 
			CASE
				WHEN property_type = 'house' THEN 'house'
				WHEN property_type = 'land' THEN 'land'
				ELSE 'apartment'
			END AS property_type
		FROM offer_attributes) o
	GROUP BY o.property_type
    );
    
SELECT * 
FROM property_type_share_by_district
WHERE property_type = 'house';

SELECT 
	l.location_district, 
    o.`condition`, 
    COUNT(a.offer_id) AS count,
    ROUND(
			(COUNT(a.offer_id)
			/
			SUM(COUNT(a.offer_id)) OVER(PARTITION BY location_district))
            * 100,
        2) AS `share`
FROM agencies a
JOIN offer_locations l
	ON a.offer_id = l.offer_id
JOIN offer_attributes o
	ON a.offer_id = o.offer_id
WHERE a.agency = 'RK SPIRIT s.r.o.'
	AND o.property_type != 'land'
GROUP BY 
	l.location_district, 
    o.`condition`;

CREATE VIEW agency_property_category_share AS
SELECT DISTINCT
    y.agency,
    y.property_category,
    ROUND(
			COUNT(*) OVER(PARTITION BY y.agency, y.property_category) 
			/
			COUNT(*) OVER(PARTITION BY y.agency),
		2) AS `share`,
	COUNT(*) OVER(PARTITION BY y.agency, y.property_category)  AS count
FROM
	(SELECT
		x.offer_id,
		x.agency,
		x.property_category
	FROM
		(SELECT 
			a.agency,
			CASE
				WHEN o.property_type = 'house' THEN 'house'
				WHEN o.property_type = 'land' THEN 'land'
				ELSE 'apartment'
			END property_category,
			o.offer_id
		FROM agencies a
		JOIN offer_attributes o 
			ON a.offer_id = o.offer_id
				AND a.agency IS NOT NULL) x) y;

CREATE VIEW agency_property_category_share_by_district AS
SELECT DISTINCT
    y.agency,
    y.property_category,
    y.location_district,
    ROUND(
			COUNT(*) OVER(PARTITION BY y.agency, y.property_category, y.location_district) 
			/
			COUNT(*) OVER(PARTITION BY y.agency, y.location_district),
		2) AS `share`,
	COUNT(*) OVER(PARTITION BY y.agency, y.property_category, y.location_district)  AS count,
    COUNT(*) OVER(PARTITION BY y.agency, y.location_district) AS total_count
FROM
	(SELECT
		x.offer_id,
		x.agency,
		x.property_category,
        x.location_district
	FROM
		(SELECT 
			a.agency,
			CASE
				WHEN o.property_type = 'house' THEN 'house'
				WHEN o.property_type = 'land' THEN 'land'
				ELSE 'apartment'
			END property_category,
			o.offer_id,
            l.location_district
		FROM agencies a
		JOIN offer_attributes o 
			ON a.offer_id = o.offer_id
				AND a.agency IS NOT NULL
		JOIN offer_locations l
			ON a.offer_id = l.offer_id) x) y;
            

CREATE VIEW agency_condition_share AS
SELECT DISTINCT
    y.agency,
    y.`condition`,
    ROUND(
			COUNT(*) OVER(PARTITION BY y.agency, y.`condition`) 
			/
			COUNT(*) OVER(PARTITION BY y.agency),
		2) AS `share`,
	COUNT(*) OVER(PARTITION BY y.agency, y.`condition`)  AS count
FROM
	(SELECT 
		a.agency,
		o.`condition`,
		o.offer_id
	FROM agencies a
	JOIN offer_attributes o 
		ON a.offer_id = o.offer_id
			AND a.agency IS NOT NULL
            AND o.`condition` IS NOT NULL
            AND o.property_type != 'land') y;
            
CREATE VIEW agency_condition_share_by_district AS
SELECT DISTINCT
    y.agency,
    y.`condition`,
    y.location_district,
    ROUND(
			COUNT(*) OVER(PARTITION BY y.agency, y.`condition`, y.location_district) 
			/
			COUNT(*) OVER(PARTITION BY y.agency, y.location_district),
		2) AS `share`,
	COUNT(*) OVER(PARTITION BY y.agency, y.`condition`, y.location_district)  AS count,
    COUNT(*) OVER(PARTITION BY y.agency, y.location_district) AS total_count
FROM
	(SELECT 
		a.agency,
		o.`condition`,
		o.offer_id,
        l.location_district
	FROM agencies a
	JOIN offer_attributes o 
		ON a.offer_id = o.offer_id
			AND a.agency IS NOT NULL
            AND o.`condition` IS NOT NULL
            AND o.property_type != 'land'
	JOIN offer_locations l
		ON a.offer_id = l.offer_id) y;

SELECT *
FROM agency_property_category_share
WHERE agency LIKE '%OVERENÉ REALITY%';

SELECT *
FROM agency_property_category_share_by_district
WHERE agency LIKE '%OVERENÉ REALITY%'
ORDER BY total_count DESC;

SELECT *
FROM agency_condition_share
WHERE agency LIKE '%AstonReal%';

SELECT *
FROM agency_condition_share_by_district
WHERE agency LIKE '%AstonReal%'
ORDER BY total_count DESC;

SELECT *
FROM market_competition_rating;

CREATE VIEW segment_entry_rating AS
SELECT
	b.*,
    ROUND((b.conservative_rating + b.growth_rating + execution_rating) / 3) AS combined_rating
FROM
	(SELECT
		a.offer_type,
		a.property_category,
		a.`condition`,
		a.location_district,
		a.agencies_num,
		a.total_listings,
        ROUND(a.listings_per_10k, 3) AS listings_per_10k,
		a.listings_per_agency,
		a.cr3,
		ROUND((0.60 * a.cr3_score + 0.25 * a.ag_listings_score + 0.15 * a.listings_count_score) * 100) AS conservative_rating, # conservative entrant
		ROUND((0.40 * a.cr3_score + 0.25 * a.ag_listings_score + 0.35 * a.listings_count_score) * 100) AS growth_rating, # growth-seeking entrant
		ROUND((0.45 * a.cr3_score + 0.40 * a.ag_listings_score + 0.15 * a.listings_count_score) * 100) AS execution_rating # execution-driven entrant
	FROM
		(SELECT
			f.*,
			ROUND((1 - (f.cr3 - MIN(f.cr3) OVER()) 
				/ (MAX(f.cr3) OVER() - MIN(f.cr3) OVER())), 
				2) AS cr3_score,
			ROUND((f.listings_per_agency- MIN(f.listings_per_agency) OVER()) 
				/ (MAX(f.listings_per_agency) OVER() - MIN(f.listings_per_agency) OVER()), 
				2) AS ag_listings_score,
			ROUND((f.listings_per_10k - MIN(f.listings_per_10k) OVER()) 
				/ (MAX(f.listings_per_10k) OVER() - MIN(f.listings_per_10k) OVER()), 
				2) AS listings_count_score
		FROM
			(SELECT
				q.offer_type,
				q.property_category,
				q.`condition`,
				q.location_district,
				q.agencies_num,
                q.total_listings,
                CASE
					WHEN q.location_district = 'okres Bytča' THEN (q.total_listings / 31400) * 10000
                    WHEN q.location_district = 'okres Žilina' THEN (q.total_listings / 160360) * 10000
                    WHEN q.location_district = 'okres Kysucké Nové Mesto' THEN (q.total_listings / 32540) * 10000
                    WHEN q.location_district = 'okres Čadca' THEN (q.total_listings / 86666) * 10000
                    WHEN q.location_district = 'okres Martin' THEN (q.total_listings / 92817) * 10000
                    WHEN q.location_district = 'okres Turčianske Teplice' THEN (q.total_listings / 15646) * 10000
                    WHEN q.location_district = 'okres Dolný Kubín' THEN (q.total_listings / 38726) * 10000
                    WHEN q.location_district = 'okres Námestovo' THEN (q.total_listings / 64651) * 10000
                    WHEN q.location_district = 'okres Tvrdošín' THEN (q.total_listings / 35749) * 10000
                    WHEN q.location_district = 'okres Ružomberok' THEN (q.total_listings / 56278) * 10000
                    WHEN q.location_district = 'okres Liptovský Mikuláš' THEN (q.total_listings / 71186) * 10000
				END AS listings_per_10k,
				ROUND((q.total_listings / q.agencies_num), 2) AS listings_per_agency,
				ROUND((q.running_listings_total / q.total_listings) * 100, 2) AS cr3
			FROM
				(SELECT
					z.offer_type,
					z.property_category,
					z.`condition`,
					z.location_district,
					z.agency,
					z.ranking,
					COUNT(z.agency) OVER (
						PARTITION BY z.offer_type, z.property_category, z.`condition`, z.location_district)
						AS agencies_num,
					z.listings,
					SUM(z.listings) OVER (
						PARTITION BY z.offer_type, z.property_category, z.`condition`, z.location_district
						ORDER BY z.ranking)
						AS running_listings_total,
					SUM(z.listings) OVER (
						PARTITION BY z.offer_type, z.property_category, z.`condition`, z.location_district)
						AS total_listings
				FROM
					(SELECT
						y.offer_type,
						y.property_category,
						y.`condition`,
						y.location_district,
						y.agency,
						y.listings,
						ROW_NUMBER() OVER(
							PARTITION BY y.offer_type, y.property_category, y.`condition`, y.location_district
							ORDER BY listings DESC) 
							AS ranking
					FROM
						(SELECT
							x.offer_type,
							x.property_category,
							x.`condition`,
							x.location_district,
							x.agency,
							COUNT(x.agency) AS listings
						FROM 
							(SELECT
								o.offer_type,
								CASE
									WHEN o.property_type = 'house' THEN 'house'
									WHEN o.property_type = 'land' THEN 'land'
									ELSE 'apartment'
									END AS property_category,
								CASE
									WHEN o.property_type = 'land' THEN 'n/a'
									ELSE o.`condition`
								END AS `condition`,
								l.location_district,
								a.agency
							FROM offer_attributes o
							JOIN agencies a
								ON o.offer_id = a.offer_id
							JOIN offer_locations l
								ON o.offer_id = l.offer_id) x
							GROUP BY
								x.offer_type,
								x.property_category,
								x.`condition`,
								x.location_district,
								x.agency) y
						WHERE y.`condition` IS NOT NULL) z) q
			WHERE q.ranking = 3) f
		ORDER BY f.offer_type, f.property_category, f.`condition`, f.location_district) a) b
;



SELECT DISTINCT
	l.location_area, 
    a.agency,
    COUNT(l.location_area) OVER(PARTITION BY a.agency, l.location_area) AS agency_area_count,
    COUNT(l.location_area) OVER(PARTITION BY l.location_area) AS total_area_count,
    ROUND(
			(COUNT(l.location_area) OVER(PARTITION BY a.agency, l.location_area) 
            / COUNT(l.location_area) OVER(PARTITION BY l.location_area))
            * 100,
		2) AS agency_area_share
FROM offer_locations l
JOIN offer_attributes o
	ON l.offer_id = o.offer_id
JOIN agencies a
	ON l.offer_id = a.offer_id
WHERE l.location_district = 'okres Liptovský Mikuláš'
	AND o.property_type = 'holiday apartment'
ORDER BY total_area_count DESC, agency_area_share DESC;
 
SELECT DISTINCT
	a.agency,
    COUNT(o.offer_id) OVER(PARTITION BY a.agency) AS count,
    ROUND(
			(COUNT(o.offer_id) OVER(PARTITION BY a.agency)
			/
			COUNT(o.offer_id) OVER()) * 100,
		2) AS `share`
FROM offer_attributes o
JOIN agencies a
	ON o.offer_id = a.offer_id
WHERE o.property_type = 'holiday apartment';


CREATE VIEW agency_condition_portfolio_across_districts AS
SELECT DISTINCT
	x.location_district,
    x.`condition`,
    ROUND(x.district_share * 100) AS all_district_share,
    ad.agency,
    ROUND((ad.`share` - x.district_share) * 100) AS district_share_diff,
    ROUND((ad.`share` - a.`share`) * 100) AS agency_share_diff
FROM
	(SELECT
		l.location_district,
		o.`condition`,
		(COUNT(l.offer_id) OVER(PARTITION BY l.location_district, o.`condition`)
			/ COUNT(l.offer_id) OVER(PARTITION BY l.location_district)
			) AS district_share
	FROM offer_locations l
	JOIN offer_attributes o
		ON l.offer_id = o.offer_id
	WHERE o.`condition` IS NOT NULL) x
JOIN agency_condition_share_by_district ad
	ON x.`condition` = ad.`condition`
		AND x.location_district = ad.location_district
JOIN agency_condition_share a 
	ON x.`condition` = a.`condition`
		AND ad.agency = a.agency;
        
RENAME TABLE agency_property_category_portfolio_across_district TO agency_property_category_portfolio_across_districts;

SELECT * FROM agency_property_category_portfolio_across_districts;

CREATE VIEW agency_portfolio_and_district_share AS
SELECT 
	y.agency,
	y.location_district,
	y.ag_district_listings,
	y.ag_total_listings,
	y.dis_listings_count,
	y.portfolio_share_in_district,
	y.share_of_district_listings,
    ROW_NUMBER() OVER(PARTITION BY y.agency ORDER BY y.portfolio_share_in_district DESC) AS ptf_in_dist_rank,
    ROW_NUMBER() OVER(PARTITION BY y.agency ORDER BY y.share_of_district_listings DESC) AS dist_share_rank
FROM
	(SELECT DISTINCT
		x.agency,
		x.location_district,
		x.ag_district_listings,
		x.ag_total_listings,
		x.dis_listings_count,
		x.ag_district_listings / x.ag_total_listings AS portfolio_share_in_district,
		x.ag_district_listings / x.dis_listings_count AS share_of_district_listings
	FROM 
		(SELECT
			ad.agency,
			ad.location_district,
			ad.ag_district_listings,
			ad.ag_total_listings,
			d.dis_listings_count
		FROM
			(SELECT 
				a.agency, 
				l.location_district, 
				COUNT(l.offer_id) OVER(PARTITION BY a.agency, l.location_district) AS ag_district_listings,
				COUNT(l.offer_id) OVER(PARTITION BY a.agency) AS ag_total_listings
			FROM offer_locations l
			JOIN agencies a
				ON l.offer_id = a.offer_id
			WHERE a.agency IS NOT NULL) ad
		JOIN 
			(SELECT location_district, COUNT(offer_id) AS dis_listings_count
			FROM offer_locations
			GROUP BY location_district) d
			ON ad.location_district = d.location_district) x) y;

CREATE VIEW zilina_district_top10_agencies_pricing AS
SELECT
	p.agency,
    p.property_category,
    AVG(p.price_index) AS avg_price_diff
FROM
	(SELECT *,
		CASE
			WHEN property_type = 'house' THEN 'house'
            WHEN property_type = 'land' THEN 'land'
            ELSE 'apartment'
		END property_category
	FROM agency_price_index_area_level
	WHERE location_district = 'okres Žilina') p
JOIN
	(SELECT
		y.agency,
		y.offer_count,
		y.count_rank
	FROM
		(SELECT 
			x.agency,
			x.offer_count,
			ROW_NUMBER() OVER(ORDER BY x.offer_count DESC) AS count_rank
		FROM
			(SELECT 
				a.agency, COUNT(l.offer_id) AS offer_count
			FROM offer_locations l
			JOIN agencies a
				ON l.offer_id = a.offer_id
			WHERE l.location_district = 'okres Žilina'
				AND a.agency IS NOT NULL
			GROUP BY a.agency) x) y
	WHERE y.count_rank <= 10) AS top10
	ON p.agency = top10.agency
    GROUP BY p.agency, p.property_category;
    
CREATE VIEW martin_district_top10_agencies_pricing AS
SELECT
	p.agency,
    p.property_category,
    AVG(p.price_index) AS avg_price_diff
FROM
	(SELECT *,
		CASE
			WHEN property_type = 'house' THEN 'house'
            WHEN property_type = 'land' THEN 'land'
            ELSE 'apartment'
		END property_category
	FROM agency_price_index_area_level
	WHERE location_district = 'okres Martin') p
JOIN
	(SELECT
		y.agency,
		y.offer_count,
		y.count_rank
	FROM
		(SELECT 
			x.agency,
			x.offer_count,
			ROW_NUMBER() OVER(ORDER BY x.offer_count DESC) AS count_rank
		FROM
			(SELECT 
				a.agency, COUNT(l.offer_id) AS offer_count
			FROM offer_locations l
			JOIN agencies a
				ON l.offer_id = a.offer_id
			WHERE l.location_district = 'okres Martin'
				AND a.agency IS NOT NULL
			GROUP BY a.agency) x) y
	WHERE y.count_rank <= 10) AS top10
	ON p.agency = top10.agency
    GROUP BY p.agency, p.property_category;
    
CREATE VIEW agency_price_index_by_offer AS
SELECT 
	fl.offer_id, fl.agency, fl.property_type,
    CASE
		WHEN fl.property_type LIKE '%house%' THEN 'house'
        WHEN fl.property_type LIKE '%plot%' THEN 'land'
        ELSE 'apartment'
        END AS property_category,
	fl.`condition`,
    fl.location_district,
    fl.location_area,
    fl.agency_listings,
    fl.district_listings,
    fl.agency_price_m2,
    fl.district_avg_price,
    fl.price_index
FROM
	### APARTMENTS
	(SELECT
		agency_apts.offer_id,
		agency_apts.agency,
		agency_apts.property_type,
		agency_apts.`condition`,
		agency_apts.location_district,
		agency_apts.location_area,
		agency_apts.agency_listings,
		district_apts.district_listings,
		agency_apts.agency_price_m2,
		district_apts.district_avg_price,
		# How different the price is compared to the segement average:
		((agency_apts.agency_price_m2 - district_apts.district_avg_price) / district_apts.district_avg_price) AS price_index
	FROM 
		(SELECT 
			af.offer_id,
			af.agency,
			af.property_type, 
			af.`condition`, 
			af.location_district, 
			af.location_area, 
			af.price_m2 AS agency_price_m2,
			ac.agency_listings
		FROM sale_apartments_full af
		JOIN
			(SELECT 
				agency,
				property_type, 
				`condition`, 
				location_district, 
				location_area, 
				COUNT(offer_id) AS agency_listings
			FROM sale_apartments_full
			WHERE price_m2 IS NOT NULL
				AND agency IS NOT NULL
				AND location_area IS NOT NULL
			GROUP BY agency, property_type, `condition`, location_district, location_area) ac
			ON af.agency = ac.agency 
				AND af.property_type = ac.property_type AND af.`condition` = ac.`condition`
				AND af.location_district = ac.location_district AND af.location_area = ac.location_area
			WHERE af.price_m2 IS NOT NULL) agency_apts
	JOIN
		(SELECT AVG(price_m2) AS district_avg_price, COUNT(offer_id) AS district_listings, property_type, `condition`, location_district, location_area
		FROM sale_apartments_full
		WHERE price_m2 IS NOT NULL
			AND location_area IS NOT NULL
		GROUP BY property_type, `condition`, location_district, location_area) district_apts
		ON agency_apts.property_type = district_apts.property_type # We are comparing listings that share the same apartment type,
			AND agency_apts.`condition` = district_apts.`condition` # condition
			AND agency_apts.location_district = district_apts.location_district # district
			AND agency_apts.location_area = district_apts.location_area # and location
	/* To make sure that an agency isn't the sole administrator of all or vast majority of listings within a segment,
	because if it were, we would be essentially comparing it to itself, and as result the price difference would be 0%,
	which would tell us nothing about the agency's pricing. */
	WHERE agency_listings / district_listings < 0.75
	UNION ALL
	### HOUSES
	SELECT
		agency_houses.offer_id,
		agency_houses.agency,
		agency_houses.property_type,
		agency_houses.`condition`,
		agency_houses.location_district,
		agency_houses.location_area,
		agency_houses.agency_listings,
		district_houses.district_listings,
		agency_houses.agency_price_m2,
		district_houses.district_avg_price,
		((agency_houses.agency_price_m2 - district_houses.district_avg_price) / district_houses.district_avg_price) AS price_index
	FROM
		(SELECT
			hdx.property_type,
			hdx.`condition`,
			hdx.location_district,
			hdx.location_area,
			COUNT(hdx.offer_id) AS district_listings,
			AVG(price_m2) AS district_avg_price
		FROM
			(SELECT
				offer_id,
				agency,
				CASE
					WHEN area <= 80 THEN 'small house'
					WHEN area > 80 AND area <= 150 THEN 'standard house'
					WHEN area > 150 AND area <= 300 THEN 'large house'
					WHEN area > 300 THEN 'extra large house'
					END AS property_type,
				`condition`,
				location_district,
				location_area,
				price_m2
			FROM sale_houses_full
			WHERE offer_id != 'JuNBS73Ff1Z' # huge outlier → area = 212000 m2
				AND agency IS NOT NULL
				AND price_m2 IS NOT NULL
				AND `condition` IS NOT NULL
				AND location_area IS NOT NULL) hdx
		GROUP BY hdx.property_type, hdx.`condition`, hdx.location_district, hdx.location_area) district_houses
	JOIN
		(SELECT
			hf.offer_id,
			hf.agency,
			hf.property_type,
			hf.`condition`,
			hf.location_district,
			hf.location_area,
			hf.agency_price_m2,
			hc.agency_listings
		FROM
			(SELECT
				offer_id,
				agency,
				CASE
					WHEN area <= 80 THEN 'small house'
					WHEN area > 80 AND area <= 150 THEN 'standard house'
					WHEN area > 150 AND area <= 300 THEN 'large house'
					WHEN area > 300 THEN 'extra large house'
					END AS property_type,
				`condition`,
				location_district,
				location_area,
				price_m2 AS agency_price_m2
			FROM sale_houses_full
			WHERE offer_id != 'JuNBS73Ff1Z' # huge outlier → area = 212000 m2
				AND agency IS NOT NULL
				AND price_m2 IS NOT NULL
				AND `condition` IS NOT NULL
				AND location_area IS NOT NULL) hf
		JOIN 
			(SELECT
				hcx.agency,
				hcx.property_type,
				hcx.`condition`,
				hcx.location_district,
				hcx.location_area,
				COUNT(hcx.agency) AS agency_listings
			FROM
				(SELECT
					offer_id,
					agency,
					CASE
						WHEN area <= 80 THEN 'small house'
						WHEN area > 80 AND area <= 150 THEN 'standard house'
						WHEN area > 150 AND area <= 300 THEN 'large house'
						WHEN area > 300 THEN 'extra large house'
					END AS property_type,
					`condition`,
					location_district,
					location_area
				FROM sale_houses_full
				WHERE offer_id != 'JuNBS73Ff1Z' # huge outlier → area = 212000 m2
					AND agency IS NOT NULL
					AND price_m2 IS NOT NULL
					AND `condition` IS NOT NULL
					AND location_area IS NOT NULL) hcx
			GROUP BY hcx.agency, hcx.property_type, hcx.`condition`, hcx.location_district, hcx.location_area) hc
			ON hf.agency = hc.agency AND hf.property_type = hc.property_type AND hf.`condition` = hc.`condition`
				AND hf.location_district = hc.location_district AND hf.location_area = hc.location_area) AS agency_houses
		ON district_houses.property_type = agency_houses.property_type
			AND district_houses.`condition` = agency_houses.`condition`
			AND district_houses.location_district = agency_houses.location_district
			AND district_houses.location_area = agency_houses.location_area
	/* To make sure that an agency isn't the sole administrator of all or vast majority of listings within a segment,
	because if it were, we would be essentially comparing it to itself, and as result the price difference would be 0%,
	which would tell us nothing about the agency's pricing. */
	WHERE agency_houses.agency_listings / district_houses.district_listings < 0.75
	UNION ALL
	# LAND PLOTS
	SELECT
		agency_lands.offer_id,
		agency_lands.agency,
		agency_lands.property_type,
		agency_lands.`condition`,
		agency_lands.location_district,
		agency_lands.location_area,
		agency_lands.agency_listings,
		district_lands.district_listings,
		agency_lands.agency_price_m2,
		district_lands.district_avg_price,
		((agency_lands.agency_price_m2 - district_lands.district_avg_price) / district_lands.district_avg_price) AS price_index
	FROM
		(SELECT
			ll.property_type,
			ll.`condition`,
			ll.location_district,
			ll.location_area,
			COUNT(ll.offer_id) AS district_listings,
			AVG(ll.price_m2) AS district_avg_price
		FROM
			(SELECT
				offer_id,
				agency,
				CASE
					WHEN area <= 600 THEN 'small plot'
					WHEN area > 600 AND area <= 1200 THEN 'standard plot'
					WHEN area > 1200 AND area <= 3000 THEN 'large plot'
					WHEN area > 3000 THEN 'extra large plot'
					END AS property_type,
				NULL AS `condition`,
				location_district,
				location_area,
				price_m2
			FROM sale_lands_full
			WHERE area IS NOT NULL
				AND price_m2 IS NOT NULL
				AND agency IS NOT NULL
				AND location_area IS NOT NULL) ll
		GROUP BY ll.property_type, ll.`condition`, ll.location_district, ll.location_area) AS district_lands
	JOIN
		(SELECT
			lf.offer_id,
			lf.agency,
			lf.property_type,
			lf.`condition`,
			lf.location_district,
			lf.location_area,
			lc.agency_listings,
			lf.price_m2 AS agency_price_m2
		FROM 
			(SELECT
				offer_id,
				agency,
				CASE
					WHEN area <= 600 THEN 'small plot'
					WHEN area > 600 AND area <= 1200 THEN 'standard plot'
					WHEN area > 1200 AND area <= 3000 THEN 'large plot'
					WHEN area > 3000 THEN 'extra large plot'
					END AS property_type,
				NULL AS `condition`,
				location_district,
				location_area,
				price_m2
			FROM sale_lands_full
			WHERE area IS NOT NULL
				AND price_m2 IS NOT NULL
				AND agency IS NOT NULL
				AND location_area IS NOT NULL) lf
		JOIN
			(SELECT 
				lt.agency,
				lt.property_type,
				lt.`condition`,
				lt.location_district,
				lt.location_area,
				COUNT(lt.offer_id) AS agency_listings
			FROM 
				(SELECT
					offer_id,
					agency,
					CASE
						WHEN area <= 600 THEN 'small plot'
						WHEN area > 600 AND area <= 1200 THEN 'standard plot'
						WHEN area > 1200 AND area <= 3000 THEN 'large plot'
						WHEN area > 3000 THEN 'extra large plot'
						END AS property_type,
					NULL AS `condition`,
					location_district,
					location_area,
					price_m2
				FROM sale_lands_full
				WHERE area IS NOT NULL
					AND price_m2 IS NOT NULL
					AND agency IS NOT NULL
					AND location_area IS NOT NULL) lt
			GROUP BY lt.agency, lt.property_type, lt.`condition`, lt.location_district, lt.location_area) lc
			ON lf.agency = lc.agency 
				AND lf.property_type = lc.property_type 
				AND lf.location_district = lc.location_district 
				AND lf.location_area = lc.location_area) AS agency_lands
		ON district_lands.property_type = agency_lands.property_type
			AND district_lands.location_district = agency_lands.location_district
			AND district_lands.location_area = agency_lands.location_area
	/* To make sure that an agency isn't the sole administrator of all or vast majority of listings within a segment,
	because if it were, we would be essentially comparing it to itself, and as result the price difference would be 0%,
	which would tell us nothing about the agency's pricing. */
	WHERE agency_lands.agency_listings / district_lands.district_listings < 0.75) AS fl;




CREATE VIEW agency_price_index_by_offer_extra AS
SELECT 
	ai.*, 
	ax.area_price_index,
    CASE
		WHEN ax.area_price_index <= -0.25 THEN 'cheap'
        WHEN ax.area_price_index > -0.25 AND ax.area_price_index <= 0.10 THEN 'average'
        WHEN ax.area_price_index > 0.10 AND ax.area_price_index <= 0.40 THEN 'expensive'
        WHEN ax.area_price_index > 0.40 THEN 'premium'
	END AS area_category
FROM agency_price_index_by_offer  ai
JOIN
	(SELECT location_district, location_area, ROUND(AVG(price_diff)/100, 10) AS area_price_index
	FROM overall_vs_area_price
	WHERE location_area IS NOT NULL AND price_diff IS NOT NULL
	GROUP BY location_district, location_area
    ORDER BY location_district, location_area) ax
    ON ai.location_district = ax.location_district
		AND ai.location_area = ax.location_area;


CREATE VIEW sale_properties_segment_info AS
SELECT
	o.offer_id,
	a.agency,
	o.property_type,
    CASE
		WHEN property_type = 'house' THEN 'house'
        WHEN property_type = 'land' THEN 'land'
        ELSE 'apartment'
		END AS property_category,
    o.`condition`,
    l.location_district,
    l.location_area,
    ax.area_price_index,
    CASE
		WHEN ax.area_price_index <= -0.25 THEN 'cheap'
        WHEN ax.area_price_index > -0.25 AND ax.area_price_index <= 0.10 THEN 'average'
        WHEN ax.area_price_index > 0.10 AND ax.area_price_index <= 0.40 THEN 'expensive'
        WHEN ax.area_price_index > 0.40 THEN 'premium'
        ELSE NULL
	END AS area_category
FROM offer_attributes o
JOIN agencies a
	ON o.offer_id = a.offer_id
JOIN offer_locations l
	ON o.offer_id = l.offer_id
JOIN
	(SELECT location_district, location_area, ROUND(AVG(price_diff)/100, 10) AS area_price_index
	FROM overall_vs_area_price
	GROUP BY location_district, location_area
    ORDER BY location_district, location_area) ax
    ON l.location_district = ax.location_district
		AND l.location_area = ax.location_area
WHERE o.offer_type = 'sale';


SELECT d.*
FROM 
	(SELECT c.*,
		SUM(c.listings_count) OVER(PARTITION BY c.segment) AS tot_segment_listings,
		ROUND(c.listings_count / SUM(c.listings_count) OVER(PARTITION BY c.segment), 4) AS agency_share
	FROM
		(SELECT a.agency, a.segment, a.avg_price_index, b.listings_count
		FROM
			(SELECT x.*
			FROM 
				(SELECT agency, property_type AS segment, AVG(price_index) AS avg_price_index
				FROM agency_price_index_by_offer_extra
				GROUP BY agency, property_type
				UNION ALL
				SELECT agency, property_category AS segment, AVG(price_index) AS avg_price_index
				FROM agency_price_index_by_offer_extra
				GROUP BY agency, property_category
				UNION ALL
				SELECT agency, `condition` AS segment, AVG(price_index) AS avg_price_index
				FROM agency_price_index_by_offer_extra
				GROUP BY agency, `condition`
				UNION ALL
				SELECT agency, location_district AS segment, AVG(price_index) AS avg_price_index
				FROM agency_price_index_by_offer_extra
				GROUP BY agency, location_district
				UNION ALL
				SELECT agency, area_category AS segment, AVG(price_index) AS avg_price_index
				FROM agency_price_index_by_offer_extra
				GROUP BY agency, area_category) x) a
		JOIN
			(SELECT y.*
			FROM 
				(SELECT agency, property_type AS segment, COUNT(offer_id) AS listings_count
				FROM sale_properties_segment_info
				GROUP BY agency, property_type
				UNION ALL
				SELECT agency, property_category AS segment, COUNT(offer_id) AS listings_count
				FROM sale_properties_segment_info
				GROUP BY agency, property_category
				UNION ALL
				SELECT agency, `condition` AS segment, COUNT(offer_id) AS listings_count
				FROM sale_properties_segment_info
				GROUP BY agency, `condition`
				UNION ALL
				SELECT agency, location_district AS segment, COUNT(offer_id) AS listings_count
				FROM sale_properties_segment_info
				GROUP BY agency, location_district
				UNION ALL
				SELECT agency, area_category AS segment, COUNT(offer_id) AS listings_count
				FROM sale_properties_segment_info
				GROUP BY agency, area_category) y) b
			ON a.agency = b.agency AND a.segment = b.segment
		ORDER BY a.segment, b.listings_count DESC) c) d
	WHERE d.agency = 'TUreality s.r.o.';
        
CREATE VIEW sale_offers_segment_pricing AS
SELECT
	y.offer_id,
    y.agency,
    y.property_category,
    y.property_type,
    y.`condition`,
    y.location_district,
    y.location_area,
    y.area_price_category,
    y.area_price_index,
    y.price_m2,
    y.segment_avg_price,
    ROUND(((y.price_m2 - y.segment_avg_price) / y.segment_avg_price), 4) AS pricing_index,
    y.agency_listings,
    y.all_listings
FROM
    (SELECT
		x.offer_id,
		x.agency,
		x.property_category,
		x.property_type,
		x.`condition`,
		x.location_district,
		x.location_area,
		CASE
			WHEN x.area_price_index <= -40 THEN 'very cheap'
			WHEN x.area_price_index <= -15 AND x.area_price_index > -40 THEN 'cheap'
			WHEN x.area_price_index <= 5 AND x.area_price_index > -15 THEN 'average'
			WHEN x.area_price_index <= 35 AND x.area_price_index > 5 THEN 'expensive'
			WHEN x.area_price_index > 35 THEN 'premium'
			WHEN NULL THEN NULL
			END AS area_price_category,
		x.area_price_index,
		x.price_m2,
		ROUND(AVG(price_m2) OVER(PARTITION BY x.property_type, x.`condition`, x.location_district, x.location_area), 2) AS segment_avg_price,
		COUNT(offer_id) OVER(PARTITION BY x.agency, x.property_type, x.`condition`, x.location_district, x.location_area) AS agency_listings,
		COUNT(offer_id) OVER(PARTITION BY x.property_type, x.`condition`, x.location_district, x.location_area) AS all_listings
	FROM
		(SELECT
			oa.offer_id,
			oa.property_category,
			oa.property_type,
			oa.`condition`,
			ol.location_district,
			ol.location_area,
			a.agency,
			sp.price_m2,
			ROUND(ap.area_price_index, 2) AS area_price_index
		FROM offer_locations ol
		JOIN agencies a
			ON ol.offer_id = a.offer_id
		JOIN sale_prices sp
			ON ol.offer_id = sp.offer_id
		JOIN
			(SELECT
				oo.offer_id,
				CASE
					WHEN oo.property_category = 'house' 
						AND oo.`area` <= 80 THEN 'small house'
					WHEN oo.property_category = 'house' 
						AND oo.`area` > 80 AND oo.`area` <= 150 THEN 'medium house'
					WHEN oo.property_category = 'house' 
						AND oo.`area` > 150 AND oo.`area` <= 300 THEN 'large house'
					WHEN oo.property_category = 'house' 
						AND oo.`area` > 300 THEN 'extra large house'
					WHEN oo.property_category = 'land' 
						AND oo.`area` <= 600 THEN 'small plot'
					WHEN oo.property_category = 'land' 
						AND oo.`area` > 600 AND oo.`area` <= 1200 THEN 'medium plot'
					WHEN oo.property_category = 'land' 
						AND oo.`area` > 1200 AND oo.`area` <= 3000 THEN 'large plot'
					WHEN oo.property_category = 'land' 
						AND oo.`area` > 3000 THEN 'extra large plot'
					WHEN oo.property_category = 'land' AND oo.`area` IS NULL THEN NULL
                    WHEN oo.property_category = 'house' AND oo.`area` IS NULL THEN NULL
					ELSE oo.property_type
					END AS property_type,
				oo.property_category,
				oo.`area`,
				oo.`condition`
			FROM 
				(SELECT 
					o.offer_id,
					o.property_type,
					o.property_category,
					CASE
						WHEN o.property_category = 'house'
							AND (o.`area` < 15 OR o.`area` > 3000) THEN NULL
						WHEN o.property_category = 'house'
							AND o.`area` < 20 THEN NULL  
						ELSE `area` 
						END AS `area`,
					o.`condition`
				FROM
					(SELECT 
						offer_id,
						property_type,
						CASE
							WHEN property_type = 'house' THEN 'house'
							WHEN property_type = 'land' THEN 'land'
							ELSE 'apartment'
							END AS property_category,
						`area`,
						CASE
							WHEN property_type = 'land' THEN NULL
							ELSE `condition`
							END AS `condition`
					FROM offer_attributes
					WHERE offer_type = 'sale') o) oo) oa
					ON ol.offer_id = oa.offer_id
		LEFT JOIN area_price_index ap
			ON ol.location_district = ap.location_district
				AND ol.location_area = ap.location_area) x)y
	;
    
CREATE VIEW sale_offers_segment_property_category AS
SELECT 
	y.agency,
    y.apt_listings,
    y.apt_pricing_idx,
    CASE
		WHEN apt_rank <= 5 THEN y.agency
        ELSE NULL
        END AS apt_top5,
	y.house_listings,
    y.house_pricing_idx,
    CASE
		WHEN house_rank <= 5 THEN y.agency
        ELSE NULL
        END AS house_top5,
	y.land_listings,
    y.land_pricing_idx,
    CASE
		WHEN land_rank <= 5 THEN y.agency
        ELSE NULL
        END AS land_top5
FROM
	(SELECT DISTINCT
		x.agency,
		apt.apt_listings,
		apt.apt_pricing_idx,
		apt.apt_rank,
		h.house_listings,
		h.house_pricing_idx,
		h.house_rank,
		l.land_listings,
		l.land_pricing_idx,
		l.land_rank
	FROM sale_offers_segment_pricing x
	LEFT JOIN
		(SELECT 
			agency, 
			COUNT(offer_id) AS apt_listings, 
			AVG(pricing_index) AS apt_pricing_idx,
			DENSE_RANK() OVER(ORDER BY COUNT(offer_id) DESC) AS apt_rank
		FROM sale_offers_segment_pricing
		WHERE property_category = 'apartment'
			AND agency IS NOT NULL
		GROUP BY agency) apt
		ON x.agency = apt.agency
	LEFT JOIN
		(SELECT 
			agency, 
			COUNT(offer_id) AS house_listings, 
			AVG(pricing_index) AS house_pricing_idx,
			DENSE_RANK() OVER(ORDER BY COUNT(offer_id) DESC) AS house_rank
		FROM sale_offers_segment_pricing
		WHERE property_category = 'house'
			AND agency IS NOT NULL
		GROUP BY agency) h
		ON x.agency = h.agency
	LEFT JOIN
		(SELECT 
			agency, 
			COUNT(offer_id) AS land_listings, 
			AVG(pricing_index) AS land_pricing_idx,
			DENSE_RANK() OVER(ORDER BY COUNT(offer_id) DESC) AS land_rank
		FROM sale_offers_segment_pricing
		WHERE property_category = 'land'
			AND agency IS NOT NULL
		GROUP BY agency) l
		ON x.agency = l.agency
	WHERE x.agency IS NOT NULL) y;
    
SELECT *
FROM sale_offers_segment_property_category;
    
SELECT DISTINCT
	x.agency,
    a0.apt0_listings,
    a0.apt0_pidx,
    a0.apt0_rank
FROM sale_offers_segment_pricing x
LEFT JOIN
	(SELECT 
		agency, 
		COUNT(offer_id) AS apt0_listings, 
		AVG(pricing_index) AS apt0_pidx,
		DENSE_RANK() OVER(ORDER BY COUNT(offer_id) DESC) AS apt0_rank
	FROM sale_offers_segment_pricing
	WHERE property_type = 'studio apartment'
		AND agency IS NOT NULL
	GROUP BY agency) a0
    ON x.agency = a0.agency
WHERE x.agency IS NOT NULL;


SELECT location_district, location_area, area_price_category, COUNT(offer_id)
FROM sale_offers_segment_pricing
GROUP BY location_district, location_area, area_price_category
ORDER BY area_price_category, COUNT(offer_id) DESC;
    
SELECT location_district, AVG(listings_per_agency)
FROM segment_entry_rating
GROUP BY location_district;

SELECT location_district, AVG(listings_per_10k)
FROM segment_entry_rating
GROUP BY location_district;

SELECT location_district, AVG(cr3)
FROM segment_entry_rating
GROUP BY location_district;

SELECT *
FROM apartment_attributes;

SELECT *
FROM house_attributes;

SELECT *
FROM land_attributes;

SELECT DISTINCT
	*
FROM
	(SELECT a.offer_id, a.agency, o.offer_type, o.property_type, o.`condition`, l.location_district, l.location_city, l.location_area,
		CASE WHEN property_type = 'house' THEN 'house'
			WHEN property_type = 'land' THEN 'land'
            ELSE 'apartment'
            END AS property_category
	FROM agencies a
	JOIN offer_attributes o
		ON a.offer_id = o.offer_id
	JOIN offer_locations l
		ON a.offer_id = l.offer_id
	WHERE a.agency LIKE '%WFG%') x;
    

SELECT
	tr.agency,
    tr.office_city,
    tr.offers_count,
    ag.location_district,
    ag.portfolio_share_in_district,
    ag.district_rank
FROM
	(SELECT a.agency, a.office_city, COUNT(a.offer_id) AS offers_count
	FROM agencies a
	JOIN offer_locations l
		ON a.offer_id = l.offer_id
	WHERE l.location_district = 'okres Turčianske Teplice'
	GROUP BY a.agency, a.office_city) tr
JOIN
	(SELECT agency, location_district, portfolio_share_in_district,
		ROW_NUMBER() OVER(PARTITION BY agency ORDER BY portfolio_share_in_district DESC) AS district_rank
	FROM agency_portfolio_and_district_share) ag
	ON tr.agency = ag.agency
WHERE ag.district_rank = 1
ORDER BY tr.offers_count DESC, ag.district_rank;