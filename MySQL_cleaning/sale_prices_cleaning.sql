USE real_estates;

    
SELECT a.*, p.*
FROM offer_attributes a
JOIN sale_prices p
	ON a.offer_id = p.offer_id
WHERE a.offer_type = 'rent';

DELETE FROM sale_prices s
WHERE s.offer_id IN(
	SELECT a.offer_id
    FROM offer_attributes a
    WHERE a.offer_type != 'sale');
    
UPDATE sale_prices
SET price = REPLACE(price, '€', '')
WHERE price != '';

UPDATE sale_prices
SET price = REPLACE(price, ' ', '')
WHERE price != '';

UPDATE sale_prices
SET price = REPLACE(price, ',', '.')
WHERE price != '';

UPDATE sale_prices
SET price = TRIM(price);

UPDATE sale_prices
SET price = NULL
WHERE price = '';

UPDATE sale_prices
SET price = 175000
WHERE offer_id = 'JuHbG5bC-AQ';

UPDATE sale_prices
SET price_m2 = REPLACE(price_m2, ' €/m?', '')
WHERE price_m2 != '';

UPDATE sale_prices
SET price_m2 = REPLACE(price_m2, ',', '.')
WHERE price_m2 != '';

UPDATE sale_prices
SET price_m2 = REPLACE(price_m2, ' ', '')
WHERE price_m2 != '';

UPDATE sale_prices
SET price_m2 = NULL
WHERE price_m2 = '';

UPDATE sale_prices
SET price_m2 = ROUND(175000 / 240, 2)
WHERE offer_id = 'JuHbG5bC-AQ';

ALTER TABLE sale_prices
CHANGE COLUMN price price DECIMAL(12, 2);

ALTER TABLE sale_prices
CHANGE COLUMN price_m2 price_m2 DECIMAL(12, 2);

SELECT *
FROM sale_prices;