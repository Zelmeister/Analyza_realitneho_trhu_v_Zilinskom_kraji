USE real_estates;

UPDATE apartment_attributes
SET position = 'ground floor'
WHERE position = 'Prízemie';

UPDATE apartment_attributes
SET position = 'top floor'
WHERE position = 'Posledné podlažie';

UPDATE apartment_attributes
SET position = 'top floor'
WHERE position = 'Posledné podlažie';

UPDATE apartment_attributes
SET position = 'raised ground floor'
WHERE position = 'Zvýšené prízemie';

UPDATE apartment_attributes
SET position = 'basement'
WHERE position = 'Suterén';

UPDATE apartment_attributes
SET position = 'attic'
WHERE position = 'Vstavba podkrovia';

UPDATE apartment_attributes
SET position = 'added floor'
WHERE position = 'Nadstavba';

UPDATE apartment_attributes
SET position = 'upper floor'
WHERE position = 'Ďalšie nadzemné podlažie';

ALTER TABLE apartment_attributes
ADD COLUMN elevator ENUM('yes', 'no') NULL AFTER floor;

UPDATE apartment_attributes
SET elevator = 'yes'
WHERE floor LIKE '%výťah%';

UPDATE apartment_attributes
SET position = NULL
WHERE position = '';

UPDATE apartment_attributes
SET floor = NULL
WHERE floor = '';

UPDATE apartment_attributes
SET floor = SUBSTRING_INDEX(floor, ' +', 1)
WHERE floor IS NOT NULL
	AND floor LIKE '%výťah%';

ALTER TABLE apartment_attributes
ADD COLUMN floors_num INT NULL AFTER floor;

UPDATE apartment_attributes
SET floors_num = SUBSTRING_INDEX(floor, '/', -1)
WHERE floor IS NOT NULL
	AND floor LIKE '%/%';
    
UPDATE apartment_attributes
SET floors_num = SUBSTRING_INDEX(floor, '.', -1)
WHERE floor IS NOT NULL
	AND floor LIKE '%.%';
    
UPDATE apartment_attributes
SET floor = SUBSTRING_INDEX(floor, '/', 1)
WHERE floor IS NOT NULL
	AND floor LIKE '%/%';
    
UPDATE apartment_attributes
SET floor = SUBSTRING_INDEX(floor, '.', 1)
WHERE floor IS NOT NULL
	AND floor LIKE '%.%';
    
ALTER TABLE apartment_attributes
CHANGE COLUMN floors_num total_floors INT;

UPDATE apartment_attributes
SET position = 'ground floor'
WHERE position IS NULL
	AND (floor IS NOT NULL
		OR total_floors IS NOT NULL)
	AND floor = 1;
    
UPDATE apartment_attributes
SET position = 'top floor'
WHERE position IS NULL
	AND (floor IS NOT NULL
		OR total_floors IS NOT NULL)
	AND floor = total_floors;
    
UPDATE apartment_attributes
SET position = 'basement'
WHERE offer_id = 'JuPLeekzh_5';

UPDATE apartment_attributes
SET position = 'basement'
WHERE floor = 0;

UPDATE apartment_attributes
SET total_floors = 6
WHERE offer_id = 'Ju3fRh58rlQ';

UPDATE apartment_attributes
SET total_floors = 3
WHERE offer_id = 'JuPLeekzh_5';

UPDATE apartment_attributes
SET position = 'upper floor'
WHERE position IS NULL
	AND (floor IS NOT NULL
		OR total_floors IS NOT NULL)
	AND floor != 1
    AND floor != 0
    AND floor < total_floors;
    
UPDATE apartment_attributes
SET position = 'upper floor'
WHERE position IS NULL
	AND (floor IS NOT NULL
		OR total_floors IS NOT NULL);
    
UPDATE apartment_attributes
SET total_floors = floor
WHERE offer_id IN (
	'JuDCMQupxo0',
	'JuDetN4gLGy',
	'JuU5AQijDSV',
	'JuIYGEaJFQ7',
	'Ju7W5q5NyuP',
	'JuXxgiFzaw2',
	'Ju23LHSYosl',
	'Ju_1ltAlD0n',
	'JugCrJ6aqt6');
    
UPDATE apartment_attributes
SET floor = 1
WHERE offer_id IN (
	'JuDCMQupxo0',
	'JuDetN4gLGy',
	'JuU5AQijDSV',
	'JuIYGEaJFQ7',
	'Ju7W5q5NyuP',
	'JuXxgiFzaw2',
	'Ju23LHSYosl',
	'Ju_1ltAlD0n',
	'JugCrJ6aqt6');

