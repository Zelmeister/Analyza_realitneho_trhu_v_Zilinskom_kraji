USE real_estates;

UPDATE house_attributes
SET house_area = SUBSTRING_INDEX(house_area, ' m', 1);

UPDATE house_attributes
SET house_area = REPLACE(house_area, ' ', '');

UPDATE house_attributes
SET house_area = TRIM(house_area);

UPDATE offer_attributes
SET area = REPLACE(area, ' ', ''); 

UPDATE offer_attributes
SET area = TRIM(area);

UPDATE house_attributes
SET land_area = SUBSTRING_INDEX(land_area, ' m', 1);

UPDATE house_attributes
SET land_area = REPLACE(land_area, ' ', '');

UPDATE house_attributes
SET land_area = TRIM(land_area);

UPDATE house_attributes
SET house_area = NULL
WHERE house_area = '';

UPDATE house_attributes
SET land_area = NULL
WHERE land_area = '';

UPDATE house_attributes
SET land_area = REPLACE(land_area, ',', '.');

ALTER TABLE house_attributes
MODIFY COLUMN house_area INT;

ALTER TABLE house_attributes
MODIFY COLUMN land_area DECIMAL(10, 1);

UPDATE house_attributes
SET built_up_area = SUBSTRING_INDEX(built_up_area, ' m', 1);

UPDATE house_attributes
SET built_up_area = REPLACE(built_up_area, ' ', '');

UPDATE house_attributes
SET built_up_area = TRIM(built_up_area);

UPDATE house_attributes
SET built_up_area = NULL
WHERE built_up_area = '';

UPDATE house_attributes
SET built_up_area = REPLACE(built_up_area, ',', '.');

ALTER TABLE house_attributes
MODIFY COLUMN built_up_area DECIMAL(10, 1);

UPDATE house_attributes
SET terrain = 'other'
WHERE terrain = 'Iná značka';

UPDATE house_attributes
SET terrain = 'gently sloped'
WHERE terrain = 'Mierne svahovitý';

UPDATE house_attributes
SET terrain = 'mostly flat'
WHERE terrain = 'Prevažne rovinatý';

UPDATE house_attributes
SET terrain = 'flat'
WHERE terrain = 'Rovinatý';

UPDATE house_attributes
SET terrain = 'sloped'
WHERE terrain = 'Svahovitý';

UPDATE house_attributes
SET terrain = 'terraced'
WHERE terrain = 'Terasovitý';

UPDATE house_attributes
SET terrain = NULL
WHERE terrain = '';

# Too few yes values (65), no - 258, null - 558
ALTER TABLE house_attributes
DROP COLUMN storage_space;

SELECT energy_certificate, COUNT(energy_certificate)
FROM house_attributes
GROUP BY energy_certificate;

UPDATE house_attributes
SET energy_certificate = 'not available'
WHERE energy_certificate = 'nie je';

UPDATE house_attributes
SET energy_certificate = 'in preparation'
WHERE energy_certificate = 'v príprave';

UPDATE house_attributes
SET energy_certificate = NULL
WHERE energy_certificate = '';

UPDATE house_attributes
SET electricity = 'on-site'
WHERE electricity = 'Na pozemku - 400 V'
	OR electricity = 'Na pozemku - 230 V'
    OR electricity = 'Na pozemku - 230 V, Na pozemku - 400 V'
    OR electricity = 'Na pozemku'
    OR electricity = 'Na pozemku - 230 V, Na pozemku - 400 V, Rozvodňa'
    OR electricity = 'Na pozemku - 230 V, Pri pozemku - 400 V'
    OR electricity = 'Na pozemku, Na pozemku - 230 V, Na pozemku - 400 V';
    
UPDATE house_attributes
SET electricity = 'at property line'
WHERE electricity = 'Pri pozemku - 230 V'
	OR electricity = 'Pri pozemku - 230 V, Pri pozemku - 400 V';
    
UPDATE house_attributes
SET electricity = 'not available'
WHERE electricity = 'Nedostupné'
	OR electricity = 'Rozvodňa';
    
UPDATE house_attributes
SET electricity = NULL
WHERE electricity = '';

ALTER TABLE house_attributes
MODIFY COLUMN electricity ENUM('on-site', 'at property line', 'not available') NULL;

ALTER TABLE house_attributes
MODIFY COLUMN terrain ENUM('flat', 'gently sloped', 'sloped', 'mostly flat', 'terraced', 'other') NULL;

ALTER TABLE house_attributes
MODIFY COLUMN energy_certificate ENUM('not available', 'A', 'B', 'C', 'D', 'E', 'F', 'in preparation') NULL;

UPDATE house_attributes
SET water = 'public water'
WHERE water = 'Na pozemku - Diaľkový vodovod'
	OR water = 'Na pozemku - Diaľkový vodovod, Na pozemku - Studňa'
    OR water = 'Pri pozemku - Verejný vodovod'
    OR water = 'Na pozemku - Studňa, Pri pozemku - Verejný vodovod'
    OR water = 'Na pozemku - Diaľkový vodovod, Pri pozemku - Verejný vodovod'
    OR water = 'Na pozemku - Diaľkový vodovod, Na pozemku - Studňa, Pri pozemku - Verejný vodovod'
    OR water = 'Pri pozemku - Verejný vodovod, Pri pozemku - Studňa';
    
UPDATE house_attributes
SET water = 'well'
WHERE water = 'Na pozemku - Studňa'
	OR water = 'Na pozemku'
    OR water = 'Pri pozemku'
    OR water = 'Pri pozemku - Studňa';
    
UPDATE house_attributes
SET water = 'not available'
WHERE water = 'Nedostupné';

UPDATE house_attributes
SET water = NULL
WHERE water = '';

ALTER TABLE house_attributes
MODIFY COLUMN water ENUM('well', 'public water', 'not available') NULL;


SELECT *
FROM house_attributes;

