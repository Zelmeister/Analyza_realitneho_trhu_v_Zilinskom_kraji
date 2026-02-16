USE real_estates;

ALTER TABLE offer_attributes
CHANGE COLUMN area_m2 `area` VARCHAR(255);

UPDATE offer_attributes
SET offer_type = 'sale'
WHERE offer_type = 'Predaj';

UPDATE offer_attributes
SET offer_type = 'rent'
WHERE offer_type = 'Prenájom';

UPDATE offer_attributes
SET property_type = 'commercial space'
WHERE property_type = 'Priestor';

UPDATE offer_attributes
SET property_type = 'land'
WHERE property_type = 'Pozemok';

UPDATE offer_attributes
SET property_type = 'maisonette'
WHERE property_type = 'Mezonet';

UPDATE offer_attributes
SET property_type = 'loft'
WHERE property_type = 'Loft';

UPDATE offer_attributes
SET property_type = 'other apartment type'
WHERE property_type = 'Iný byt';

UPDATE offer_attributes
SET property_type = 'studio apartment'
WHERE property_type = 'Garsónka';

UPDATE offer_attributes
SET property_type = 'house'
WHERE property_type = 'Dom';

UPDATE offer_attributes
SET property_type = 'holiday apartment'
WHERE property_type = 'Apartmán';

UPDATE offer_attributes
SET property_type = '5+ room apartment'
WHERE property_type = '5 a viac izbový byt';

UPDATE offer_attributes
SET property_type = '4-room apartment'
WHERE property_type = '4 izbový byt';

UPDATE offer_attributes
SET property_type = '3-room apartment'
WHERE property_type = '3 izbový byt';

UPDATE offer_attributes
SET property_type = '2-room apartment'
WHERE property_type = '2 izbový byt';

UPDATE offer_attributes
SET property_type = '1-room apartment'
WHERE property_type = '1 izbový byt';

UPDATE offer_attributes
SET `area` = SUBSTRING_INDEX(`area`, ' ', 1)
WHERE `area` != '';

UPDATE offer_attributes
SET `condition` = 'fully renovated'
WHERE `condition` = 'Kompletná rekonštrukcia';

UPDATE offer_attributes
SET `condition` = 'new construction'
WHERE `condition` = 'Novostavba';

UPDATE offer_attributes
SET `condition` = 'unrenovated'
WHERE `condition` = 'Pôvodný stav';

UPDATE offer_attributes
SET `condition` = 'partially renovated'
WHERE `condition` = 'Čiastočná rekonštrukcia';

UPDATE offer_attributes
SET `condition` = 'under construction'
WHERE `condition` = 'Vo výstavbe';

UPDATE offer_attributes
SET `condition` = 'development project'
WHERE `condition` = 'Developerský projekt';

UPDATE offer_attributes
SET ownership = 'private'
WHERE ownership = 'Osobné';

UPDATE offer_attributes
SET ownership = 'corporate'
WHERE ownership = 'Firemné';

UPDATE offer_attributes
SET ownership = 'other'
WHERE ownership = 'Iné';

UPDATE offer_attributes
SET ownership = 'municipal'
WHERE ownership = 'Obecné';

UPDATE offer_attributes
SET ownership = 'cooperative'
WHERE ownership = 'Družstevné';

UPDATE offer_attributes
SET ownership = 'unsettled'
WHERE ownership = 'Nevysporiadané';

UPDATE offer_attributes
SET `area` = NULL
WHERE `area` = '';

UPDATE offer_attributes
SET `condition` = NULL
WHERE `condition` = '';

UPDATE offer_attributes
SET ownership = NULL
WHERE ownership = '';

SELECT *
FROM offer_attributes
WHERE `area` = '';