UPDATE apartment_attributes
SET position = 'ground floor'
WHERE offer_id IN (
	'JuDCMQupxo0',
	'JuDetN4gLGy',
	'JuU5AQijDSV',
	'JuIYGEaJFQ7',
	'Ju7W5q5NyuP',
	'JuXxgiFzaw2',
	'Ju23LHSYosl',
	'Ju_1ltAlD0n',
	'JugCrJ6aqt6');

UPDATE apartment_attributes
SET floor = total_floors
WHERE offer_id IN (
	'Juo9yc6U_zm',
	'JuEg-jxdD7t',
	'Ju-fM3SCXjma',
	'JuzxsN9HYse',
	'Ju0vPaBxKXU');
    
UPDATE apartment_attributes
SET total_floors = 7
WHERE offer_id = 'Juo9yc6U_zm';

UPDATE apartment_attributes
SET total_floors = 5
WHERE offer_id = 'JuEg-jxdD7t';

UPDATE apartment_attributes
SET total_floors = 4
WHERE offer_id = 'Ju-fM3SCXjma';

UPDATE apartment_attributes
SET total_floors = 3
WHERE offer_id = 'JuzxsN9HYse';

UPDATE apartment_attributes
SET total_floors = 6
WHERE offer_id = 'Ju0vPaBxKXU';

UPDATE apartment_attributes
SET total_floors = 2
WHERE offer_id IN (
	'JuniaoRdvqE',
	'Ju6w7wQRZXw',
	'JumDGD_wH9E');
    
UPDATE apartment_attributes
SET floor = 1
WHERE offer_id IN (
	'JuniaoRdvqE',
	'Ju6w7wQRZXw',
	'JumDGD_wH9E');    
    
UPDATE apartment_attributes
SET position = 'ground floor'
WHERE offer_id IN (
	'JuniaoRdvqE',
	'Ju6w7wQRZXw',
	'JumDGD_wH9E');   
    
UPDATE apartment_attributes
SET total_floors = 3
WHERE offer_id = 'JuxYMJGR4NW';

UPDATE apartment_attributes
SET floor = 2
WHERE offer_id = 'JuxYMJGR4NW';

UPDATE apartment_attributes
SET position = 'upper floor'
WHERE offer_id = 'JuxYMJGR4NW';

UPDATE apartment_attributes
SET position = 'upper floor'
WHERE floor != total_floors
	AND position = 'top floor';
    
UPDATE apartment_attributes
SET position = 'ground floor' 
WHERE floor = 1
	AND position != 'ground floor'
	AND position != 'raised ground floor'
    AND position = 'upper floor';
    
UPDATE apartment_attributes
SET position = 'ground floor' 
WHERE floor = 1
	AND position != 'ground floor'
	AND position != 'raised ground floor'
    AND total_floors = 1;
    
UPDATE apartment_attributes
SET floor = 0
WHERE offer_id = 'JuZFqxjae7G'; 

UPDATE apartment_attributes
SET floor = 3
WHERE offer_id = 'JuRJMz106O3'; 

UPDATE apartment_attributes
SET position = 'ground floor'
WHERE floor = 1
	AND position != 'ground floor'
	AND position != 'raised ground floor';
    
ALTER TABLE apartment_attributes
ADD COLUMN north ENUM('yes') NULL AFTER heating;

ALTER TABLE apartment_attributes
ADD COLUMN south ENUM('yes') NULL AFTER north;

ALTER TABLE apartment_attributes
ADD COLUMN east ENUM('yes') NULL AFTER south;

ALTER TABLE apartment_attributes
ADD COLUMN west ENUM('yes') NULL AFTER east;

UPDATE apartment_attributes
SET north = 'yes'
WHERE orientation LIKE '%sever%';

UPDATE apartment_attributes
SET south = 'yes'
WHERE orientation LIKE '%juh%';

UPDATE apartment_attributes
SET east = 'yes'
WHERE orientation LIKE '%východ%';

UPDATE apartment_attributes
SET west = 'yes'
WHERE orientation LIKE '%západ%';

ALTER TABLE apartment_attributes
DROP COLUMN orientation;

UPDATE apartment_attributes
SET built_in = NULL
WHERE built_in = '';

ALTER TABLE apartment_attributes
MODIFY built_in INT;

UPDATE apartment_attributes
SET energy_certificate = NULL
WHERE energy_certificate = '';

UPDATE apartment_attributes
SET energy_certificate = 'not available'
WHERE energy_certificate = 'Nie je';

UPDATE apartment_attributes
SET energy_certificate = 'in preparation'
WHERE energy_certificate = 'V príprave';

ALTER TABLE apartment_attributes
DROP COLUMN heating;

SELECT *
FROM apartment_attributes;