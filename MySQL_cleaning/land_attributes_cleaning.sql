USE real_estates;

UPDATE land_attributes
SET land_area = NULL
WHERE land_area = '';

UPDATE land_attributes
SET land_area = SUBSTRING_INDEX(land_area, ' m', 1)
WHERE land_area IS NOT NULL;

UPDATE land_attributes
SET land_area = REPLACE(land_area, ' ', '')
WHERE land_area IS NOT NULL;

UPDATE land_attributes
SET land_area = TRIM(land_area);

UPDATE land_attributes
SET land_area = REPLACE(land_area, ',', '.')
WHERE land_area IS NOT NULL;

ALTER TABLE land_attributes
MODIFY COLUMN land_area DECIMAL(12, 1);

UPDATE land_attributes l
JOIN offer_attributes o
	ON l.offer_id = o.offer_id
SET l.land_area = o.area
WHERE l.land_area != o.area;

ALTER TABLE land_attributes
MODIFY COLUMN land_area INT;

UPDATE land_attributes
SET terrain = 'gently sloped'
WHERE terrain = 'Mierne svahovitý';

UPDATE land_attributes
SET terrain = 'terraced'
WHERE terrain = 'Terasovitý';

UPDATE land_attributes
SET terrain = 'flat'
WHERE terrain = 'Rovinatý';

UPDATE land_attributes
SET terrain = 'mostly flat'
WHERE terrain = 'Prevažne rovinatý';

UPDATE land_attributes
SET terrain = 'other'
WHERE terrain = 'Iná značka';

UPDATE land_attributes
SET terrain = 'sloped'
WHERE terrain = 'Strmý svah';

UPDATE land_attributes
SET terrain = NULL
WHERE terrain = '';

ALTER TABLE land_attributes
MODIFY COLUMN terrain ENUM('gently sloped', 'terraced', 'flat', 'mostly flat', 'other', 'sloped') NULL;

SELECT *
FROM land_attributes;


