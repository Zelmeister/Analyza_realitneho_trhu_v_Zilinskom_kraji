USE real_estates;

DELETE FROM rent_prices p
WHERE p.offer_id IN (
	SELECT a.offer_id
    FROM offer_attributes a
    WHERE a.offer_type != 'rent');
    
UPDATE rent_prices
SET monthly_rent = NULL
WHERE monthly_rent = '';

UPDATE rent_prices
SET monthly_rent_m2 = NULL
WHERE monthly_rent_m2 = '';

UPDATE rent_prices
SET monthly_rent = REPLACE(monthly_rent, ' ', '');

UPDATE rent_prices
SET monthly_rent = SUBSTRING_INDEX(monthly_rent, '€', 1)
WHERE monthly_rent IS NOT NULL;

UPDATE rent_prices
SET monthly_rent = REPLACE(monthly_rent, ' ', '')
WHERE monthly_rent IS NOT NULL;

UPDATE rent_prices
SET monthly_rent = TRIM(monthly_rent)
WHERE monthly_rent IS NOT NULL;

UPDATE rent_prices
SET monthly_rent = REPLACE(monthly_rent, ',', '.')
WHERE monthly_rent IS NOT NULL;

ALTER TABLE rent_prices
MODIFY COLUMN monthly_rent INT;
    
UPDATE rent_prices
SET monthly_rent_m2 = SUBSTRING_INDEX(monthly_rent_m2, ' €', 1)
WHERE monthly_rent_m2 IS NOT NULL;

UPDATE rent_prices
SET monthly_rent_m2 = REPLACE(monthly_rent_m2, ',', '.');

UPDATE rent_prices
SET monthly_rent_m2 = TRIM(monthly_rent_m2);

ALTER TABLE rent_prices
MODIFY COLUMN monthly_rent_m2 DECIMAl(6, 2);

UPDATE rent_prices
SET monthly_rent_m2 = ROUND(590/37, 2)
WHERE offer_id = 'Ju4jUNHrCaa';

SELECT *
FROM rent_prices;