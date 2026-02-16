# Last part of the string is the district
UPDATE offer_locations
SET location_district = SUBSTRING_INDEX(location, ',', -1);

# Middle part of the string is the city/village
UPDATE offer_locations
SET location_city = SUBSTRING_INDEX(SUBSTRING_INDEX(location, ',', -2), ',', 1);

# Strip white spaces
UPDATE offer_locations
SET location_city = TRIM(location_city);
UPDATE offer_locations
SET location_district = TRIM(location_district);


# OKRES BYTČA
-- location_area will be added only for Bytča
-- the rest is small villages

UPDATE offer_locations
SET location_area = 'centrum'
WHERE location_city = 'Bytča'
	AND title LIKE '%centr%';
    
UPDATE offer_locations
SET location_area = 'Veľká Bytča'
WHERE location_city = 'Bytča'
    AND title LIKE '%Veľká Bytča%';
    
UPDATE offer_locations
SET location_area = 'Thurzove sady'
WHERE location_city = 'Bytča'
    AND (title LIKE '%Jablone%'
    OR title LIKE '%Thurz%');

UPDATE offer_locations
SET location_city = 'Jablonové'
WHERE location_city = 'Bytča'
    AND title LIKE '%Jablo%';
    
UPDATE offer_locations
SET location_area = 'Hliník nad Váhom'
WHERE location_city = 'Bytča'
    AND title LIKE '%Hliník%';

UPDATE offer_locations
SET location_city = 'Bytča'
WHERE location_city = 'Hliník nad Váhom'
    AND title LIKE '%Hliník%';
    
UPDATE offer_locations
SET location_city = 'Veľké Rovné'
WHERE location_city = 'Bytča'
    AND title LIKE '%Rovn%';
    
UPDATE offer_locations
SET location_area = 'Pšurnovice'
WHERE location_city = 'Bytča'
    AND title LIKE '%Pšurnovic%';
    
UPDATE offer_locations
SET location_city = 'Hlboké nad Váhom'
WHERE location_city = 'Bytča'
    AND title LIKE '%Hlbok%';

UPDATE offer_locations
SET location_city = 'Predmier'
WHERE location_city = 'Bytča'
    AND title LIKE '%Predmier%';

UPDATE offer_locations
SET location_city = 'Kolárovice'
WHERE location_city = 'Bytča'
    AND title LIKE '%Kolárovic%';

UPDATE offer_locations
SET location_area = 'Veľká Bytča'
WHERE location_city = 'Bytča'
	AND location_area = 'centrum';
    
UPDATE offer_locations
SET location_area = 'Veľká Bytča'
WHERE location_city = 'Bytča'
    AND (location LIKE '%Sidónie Sakalovej%'
        OR location LIKE '%Pod Hájom%'
        OR location LIKE '%Okružná%'
        OR location LIKE '%Námestie Slovenskej Republiky%'
        OR location LIKE '%Na Sahare%'
        OR location LIKE '%Hlinkova%');
        
UPDATE offer_locations
SET location_area = 'Thurzove sady'
WHERE location_city = 'Bytča'
    AND (location LIKE '%Višňová%'
		OR location LIKE '%Morušová%');
        
UPDATE offer_locations
SET location_area = 'Bytča - sever'
WHERE location_city = 'Bytča'
    AND location LIKE '%Družstevná%';
    
UPDATE offer_locations
SET location_city = 'Petrovice'
WHERE location_city = 'Bytča'
    AND title LIKE '%Petrovice%';

DELETE FROM offer_locations
WHERE location_city = 'Bytča'
    AND location LIKE '%Streženice%';
    
UPDATE offer_locations
SET location_area = 'Bytča - sever'
WHERE offer_id = 'JujFiU7wF23'
	OR offer_id = 'JuDeXKjjRHY'
    OR offer_id = 'Juu_JI3IbCE'
    OR offer_id = 'JubcbkupV-K'
    OR offer_id = 'Ju48Cz332dR';


UPDATE offer_locations
SET location_area = 'Hliník nad Váhom'
WHERE offer_id = 'JuHgJ7Vnt5C'
	OR offer_id = 'JuGmc6FHo9t';
    
    
UPDATE offer_locations
SET location_area = 'Pšurnovice'
WHERE offer_id = 'JuzXf_udfUb';


UPDATE offer_locations
SET location_city = ''
WHERE offer_id = 'JuFjy1TVvsF';


# OKRES ŽILINA
-- location_area will be added only for Žilina
-- the rest is small towns and villages

UPDATE offer_locations
SET location_area = 'Vlčince'
WHERE location_city = 'Žilina'
 AND location_area = ''
 AND title LIKE '%Vlčinc%';
 
UPDATE offer_locations
SET location_area = 'Bôrik'
WHERE location_city = 'Žilina'
 AND location_area = ''
 AND title LIKE '%Bôrik%';

UPDATE offer_locations
SET location_area = 'Hliny'
WHERE location_city = 'Žilina'
 AND location_area = ''
 AND title LIKE '%Hlin%';
 
UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE location_city = 'Žilina'
 AND location_area = ''
 AND title LIKE '%centr%'
 AND location LIKE 'Žilina%';
 
UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE location_city = 'Žilina'
 AND location_area = ''
 AND title LIKE '%centr%'
 AND location NOT LIKE '%Daxnerov%'
 AND location NOT LIKE '%Lichard%';
 
UPDATE offer_locations
SET location_area = 'Solinky'
WHERE location_city = 'Žilina'
	AND location_area = ''
	AND title LIKE '%Solink%';
 
UPDATE offer_locations
SET location_area = 'Hliny'
WHERE location_city = 'Žilina'
 AND location_area = ''
 AND title LIKE '%Bulvár%';

UPDATE offer_locations
SET location_area = 'Budatín'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Budatín%'
    AND location NOT LIKE '%Lehota%';
    
UPDATE offer_locations
SET location_area = 'Bytčica'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Bytčic%';
    
UPDATE offer_locations
SET location_area = 'Hájik'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Hájik%';
    
UPDATE offer_locations
SET location_area = 'Hliny'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Hliny%';
    
UPDATE offer_locations
SET location_area = 'Malá Praha'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Malá Praha%';

UPDATE offer_locations
SET location_area = 'Považský Chlmec'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Považský Chlmec%';
    
UPDATE offer_locations
SET location_area = 'Rosinky'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Rosinky%';

UPDATE offer_locations
SET location_area = 'Bôrik'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN ('Amfiteáter');

UPDATE offer_locations
SET location_area = 'Budatín'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN ('Azúrová', 'Dolná', 'Horná', 'Lúčna', 'Radová');

UPDATE offer_locations
SET location_area = 'Vlčince'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'B.S. Timravy', 'Berlínska', 'Dobšinského', 'Karpatská', 
        'Minčolská', 'Námestie Ľudovíta Fullu', 'Pittsburgská', 
        'Poštová 3', 'Pražská', 'Pražská 9056', 'Pražská 9057', 
        'REZIDENCIA LESOPARK', 'Rosinská');
        
UPDATE offer_locations
SET location_area = 'Hliny'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Bajzova', 'Čajakova', 'Lichardova', 'Saleziánska');

UPDATE offer_locations
SET location_area = 'Brodno'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN ('Brodňanská');
    
UPDATE offer_locations
SET location_area = 'Strážov'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Bukovinská', 'Hričovská', 'Prieložná');
 
UPDATE offer_locations
SET location_area = 'Bytčica'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Bystrická', 'Dlhá', 'Na Záchrastí', 'Pažite', 'Pod dielce');
        
UPDATE offer_locations
SET location_area = 'Trnové'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Chotárna', 'Cintorínska', 'Do Brezičia', 'Do Mažiarca', 
        'Dolná Trnovská', 'Dunajská', 'Laborecká', 'Na Bárek', 
        'Na kopci', 'Ovocinárska', 'Potoky', 'Slnečnicová');

UPDATE offer_locations
SET location_area = ''
WHERE offer_id = 'JuNZupA7Ru4';

UPDATE offer_locations
SET location_city = 'Rajecké Teplice'
WHERE offer_id = 'JuNZupA7Ru4';

UPDATE offer_locations
SET location_city = 'Rajecké Teplice'
WHERE offer_id = 'JuNZupA7Ru4';

UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'
WHERE location_city = 'Žilina'
	AND title LIKE '%Kamence%';

UPDATE offer_locations
SET location_area = 'Kamence'
WHERE location_city = 'Žilina'
	AND title LIKE '%Kamence%';
    
UPDATE offer_locations
SET location_city = 'Kysucké Nové Mesto'
WHERE location_city = 'Žilina'
	AND title LIKE '%Kamence%';

UPDATE offer_locations
SET location_city = 'Dlhé Pole'
WHERE title LIKE '%Dlh%'
	AND title LIKE '%Pol%'
    AND location_city != 'Dlhé Pole';

UPDATE offer_locations
SET location_area = 'Trnové'
WHERE title LIKE '%Trnov%'
	AND title NOT LIKE '%Trnovec%'
    AND title NOT LIKE '%Trnovc%'
    AND location_city NOT LIKE '%Trnovo%';
    
UPDATE offer_locations
SET location_city = 'Porúbka'    
WHERE title LIKE '%Porúbk%'
	AND location_district = 'okres Žilina';
    
UPDATE offer_locations
SET location_area = ''    
WHERE title LIKE '%Bitarov%'
	AND location_district = 'okres Žilina'
    AND location_city != 'Bitarová';
    
UPDATE offer_locations
SET location_city = 'Bitarová'    
WHERE title LIKE '%Bitarov%'
	AND location_district = 'okres Žilina'
    AND location_city != 'Bitarová';
    
UPDATE offer_locations
SET location_city = 'Varín'    
WHERE title LIKE '%Varín%'
	AND location_district = 'okres Žilina'
    AND location_city != 'Varín';
    
UPDATE offer_locations
SET location_city = 'Stránske'    
WHERE title LIKE '%Stránsk%'
	AND location_district = 'okres Žilina'
    AND location_city != 'Stránske';
    
UPDATE offer_locations
SET location_city = 'Marčk'    
WHERE offer_id = 'JuRanZisa5Z';

UPDATE offer_locations
SET location_city = ''    
WHERE offer_id = 'JuG-JRPmhAG';

UPDATE offer_locations
SET location_area = 'Bytčica'    
WHERE offer_id = 'JuiNBbsX-1P';
    
UPDATE offer_locations
SET location_city = ''    
WHERE offer_id = 'Ju3IlwS0uHk';

UPDATE offer_locations
SET location_city = 'Hôrky'    
WHERE offer_id = 'Ju3IEZxl8sI';

UPDATE offer_locations
SET location_city = 'Hôrky'  
WHERE offer_id = 'JuRjiZLlPKY';

UPDATE offer_locations
SET location_city = 'Rudina'  
WHERE offer_id = 'Juz77F3qzjt';

UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'  
WHERE offer_id = 'Juz77F3qzjt';

UPDATE offer_locations
SET location_area = 'Malá Praha'  
WHERE location_city = 'Žilina'
	AND title LIKE '%Mal%'
    AND title lIKE '%Prah%';

UPDATE offer_locations
SET location_area = 'Staré mesto'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Dolný Val', 'Frańa Mráza', 'Hálkova', 'Hálkova 9092', 'Hollého', 
        'Kukučínova', 'Moyzesova', 'Murgašova', 'Nám. gen. M. R. Štefánika', 
        'Národná', 'Pod Hôrkou', 'Predmestská', 'Pri celulózke 40', 'Republiky', 
        'Revolučná 16', 'Sládkovičova', 'Športová 2', 'Staré mesto');

UPDATE offer_locations
SET location_area = 'Bánová'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Družstevná', 'Jabloňová');

UPDATE offer_locations
SET location_area = 'Solinky'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Jaseňová', 'Javorová');

UPDATE offer_locations
SET location_area = 'Rosinky'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Jazmínová');
        
UPDATE offer_locations
SET location_area = 'Závodie'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Juraja Závodského', 'Kvačalova', 'Kvačalova 1216/49', 
        'Kvačalova ulica', 'Pod Sadom');
        
UPDATE offer_locations
SET location_area = 'Hájik'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Mateja Bela', 'Mikovíniho', 'Segnerova', 'Slnečné námestie', 'Slnečné námestie 1');
        
UPDATE offer_locations
SET location_area = 'Žilinská Lehota'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND SUBSTRING_INDEX(location, ',', 1) IN (
		'Na cintorín', 'Pod Dúbravou');

UPDATE offer_locations
SET location_area = 'Hájik'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Hájik%';
    
UPDATE offer_locations
SET location_area = 'Bytčica'  
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Bytčic%';
    
UPDATE offer_locations
SET location_area = 'Budatín'  
WHERE location_city = 'Žilina'
	AND location_area = ''
	AND title LIKE '%Budatín%'
    AND title NOT LIKE '%Lehot%';
    
UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'
WHERE location_city = 'Žilina'
	AND location_area = ''
	AND title LIKE '%Budatín%'
    AND title LIKE '%Lehot%';
    
UPDATE offer_locations
SET location_area = 'Budatínska Lehota'
WHERE location_city = 'Žilina'
	AND location_area = ''
	AND title LIKE '%Budatín%'
    AND title LIKE '%Lehot%';    

UPDATE offer_locations
SET location_city = 'Kysucké Nové Mesto'
WHERE location_city = 'Žilina'
	AND title LIKE '%Budatín%'
    AND title LIKE '%Lehot%'; 
    
UPDATE offer_locations
SET location_area = 'Hájik'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%SCENÉRI%';
    
UPDATE offer_locations
SET location_area = 'Závodie'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Závod%';

UPDATE offer_locations
SET location_area = 'Brodno'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Brodn%';
    
UPDATE offer_locations
SET location_area = 'Bánová'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Bánov%';
    
UPDATE offer_locations
SET location_area = 'Žilinská Lehota'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location NOT LIKE 'Žilina%'
    AND location LIKE '%Žilinská Lehota%';
    
UPDATE offer_locations
SET location_area = 'Zádubnie'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Zádubn%';
    
UPDATE offer_locations
SET location_area = 'Vlčince'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%EUROTERRACE%';
    
UPDATE offer_locations
SET location_city = 'Terchová'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Terchov%';
    
UPDATE offer_locations
SET location_city = 'Brezany'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Brezan%';
    
UPDATE offer_locations
SET location_area = 'Hájik'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Hôrecká%';
    
UPDATE offer_locations
SET location_area = 'Vlčince'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Vlčinc%';
    
UPDATE offer_locations
SET location_area = 'Vlčince'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Vysokoškolákov%';
    
UPDATE offer_locations
SET location_city = 'Višňové'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Višňov%';
    
UPDATE offer_locations
SET location_city = 'Strečno'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Strečn%';
    
UPDATE offer_locations
SET location_city = 'Dolný Hričov'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Hrič%';
    
UPDATE offer_locations
SET location_city = 'Terchová'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Terch%';
    
UPDATE offer_locations
SET location_area = 'Bôrik'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND location LIKE '%Tajovskéh%';

UPDATE offer_locations
SET location_area = 'Vlčince'
WHERE offer_id = 'JuewVCwJvGy';

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id = 'Jul4sW3x805';

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id = 'JuyOHLJxsdS';

UPDATE offer_locations
SET location_area = 'Strážov'
WHERE offer_id = 'Jut36Rci3LJ';

UPDATE offer_locations
SET location_city = 'Rajec'
WHERE offer_id = 'JuAyS5TfUDQ';

UPDATE offer_locations
SET location_city = 'Martin'
WHERE offer_id = 'JuV3Qm6Wkc0';

UPDATE offer_locations
SET location_area = 'Priekopa'
WHERE offer_id = 'JuV3Qm6Wkc0';

UPDATE offer_locations
SET location_city = 'Maršová - Rašov'
WHERE offer_id = 'JumrPKthwP7';

UPDATE offer_locations
SET location_district = 'okres Bytča'
WHERE offer_id = 'JumrPKthwP7';

UPDATE offer_locations
SET location_city = 'Lietavská Lúčka'
WHERE offer_id = 'JuRG-vEhd9B';

UPDATE offer_locations
SET location_city = 'Kysucký Lieskovec'
WHERE offer_id = 'Ju-hUCgY0a1';

UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'
WHERE offer_id = 'Ju-hUCgY0a1';

UPDATE offer_locations
SET location_area = 'Hliny'
WHERE offer_id = 'JuPxUBuwHJ4';

UPDATE offer_locations
SET location_city = 'Horný Hričov'
WHERE offer_id = 'Juq924pqMXb';

UPDATE offer_locations
SET location_area = 'Malá Praha'
WHERE offer_id = 'JudTzF1WzhJ';

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id = 'JuZ6EDDylkC';

UPDATE offer_locations
SET location_area = 'Bôrik'
WHERE offer_id = 'JuY9N1R47k4';

UPDATE offer_locations
SET location_area = 'Považský Chlmec'
WHERE location_city = 'Žilina'
	AND location_area = ''
    AND title LIKE '%Chlm%';
    
UPDATE offer_locations
SET location_city = 'Kysucké Nové Mesto'
WHERE offer_id = 'JuwZ6NJ-dUG';

UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'
WHERE offer_id = 'JuwZ6NJ-dUG';

# Not in the Žilina Region
DELETE FROM offer_locations
WHERE offer_id = 'JuJKXzmzr5eE';

UPDATE offer_locations
SET location_district = 'okres Martin'
WHERE offer_id = 'Ju9gt_dtFmu';

UPDATE offer_locations
SET location_city = 'Turčiansky Peter'
WHERE offer_id = 'Ju9gt_dtFmu';

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id = 'JuAZvxGvcMl';

UPDATE offer_locations
SET location_area = 'Rosinky'
WHERE offer_id = 'Ju6MmU5y4t_';

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id IN (
	'JuZPdvGyLq9', 'Ju892FRo72v', 'JuFQj_B37XO', 'Ju65cZ1we6J', 'Ju3GPN81c0G6', 
    'JuUk6PkKhU1', 'JuGtWZEOQoM', 'JuOLPMJrkFk', 'Jujvvp196-y', 'JulDE6qv7sX', 
    'Ju0lAAcuMC-', 'JuVMUFYMKhd', 'JuWIHesej0g', 'Ju2bFduldFu');
    
UPDATE offer_locations
SET location_area = 'Vlčince'
WHERE offer_id IN (
	'JuEGUe9TZYw');
    
UPDATE offer_locations
SET location_area = 'Hájik'
WHERE offer_id IN (
	'Ju6Co8ebtz8', 'JuoZ1J6Es1y', 'JumTQJJZB7H', 'JuTcgjCG15n');
    
UPDATE offer_locations
SET location_area = 'Závodie'
WHERE offer_id IN (
	'Juh069sIM8t', 'Ju-yDJSlQCf', 'JuhczzRboRF');

UPDATE offer_locations
SET location_area = 'Bánová'
WHERE offer_id IN (
	'JursQitkieS');

UPDATE offer_locations
SET location_area = 'Bôrik'
WHERE offer_id IN (
	'JuuDv2Zd85o');

UPDATE offer_locations
SET location_area = 'Hliny'
WHERE offer_id IN (
	'JuNxbiZtMJl', 'JuhBe2gFJxv', 'JuP6ftsrJ5D', 'Ju0haPUlmUa', 'Ju7lyYOfLaW');
    
UPDATE offer_locations
SET location_area = 'Žilinská Lehota'
WHERE offer_id IN (
	'JuM4P4vy0RV');

UPDATE offer_locations
SET location_area = 'Strážov'
WHERE offer_id IN (
	'JufcWIOgVI-', 'Juc0qnwekhj', 'Ju_z9MMC1dy', 'JucgwdqxbsLG');
    
UPDATE offer_locations
SET location_area = 'Brodno'
WHERE offer_id IN (
	'JuaiG-4_MyI');
    
UPDATE offer_locations
SET location_area = 'Brodno'
WHERE offer_id IN (
	'Ju_3Vu8GkBj');
    
UPDATE offer_locations
SET location_area = 'Brodno'
WHERE offer_id IN (
	'JuePvBO4qUqh');
    
UPDATE offer_locations
SET location_city = 'Kunerad'
WHERE offer_id IN (
	'JuOobPaFHGD');
    
UPDATE offer_locations
SET location_city = 'Rosina'
WHERE offer_id IN (
	'Juf0d9bgzD3', 'JufFtzCmoZI');
    
UPDATE offer_locations
SET location_city = 'Stráňavy'
WHERE offer_id IN (
	'Ju_j96JYJ3R');
    
UPDATE offer_locations
SET location_city = 'Gbeľany'
WHERE offer_id IN (
	'JuzhCWgXTbr', 'JuH7gFUPY7f');
    
UPDATE offer_locations
SET location_city = 'Lietavská Svinná-Babkov'
WHERE offer_id IN (
	'JuZvI3pSm0g');
    
UPDATE offer_locations
SET location_city = 'Hôrky'
WHERE offer_id IN (
	'Ju6Y8lDrPPx');
    
UPDATE offer_locations
SET location_city = 'Mojš'
WHERE offer_id IN (
	'JuvykS9-KBJ0', 'JuWoA-3_Vhw');

UPDATE offer_locations
SET location_city = 'Lietava'
WHERE offer_id IN (
	'JukV9h68kmJ');
    
UPDATE offer_locations
SET location_city = 'Ovčiarsko'
WHERE offer_id IN (
	'JuMFxRcxLzj', 'JuXoUVcEWR0');
    
UPDATE offer_locations
SET location_city = 'Hlboké nad Váhom'
WHERE offer_id IN (
	'Juhv-0ib6ND', 'Julqx-OsWd4');
    
UPDATE offer_locations
SET location_district = 'okres Bytča'
WHERE offer_id IN (
	'Juhv-0ib6ND', 'Julqx-OsWd4');

UPDATE offer_locations
SET location_area = 'Blažkov'
WHERE offer_id IN (
	'JuhaIw0usS1');
    
UPDATE offer_locations
SET location_city = 'Krásno nad Kysucou'
WHERE offer_id IN (
	'JuhaIw0usS1');
    
UPDATE offer_locations
SET location_district = 'okres Čadca'
WHERE offer_id IN (
	'JuhaIw0usS1');
    
UPDATE offer_locations
SET location_district = 'okres Bytča'
WHERE offer_id IN (
	'JuzJzITWl1v');
    
UPDATE offer_locations
SET location_city = 'Kotešová'
WHERE offer_id IN (
	'JuzJzITWl1v');
    
UPDATE offer_locations
SET location_district = 'okres Bytča'
WHERE offer_id IN (
	'JuHloqFiiMy');
    
UPDATE offer_locations
SET location_city = 'Veľké Rovné'
WHERE offer_id IN (
	'JuHloqFiiMy');
    
UPDATE offer_locations
SET location_district = 'okres Bytča'
WHERE location_city = 'Veľké Rovné';
    
UPDATE offer_locations
SET location_district = 'okres Martin'
WHERE offer_id IN (
	'JuZIWdD4tzb');
    
UPDATE offer_locations
SET location_city = 'Valča'
WHERE offer_id IN (
	'JuZIWdD4tzb');
    
UPDATE offer_locations
SET location_district = 'okres Bytča'
WHERE offer_id IN (
	'Jutyprw4Nso');
    
UPDATE offer_locations
SET location_city = 'Bytča'
WHERE offer_id IN (
	'Jutyprw4Nso');
    
UPDATE offer_locations
SET location_area = 'Pšurnovice'
WHERE offer_id IN (
	'Jutyprw4Nso');
    
UPDATE offer_locations
SET location_district = 'okres Žilina'
WHERE offer_id IN (
	'JuMFxRcxLzj');
    
UPDATE offer_locations
SET location_city = 'Ovčiarsko'
WHERE offer_id IN (
	'JuMFxRcxLzj');
    
UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'
WHERE offer_id IN (
	'JuCzxidULuR');
    
UPDATE offer_locations
SET location_city = 'Snežnica'
WHERE offer_id IN (
	'JuCzxidULuR');
    
UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'
WHERE offer_id IN (
	'JutHLS-i8Kk');
    
UPDATE offer_locations
SET location_city = 'Povina'
WHERE offer_id IN (
	'JutHLS-i8Kk');
    
DELETE FROM offer_locations
WHERE offer_id = 'JuxeR7brS_D';

UPDATE offer_locations
SET location_city = 'Rajecké Teplice'
WHERE location LIKE '%Poluvsi%'
	OR title LIKE '%Poluvsi%';
    
UPDATE offer_locations
SET location_area = 'Poluvsie'
WHERE location LIKE '%Poluvsi%'
	OR title LIKE '%Poluvsi%';
    
UPDATE offer_locations
SET location_area = 'Rajecké Teplice'
WHERE ((location LIKE '%Rajeck%'
		AND location LIKE '%Teplic%')
	OR (title LIKE '%Rajeck%'
		AND title LIKE '%Teplic%'))
	AND location_area = ''
    AND location_city = 'Rajecké Teplice';


# OKRES BYTČA

UPDATE offer_locations
SET location_district = 'okres Bytča'
WHERE (location LIKE '%Bytč%'
		OR title LIKE '%Bytč%')
    AND (location LIKE '%Hliník%'
		OR title LIKE '%Hliník%');

UPDATE offer_locations
SET location_city = 'Bytča'
WHERE (location LIKE '%Bytč%'
		OR title LIKE '%Bytč%')
    AND (location LIKE '%Hliník%'
		OR title LIKE '%Hliník%');
        
UPDATE offer_locations
SET location_area = 'Hliník nad Váhom'
WHERE (location LIKE '%Bytč%'
		OR title LIKE '%Bytč%')
    AND (location LIKE '%Hliník%'
		OR title LIKE '%Hliník%');
        
UPDATE offer_locations
SET location_area = 'Hlboké nad Váhom'
WHERE (location NOT LIKE '%Bytčic%'
		AND title NOT LIKE '%Bytčic%')
    AND (location LIKE '%Bytč%'
		OR title LIKE '%Bytč%')
	AND location_city != 'Bytča'
    AND location_city = 'Hlboké nad Váhom';    
        
UPDATE offer_locations
SET location_area = 'Hvozdnica'
WHERE (location NOT LIKE '%Bytčic%'
		AND title NOT LIKE '%Bytčic%')
    AND (location LIKE '%Bytč%'
		OR title LIKE '%Bytč%')
	AND location_city != 'Bytča'
    AND location_city = 'Hvozdnica';

UPDATE offer_locations
SET location_area = location_city
WHERE (location NOT LIKE '%Bytčic%'
		AND title NOT LIKE '%Bytčic%')
    AND (location LIKE '%Bytč%'
		OR title LIKE '%Bytč%')
	AND location_city != 'Bytča'
    AND location_area = ''
    AND location_city != '';
    
UPDATE offer_locations
SET location_city = 'Bytča'
WHERE location_city = 'Jablonové'
	AND location_area = 'Thurzove sady';    
    
UPDATE offer_locations
SET location_city = 'Maršová-Rašov'
WHERE location_city = 'Maršová - Rašov';

UPDATE offer_locations
SET location_area = 'Maršová-Rašov'
WHERE location_area = 'Maršová - Rašov';
    
UPDATE offer_locations
SET location_area = 'Veľké Rovné'
WHERE location_city = 'Veľké Rovné'
	AND location_area = 'centrum';
    
# OKRES ŽILINA

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Žilina'
	AND location_area = ''
    AND location_city != ''
    AND location_city != 'Žilina';

DELETE FROM offer_locations
WHERE (location_district = 'okres Žilina' OR location_district = 'okres Bytča')
    AND location_area = ''
    AND (title LIKE '%modul%' OR title LIKE '%na mieru%');

DELETE FROM offer_locations
WHERE offer_id IN (
	'JuRgJeTAxVy', 'JuoeYQOs_Z9', 'Ju44dfk_BZm', 'JuV5HkQpALL', 'JusXqn8KqwQ', 'JuYUZodjDKp', 
    'JuU84vbz7m-', 'JuLSNsiowCT', 'Jub2MnZxkBn', 'Jub1Xd04y8D', 'JuVbNDQqR3q', 'JupyV2t8Qgm', 
    'Ju7-5HCEZjz', 'JuFVfOvXiCk', 'Jufdqwwas0S', 'JukRBagok2E');


# OKRES KYSUCKÉ NOVÉ MESTO
UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city != 'Kysucké Nové Mesto';
    
UPDATE offer_locations
SET location_area = 'Kamence'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND (title LIKE '%Kamenc%'
		OR location LIKE '%Kamenc%');
	
UPDATE offer_locations
SET location_area = 'Budatínska Lehota'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
	AND location_area != 'Kamence'
    AND location LIKE '%Budatínska Lehota%';
    
UPDATE offer_locations
SET location_area = 'Kamence'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND (location LIKE '%Štúrova%'
		OR location LIKE '%ČSA%'
        OR location LIKE '%Sládkovičova%')
	AND location_area = '';

UPDATE offer_locations
SET location_area = 'Stred'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND (location LIKE '%Námestie Slobody%'
		OR location LIKE '%1. Mája%')
	AND location_area = '';
    
UPDATE offer_locations
SET location_area = 'Nábrežie'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND location LIKE '%Nábrežná%'
	AND location_area = '';
    
UPDATE offer_locations
SET location_area = 'Sídlisko'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND (location LIKE '%Murgašova%'
		OR location LIKE '%Litovská%'
        OR location LIKE '%Litovelská%'
        OR location LIKE '%Dlhomíra Poľského%'
        OR location LIKE '%Clementisova%')
	AND location_area = '';
    
UPDATE offer_locations
SET location_area = 'Suľkov'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND (location LIKE '%Kukučínova%'
		OR location LIKE '%Dubská%')
	AND location_area = '';
    
UPDATE offer_locations
SET location_area = 'Sídlisko'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND (title LIKE '%Clementisova%'
		OR title LIKE '%Litovelská%')
	AND location_area = '';
    
UPDATE offer_locations
SET location_area = 'Budatínska Lehota'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND title LIKE '%Budatínska Lehota%'
	AND location_area = '';
    
UPDATE offer_locations
SET location_area = 'Ochodnica'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND title LIKE '%Ochodnica%'
	AND location_area = '';
    
UPDATE offer_locations
SET location_city = 'Ochodnica'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND title LIKE '%Ochodnica%';
    
UPDATE offer_locations
SET location_area = 'Oškerda'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND title LIKE '%Oškerd%'
	AND location_area = '';
    
UPDATE offer_locations
SET location_area = 'Horný Vadičov'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND title LIKE '%Horný Vadičov%'
	AND location_area = '';
    
UPDATE offer_locations
SET location_city = 'Horný Vadičov'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND title LIKE '%Horný Vadičov%';
    
    
UPDATE offer_locations
SET location_area = 'Povina'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND location_area = ''
    AND title LIKE '%Povina%';
    
UPDATE offer_locations
SET location_city = 'Povina'
WHERE location_district = 'okres Kysucké Nové Mesto'
	AND location_city = 'Kysucké Nové Mesto'
    AND title LIKE '%Povina%';
    
UPDATE offer_locations
SET location_area = 'Sídlisko'
WHERE offer_id IN (
	'JuVO5WLrTZ3', 'Ju5kidrwmrO2', 'JuDGw-se-Mg', 'JuQ4Jf_xqij', 'JujwaDNeJ1i', 'JunnDIKOU8H', 'Ju3VAHb4p44');

UPDATE offer_locations
SET location_area = 'Kamence'
WHERE offer_id IN (
	'JuyUHlMcv_Q', 'JuBgCxlwRO1', 'Ju5ImCNB76o', 'JuJvNTKAcv8');
    
UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id IN (
	'Juo9yc6U_zm', 'Ju7DJIriKhh', 'JunCOKnq7PY');    

UPDATE offer_locations
SET location_area = 'Nábrežie'
WHERE offer_id IN (
	'JubGyQoKm-F');   

UPDATE offer_locations
SET location_area = 'Suľkov'
WHERE offer_id IN (
	'JuwZ6NJ-dUG', 'Ju6--Y2X6T3', 'JuLGf5aS3L1');   

UPDATE offer_locations
SET location_city = 'Horný Vadičov'
WHERE offer_id IN (
	'JupibY8fOsV');  

UPDATE offer_locations
SET location_area = 'Horný Vadičov'
WHERE offer_id IN (
	'JupibY8fOsV');  

UPDATE offer_locations
SET location_city = 'Nesluša'
WHERE offer_id IN (
	'JuvMlRWqyJoo');  

UPDATE offer_locations
SET location_area = 'Nesluša'
WHERE offer_id IN (
	'JuvMlRWqyJoo');  

UPDATE offer_locations
SET location_city = 'Povina'
WHERE offer_id IN (
	'JuJ545cqJWH');  

UPDATE offer_locations
SET location_area = 'Povina'
WHERE offer_id IN (
	'JuJ545cqJWH');  
    
DELETE FROM offer_locations 
WHERE offer_id IN ('JuyE-84zVP9', 'JuC2P_JyQg6', 'Ju60no_OjrU', 'JuPfz8Oakcs', 'Juk28smgcm7');

UPDATE offer_locations
SET location_city = ''
WHERE offer_id = 'JuZFa40Foop';


# OKRES ČADCA

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Čadca'
	AND location_city != 'Čadca'
    AND location_city != 'Krásno nad Kysucou'
    AND location_city != 'Turzovka';

UPDATE offer_locations
SET location_area = 'Kalinov'
WHERE offer_id IN ('Ju3gs_noUEz', 'JuNh7AtADFs', 'Ju9HXOkK5Vc', 'JuqL8yAiSJt', 'JuOzMZP3NXD');

UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id IN ('JuqvAhg9dB7', 'JuW48-9PwOZ', 'JuzAGRifcCv', 'JuqRHR8iBLi', 'Juj0QibLMWk', 'JuGJrcpb-9J', 'Jui5kD-W6hC');

UPDATE offer_locations
SET location_area = 'Blažkov'
WHERE offer_id IN ('JuatbTPjpIq', 'JuhaIw0usS1');

UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id IN (
	'JuL2CqQ6bTm', 'JuJ1fx159Ms', 'Ju0xJVhINu5', 'Ju75IN_Zjx0', 'JuN-Pnp6KBM', 'JugHDSXoGA9', 
    'JuQtjXuvBCs', 'JuQuGs-1s6D', 'JuWpJ-Sbi1l', 'JugwkPLjiSd', 'JutBfnbUyCO', 'Ju93D7kxk57', 
    'Jur9DmBKE6k', 'JuI7RPoOfX3', 'JuxXBGk_4Zo');
    
UPDATE offer_locations
SET location_area = 'Hlinené'
WHERE offer_id IN (
	'Juyxeic3AFZ', 'JurUF8OlH6u', 'JuTlV6vu9KV');
    
UPDATE offer_locations
SET location_area = 'Predmier'
WHERE offer_id IN (
	'JuptIY7K5YK', 'JuUi2C1CE8-', 'JuIlHogl4wQ', 'Ju-0W9ug2Ol', 'JuTN7hEMhfs', 'JuEkXTiy4W0', 
    'Jui1yUD8ZRT', 'Juht1btctzZ');

UPDATE offer_locations
SET location_area = 'Závodie'
WHERE offer_id IN (
	'JuiyrWA4fnU');
    
UPDATE offer_locations
SET location_area = 'Turkov'
WHERE offer_id IN (
	'JubDt8HjaHe');

UPDATE offer_locations
SET location_area = 'Dlhá nad Kysucou'
WHERE offer_id IN (
	'JueF3dmbicv');
    
UPDATE offer_locations
SET location_city = 'Dlhá nad Kysucou'
WHERE offer_id IN (
	'JueF3dmbicv');
    
UPDATE offer_locations
SET location_area = 'Žarec'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND (title LIKE '%Žarec%'
		OR title LIKE '%Žarc%');
        
UPDATE offer_locations
SET location_area = 'Podzávoz'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND title LIKE '%Podzávoz%';
    
UPDATE offer_locations
SET location_area = 'Rieka'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND title LIKE '%Riek%';
    
UPDATE offer_locations
SET location_area = 'Horelica'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND title LIKE '%Horelic%';	
    
UPDATE offer_locations
SET location_area = 'Čadečka'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND title LIKE '%Čadečk%';

UPDATE offer_locations
SET location_area = 'Rieka'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND location LIKE '%Rieka%';
    
UPDATE offer_locations
SET location_area = 'Podzávoz'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND location LIKE '%Podzávoz%';
    
UPDATE offer_locations
SET location_area = 'Horelica'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND location LIKE '%Horelica%';
    
UPDATE offer_locations
SET location_area = 'Centrum'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND (location LIKE '%A. Bernoláka%'
		OR location LIKE '%centrum%'
        OR location LIKE '%Frana Krála%'
        OR location LIKE '%Hviezdoslavova%'
        OR location LIKE '%Kukučínova%'
        OR location LIKE '%L.Podjavorinskej%'
        OR location LIKE '%Matičné námestie%'
        OR location LIKE '%Palárikova%');
        
UPDATE offer_locations
SET location_area = 'Žarec'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location LIKE '%A. Bernoláka%';     

UPDATE offer_locations
SET location_area = 'Žarec'    
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND (location LIKE '%A. Bernoláka%'
		OR location LIKE '%Janka Kráľa%'
        OR location LIKE '%M.R.Štefánika%');

UPDATE offer_locations
SET location_area = 'Kyčerka'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND (location LIKE '%Chalupkova%'
		OR location LIKE '%Hurbanova%'
        OR location LIKE '%Okružná%'
        OR location LIKE '%Rázusova%'
        OR location LIKE '%Školská%');
        
UPDATE offer_locations
SET location_area = 'Sídlisko 3'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND location LIKE '%Mierová%';
    
UPDATE offer_locations
SET location_area = 'Milošová'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND location LIKE '%Milošová%';
    
UPDATE offer_locations
SET location_area = 'U Hluška'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND (location LIKE '%Rázusova%'
		OR location LIKE '%U Hluška%');
        
UPDATE offer_locations
SET location_area = 'Husárikovci'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND (location LIKE '%Rázusova%'
		OR location LIKE '%U husárikov%');

UPDATE offer_locations
SET location_area = 'Centrum'
WHERE offer_id = 'Ju3_GjYaBPA';

UPDATE offer_locations
SET location_area = 'Čierne'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND title LIKE '%Čiern%';
    
UPDATE offer_locations
SET location_city = 'Čierne'
WHERE location_district = 'okres Čadca'
	AND location_area = 'Čierne'
    AND title LIKE '%Čiern%';
    
UPDATE offer_locations
SET location_city = 'Raková'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND title LIKE '%Rakov%';
    
UPDATE offer_locations
SET location_area = 'Raková'
WHERE location_district = 'okres Čadca'
    AND location_area = ''
    AND title LIKE '%Rakov%';
    
UPDATE offer_locations
SET location_area = 'Centrum'
WHERE location_district = 'okres Čadca'
	AND location_city = 'Čadca'
    AND location_area = ''
    AND title LIKE '%centr%';

UPDATE offer_locations
SET location_area = 'Centrum'
WHERE offer_id IN (
	'JutqtoD-x5N', 'JuwDKSHdYOM', 'JuyBFHxJEo2F', 'Ju3hr4RXLjv', 'Ju3G8jSFFI9');
    
UPDATE offer_locations
SET location_area = 'Škrabákovci'
WHERE offer_id IN (
	'JuJDcaBGFgv');    
    
UPDATE offer_locations
SET location_area = 'Kyčerka'
WHERE offer_id IN (
	'JuOMOLcEq4z', 'JuGHqD4k0Bi', 'JuoM1a2vfjr');

UPDATE offer_locations
SET location_area = 'Podzávoz'
WHERE offer_id IN (
	'Ju1GDbbrB55', 'Ju6EZukLTos');

UPDATE offer_locations
SET location_area = 'Milošová'
WHERE offer_id IN (
	'Juw-gEYpFG_');

UPDATE offer_locations
SET location_area = 'Čadečka'
WHERE offer_id IN (
	'JuQ8RNQVTuL');

UPDATE offer_locations
SET location_area = 'U Hluška'
WHERE offer_id IN (
	'JuYwrDdapt0', 'JuoozgHS-2r');

UPDATE offer_locations
SET location_area = 'U Sneheľníka'
WHERE offer_id IN (
	'JujqHk5Nsu-');

UPDATE offer_locations
SET location_area = 'Husárikovci'
WHERE offer_id IN (
	'Ju_GJzZVy3l');

UPDATE offer_locations
SET location_area = 'Raková'
WHERE offer_id IN (
	'JunoLrzCTv8');
    
UPDATE offer_locations
SET location_city = 'Raková'
WHERE offer_id IN (
	'JunoLrzCTv8');

UPDATE offer_locations
SET location_area = 'Staškov'
WHERE offer_id IN (
	'JuOWl6BKLUg');
    
UPDATE offer_locations
SET location_city = 'Staškov'
WHERE offer_id IN (
	'JuOWl6BKLUg');
    
UPDATE offer_locations
SET location_area = 'Zákopčie'
WHERE offer_id IN (
	'Ju-fppxOVlc');
    
UPDATE offer_locations
SET location_city = 'Zákopčie'
WHERE offer_id IN (
	'Ju-fppxOVlc');
    
UPDATE offer_locations
SET location_area = 'Kyzkovci'
WHERE offer_id IN (
	'JuNXUaLV7F5');
    
UPDATE offer_locations
SET location_area = 'Olešná'
WHERE offer_id IN (
	'JujDi-L-0hf');
    
UPDATE offer_locations
SET location_city = 'Olešná'
WHERE offer_id IN (
	'JujDi-L-0hf');
    
    
UPDATE offer_locations
SET location_district = 'okres Kysucké Nové Mesto'
WHERE offer_id IN (
	'JuJpcjTfX3t');
    
UPDATE offer_locations
SET location_area = 'Kysucký Lieskovec'
WHERE offer_id IN (
	'JuJpcjTfX3t');
    
UPDATE offer_locations
SET location_city = 'Kysucký Lieskovec'
WHERE offer_id IN (
	'JuJpcjTfX3t');
    
UPDATE offer_locations
SET location_city = ''
WHERE offer_id IN (
	'JuhLO-Heh52');
    
UPDATE offer_locations
SET location_area = 'Kalinov'
WHERE offer_id IN (
	'JuCZD2XgLKU', 'Ju059DbP17Y');
    
    
# OKRES MARTIN

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Martin'
	AND location_city != 'Martin'
    AND location_city != 'Vrútky';
    
UPDATE offer_locations
SET location_area = 'Karvaša a Bláhovca'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND (location LIKE '%Karvaš%'
		OR title LIKE '%Karvaš%');
        
UPDATE offer_locations
SET location_city = 'Vrútky'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND (location LIKE '%Karvaš%'
		OR title LIKE '%Karvaš%');
        
UPDATE offer_locations
SET location_city = 'Vrútky'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND location IN ('Kolónia Hviezda, Martin, okres Martin');
    
UPDATE offer_locations
SET location_area = 'Kolónia Hviezda'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND location IN ('Kolónia Hviezda, Martin, okres Martin');
    
UPDATE offer_locations
SET location_area = 'Horné Vrútky'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND location IN (
		'I.československej brigády, Vrútky, okres Martin', 'Kafendova, Vrútky, okres Martin', 
        'M. R. Štefánika, Vrútky, okres Martin', 'Nábrežná, Vrútky, okres Martin', 
        'sv. Cyrila a Metoda, Vrútky, okres Martin');
        
UPDATE offer_locations
SET location_area = 'Dolné Vrútky'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND location IN (
		'A. Hlinku, Vrútky, okres Martin', 'Horná, Vrútky, okres Martin', 'Lesná, Vrútky, okres Martin', 
        'Matušovičovský Rad, Vrútky, okres Martin', 'Ľudovíta Štúra, Vrútky, okres Martin');
        
UPDATE offer_locations
SET location_area = 'Mexiko'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND location IN (
		'Dielenská Kružná I., Vrútky, okres Martin');
        
UPDATE offer_locations
SET location_area = 'Karvaša a Bláhovca'
WHERE location_district = 'okres Martin'
	AND (location_city = 'Vrútky'
		OR title LIKE '%Vrútk%')
	AND location IN (
		'Jedľova, Vrútky, okres Martin');
        
UPDATE offer_locations
SET location_area = 'Horné Vrútky'
WHERE offer_id IN (
    'JuUCL8fPL9h', 'JuKlHRPhAEF', 'JuMhyPasgwl', 'JuzGrB3SDsa', 'JueuOSIj-04', 'Jui1mJgPtv9', 
    'JueR5kVH0gB', 'JuOr71wM3AE', 'JuIhf4tExMf', 'Ju7yQFu2G0Z', 'JupsSzyT0cr', 'Jul-5SUTLOW');
    
UPDATE offer_locations
SET location_area = 'Priekopa'
WHERE offer_id IN (
    'JuBpZ_BskLa', 'JuAo_CCFbGo');    
    
UPDATE offer_locations
SET location_area = 'Dolné Vrútky'
WHERE offer_id IN (
    'JurU1U7jogn', 'Ju3T5ymjwHh', 'JugiMieeEs_');  
    
UPDATE offer_locations
SET location_area = 'Karvaša a Bláhovca'
WHERE offer_id IN (
    'Jupd__eIrfW', 'Juw56vbFeXZ', 'JuSvmhJEqG1');  
    
UPDATE offer_locations
SET location_area = 'Kolónia Hviezda'
WHERE offer_id IN (
    'JuoeXyKL-xw');  
    
UPDATE offer_locations
SET location_city = 'Vrútky'
WHERE offer_id IN (
    'JupsSzyT0cr', 'Ju6448VMXkm');  
    
UPDATE offer_locations
SET location_city = 'Martin'
WHERE offer_id IN (
    'JuAo_CCFbGo');  
    
UPDATE offer_locations
SET location_city = 'Martin'
WHERE location_district = 'okres Martin'
	AND (location_area = 'Kolónia Hviezda'
    OR title LIKE '%Hviezd%');    
    
UPDATE offer_locations
SET location_area = 'Ľadoveň'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND (title LIKE '%Ľadov%'
		OR title LIKE '%Ladov%'
        OR location LIKE '%Ľadov%'
        OR location LIKE '%Ladov%');  
        
UPDATE offer_locations
SET location_area = 'Jahodníky'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Jahodn%'
		OR location LIKE '%Jahodn%');
        
UPDATE offer_locations
SET location_area = 'Tomčany'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Tomčan%'
		OR location LIKE '%Tomčan%');
        
UPDATE offer_locations
SET location_area = 'Sever'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Sever%'
		OR location LIKE '%Sever%');
        
UPDATE offer_locations
SET location_area = 'Košúty'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Košút%'
		OR location LIKE '%Košút%'
        OR title LIKE '%Košut%'
		OR location LIKE '%Košut%');       
        
UPDATE offer_locations
SET location_area = 'Priekopa'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Priekop%'
		OR location LIKE '%Priekop%');    

UPDATE offer_locations
SET location_area = 'Záturčie'   
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Záturč%'
		OR location LIKE '%Záturč%');     

UPDATE offer_locations
SET location_area = 'Podháj'   
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Podháj%'
		OR location LIKE '%Podháj%'
        OR title LIKE '%Podhaj%'
		OR location LIKE '%Podhaj%');
        
UPDATE offer_locations
SET location_area = 'Stráne'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Strán%'
		OR location LIKE '%Strán%');
        
UPDATE offer_locations
SET location_area = 'Kolónia Hviezda'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND (title LIKE '%Hviezd%'
		OR location LIKE '%Hviezd%')
	AND location NOT LIKE '%Hviezdoslav%'
    AND title NOT LIKE '%Hviezdoslav%';  
    
UPDATE offer_locations
SET location_area = 'Záturčie'
WHERE location_district = 'okres Martin'
	AND location_area = ''
    AND location_city != 'Vrútky'
    AND title LIKE '%Nový Martin%';

UPDATE offer_locations
SET location_area = 'Belá-Dulice'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Belá Dulice%';
    
UPDATE offer_locations
SET location_city = 'Belá-Dulice'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Belá Dulice%';
    
UPDATE offer_locations
SET location_area = 'Diviaky'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Diviaky%';
    
UPDATE offer_locations
SET location_city = 'Turčianske Teplice'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Diviaky%';
    
UPDATE offer_locations
SET location_district = 'okres Turčianske Teplice'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Diviaky%';
    
UPDATE offer_locations
SET location_city = 'Kláštor pod Znievom'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Kláštor%';
    
UPDATE offer_locations
SET location_area = 'Kláštor pod Znievom'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Kláštor%';
    
UPDATE offer_locations
SET location_city = 'Lipovec'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Lipovec%';
    
UPDATE offer_locations
SET location_area = 'Lipovec'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Lipovec%';
    
UPDATE offer_locations
SET location_city = 'Sučany'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Sučany%';
    
UPDATE offer_locations
SET location_area = 'Sučany'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Sučany%';
    
UPDATE offer_locations
SET location_city = 'Ratkovo'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Ratkovo%';
    
UPDATE offer_locations
SET location_area = 'Ratkovo'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Ratkovo%';
    
UPDATE offer_locations
SET location_city = 'Slovany'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Slovany%';
    
UPDATE offer_locations
SET location_area = 'Slovany'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Slovany%';
    
UPDATE offer_locations
SET location_city = 'Turčianske Kľačany'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Kľačany%';
    
UPDATE offer_locations
SET location_area = 'Turčianske Kľačany'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Kľačany%';
    
UPDATE offer_locations
SET location_city = 'Turčiansky Peter'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Peter%';
    
UPDATE offer_locations
SET location_area = 'Turčiansky Peter'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Peter%';
    
UPDATE offer_locations
SET location_city = 'Valča'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Valča%';
    
UPDATE offer_locations
SET location_area = 'Valča'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Valča%';
    
UPDATE offer_locations
SET location_city = 'Varín'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Varín%';
    
UPDATE offer_locations
SET location_area = 'Varín'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Varín%';
    
UPDATE offer_locations
SET location_district = 'okres Žilina'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location LIKE '%Varín%';
    
UPDATE offer_locations
SET location_area = 'Stred'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND (location LIKE '%Kmeťa%'
		OR location LIKE '%Pietra%'
        OR location LIKE '%Benolák%'
        OR location LIKE '%Centr%'
        OR location LIKE '%Divadeln%'
        OR location LIKE '%Holubyho%'
        OR location LIKE '%Hviezdoslav%'
        OR location LIKE '%Kohút%'
        OR location LIKE '%Novomeského%'
        OR location LIKE '%Štefánik%'
        OR location LIKE '%Malá hora%'
        OR location LIKE '%Moyzes%'
        OR location LIKE '%Mudroň%'
        OR location LIKE '%Novák%'
        OR location LIKE '%Nálepkov%'
		OR location LIKE '%SNP%'
        OR location LIKE '%Osloboditeľov%'
        OR location LIKE '%Tajovského%'
        OR location LIKE '%Thurzova%'
        OR location LIKE '%Záborského%'
        OR location LIKE '%Červenej armády%'
        OR location LIKE '%Štúrov%');
    
UPDATE offer_locations
SET location_area = 'Priekopa'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location_area = ''
    AND (location LIKE '%Medňanského%'
		OR location LIKE '%Martáka%'
        OR location LIKE '%Kratinov%');
        
UPDATE offer_locations
SET location_area = 'Ľadoveň'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location_area = ''
    AND (location LIKE '%Gogoľov%'
		OR location LIKE '%Svätopluk%');
        
UPDATE offer_locations
SET location_area = 'Košúty'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location_area = ''
    AND (location LIKE '%Hodžov%'
		OR location LIKE '%Hurbanov%');  
        
UPDATE offer_locations
SET location_area = 'Záturčie'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location_area = ''
    AND (location LIKE '%Hájsk%');   
    
UPDATE offer_locations
SET location_area = 'Podháj'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location_area = ''
    AND (location LIKE '%Golián%'
		OR location LIKE '%Gorkého%'
        OR location LIKE '%Timravy%');
        
UPDATE offer_locations
SET location_area = 'Jahodníky'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location_area = ''
    AND (location LIKE '%Jesenského%'
		OR location LIKE '%Kollárov%'
        OR location LIKE '%Murgaš%'
        OR location LIKE '%Odtoky%'
        OR location LIKE '%Ruppeldtova%');
        
UPDATE offer_locations
SET location_area = 'Sever'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND location_area = ''
    AND (location LIKE '%Jilemnického%');     
    
UPDATE offer_locations
SET location_area = 'Stred'
WHERE location_district = 'okres Martin'
    AND location_city != 'Vrútky'
    AND (title LIKE '%Kmeťa%'
		OR title LIKE '%Pietra%'
        OR title LIKE '%Benolák%'
        OR title LIKE '%Centr%'
        OR title LIKE '%Divadeln%'
        OR title LIKE '%Holubyho%'
        OR title LIKE '%Hviezdoslav%'
        OR title LIKE '%Kohút%'
        OR title LIKE '%Novomeského%'
        OR title LIKE '%Štefánik%'
        OR title LIKE '%Malá hora%'
        OR title LIKE '%Moyzes%'
        OR title LIKE '%Mudroň%'
        OR title LIKE '%Novák%'
        OR title LIKE '%Nálepkov%'
		OR title LIKE '%SNP%'
        OR title LIKE '%Osloboditeľov%'
        OR title LIKE '%Tajovského%'
        OR title LIKE '%Thurzova%'
        OR title LIKE '%Záborského%'
        OR title LIKE '%Červenej armády%'
        OR title LIKE '%Štúrov%');
    
UPDATE offer_locations
SET location_area = 'Priekopa'
WHERE location_district = 'okres Martin'
    AND location_city = 'Martin'
    AND (title LIKE '%Medňanského%'
		OR title LIKE '%Martáka%'
        OR title LIKE '%Kratinov%');
        
UPDATE offer_locations
SET location_area = 'Ľadoveň'
WHERE location_district = 'okres Martin'
    AND location_city = 'Martin'
    AND (title LIKE '%Gogoľov%'
		OR title LIKE '%Svätopluk%');
        
UPDATE offer_locations
SET location_area = 'Košúty'
WHERE location_district = 'okres Martin'
    AND location_city = 'Martin'
    AND (title LIKE '%Hodžov%'
		OR title LIKE '%Hurbanov%');  
        
UPDATE offer_locations
SET location_area = 'Záturčie'
WHERE location_district = 'okres Martin'
    AND location_city = 'Martin'
    AND (title LIKE '%Hájsk%');   
    
UPDATE offer_locations
SET location_area = 'Podháj'
WHERE location_district = 'okres Martin'
    AND location_city = 'Martin'
    AND (title LIKE '%Golián%'
		OR title LIKE '%Gorkého%'
        OR title LIKE '%Timravy%');
        
UPDATE offer_locations
SET location_area = 'Jahodníky'
WHERE location_district = 'okres Martin'
    AND location_city = 'Martin'
    AND (title LIKE '%Jesenského%'
		OR title LIKE '%Kollárov%'
        OR title LIKE '%Murgaš%'
        OR title LIKE '%Odtoky%'
        OR title LIKE '%Ruppeldtova%');
        
UPDATE offer_locations
SET location_area = 'Sever'
WHERE location_district = 'okres Martin'
    AND location_city = 'Martin'
    AND (title LIKE '%Jilemnického%');    

UPDATE offer_locations
SET location_area = 'Sklabiňa'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Sklabi%';
    
UPDATE offer_locations
SET location_city = 'Sklabiňa'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Sklabiňa';
    
UPDATE offer_locations
SET location_area = 'Košťany nad Turcom'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Košťan%';
    
UPDATE offer_locations
SET location_city = 'Košťany nad Turcom'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Košťany nad Turcom';
    
UPDATE offer_locations
SET location_area = 'Vrícko'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND (title LIKE '%Vríck%');
    
UPDATE offer_locations
SET location_city = 'Vrícko'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Vrícko';
    
UPDATE offer_locations
SET location_area = 'Kláštor pod Znievom'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Kláštor%';
    
UPDATE offer_locations
SET location_city = 'Kláštor pod Znievom'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Kláštor pod Znievom';
    
UPDATE offer_locations
SET location_area = 'Valča'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Valč%';
    
UPDATE offer_locations
SET location_city = 'Valča'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Valča';
    
UPDATE offer_locations
SET location_area = 'Lipovec'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Lipov%';

UPDATE offer_locations
SET location_city = 'Lipovec'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Lipovec';

UPDATE offer_locations
SET location_area = 'Dražkovce'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Dražkovc%'; 
    
UPDATE offer_locations
SET location_city = 'Dražkovce'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Dražkovce';
    
UPDATE offer_locations
SET location_area = 'Sučany'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Sučan%'; 
    
UPDATE offer_locations
SET location_city = 'Sučany'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Sučany';
    
UPDATE offer_locations
SET location_area = 'Turčiansky Peter'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Peter%';
    
UPDATE offer_locations
SET location_city = 'Turčiansky Peter'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Turčiansky Peter';
    
UPDATE offer_locations
SET location_area = 'Turčiansky Jaseno'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Jasen%';
    
UPDATE offer_locations
SET location_city = 'Turčiansky Jaseno'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Turčiansky Jaseno';
    
UPDATE offer_locations
SET location_area = 'Daňová'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Daňová%';
    
UPDATE offer_locations
SET location_city = 'Daňová'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Daňová';
    
UPDATE offer_locations
SET location_area = 'Karlová'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Karlová%';

UPDATE offer_locations
SET location_city = 'Karlová'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Karlová';
    
UPDATE offer_locations
SET location_area = 'Blatnica'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Blatnica%';

UPDATE offer_locations
SET location_city = 'Blatnica'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Blatnica';
    
UPDATE offer_locations
SET location_area = 'Turčianska Štiavnička'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Štiavnička%';

UPDATE offer_locations
SET location_city = 'Turčianska Štiavnička'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Turčianska Štiavnička';
 
UPDATE offer_locations
SET location_area = 'Necpaly'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Necpaly%';

UPDATE offer_locations
SET location_city = 'Necpaly'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Necpaly';
    
UPDATE offer_locations
SET location_area = 'Turany'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Turany%';

UPDATE offer_locations
SET location_city = 'Turany'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Turany';

UPDATE offer_locations
SET location_area = 'Dolný Kalník'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Dolný Kalník%';

UPDATE offer_locations
SET location_city = 'Dolný Kalník'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Dolný Kalník';

-----------------------------------------    
UPDATE offer_locations
SET location_area = 'Horná Štubňa'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Horná Štubňa%';

UPDATE offer_locations
SET location_city = 'Horná Štubňa'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Horná Štubňa';
    
UPDATE offer_locations
SET location_district = 'Turčianske Teplice'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_city = 'Horná Štubňa';
-------------------------------------------
UPDATE offer_locations
SET location_area = 'Kaľamenová'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Kaľamenov%';

UPDATE offer_locations
SET location_city = 'Kaľamenová'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Kaľamenová';
    
UPDATE offer_locations
SET location_district = 'Turčianske Teplice'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_city = 'Kaľamenová';
-------------------------------------------
UPDATE offer_locations
SET location_area = 'Malý Čepčín'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Čepčín%';

UPDATE offer_locations
SET location_city = 'Malý Čepčín'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Malý Čepčín';
    
UPDATE offer_locations
SET location_district = 'Turčianske Teplice'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_city = 'Malý Čepčín';
-------------------------------------------
UPDATE offer_locations
SET location_area = 'Jazernica'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Jazernica%';

UPDATE offer_locations
SET location_city = 'Jazernica'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Jazernica';
    
UPDATE offer_locations
SET location_district = 'Turčianske Teplice'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_city = 'Jazernica';
------------------------------------------
UPDATE offer_locations
SET location_area = 'Budiš'    
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
	AND location_area = ''
    AND title LIKE '%Budiš%';

UPDATE offer_locations
SET location_city = 'Budiš'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_area = 'Budiš';
    
UPDATE offer_locations
SET location_district = 'Turčianske Teplice'
WHERE location_district = 'okres Martin'
	AND location_city != 'Vrútky'
    AND location_city = 'Budiš';

UPDATE offer_locations
SET location_city = 'Vrútky'
WHERE offer_id IN ('JukjSccuSX6', 'Juv6SZd0pv9');

UPDATE offer_locations
SET location_area = 'Rakša'
WHERE offer_id = 'Jui14FUG-ZO';

UPDATE offer_locations
SET location_city = 'Rakša'
WHERE offer_id = 'Jui14FUG-ZO';

UPDATE offer_locations
SET location_district = 'okres Turčianske Teplice'
WHERE offer_id = 'Jui14FUG-ZO';

UPDATE offer_locations
SET location_area = 'Martinské hole'
WHERE offer_id = 'Juzl0Ycup_I';

UPDATE offer_locations
SET location_area = 'Horné Vrútky'
WHERE offer_id = 'JuBSH-C3TAe';

UPDATE offer_locations
SET location_city = 'Vrútky'
WHERE offer_id = 'JuBSH-C3TAe';

UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id IN (
	'Ju5Yoj_C-t-', 'Ju4n_bUHLJ9', 'JujtAMfUep-', 'JuaFgvo5Zms', 'Juic0vZirTi');

UPDATE offer_locations
SET location_area = 'Priekopa'
WHERE offer_id IN (
	'Ju_mj9AejcW', 'Ju_cu57wiSa', 'Ju-oy7KMPvG', 'JuY2fWI7qOb', 'JuE1L7QIb5r', 'JuYd_ySpDkY');

UPDATE offer_locations
SET location_area = 'Podháj'
WHERE offer_id IN (
	'Jub_GkQafv9', 'Jue8D9Iu4Hk');

UPDATE offer_locations
SET location_area = 'Ľadoveň'
WHERE offer_id IN (
	'JubLUnnldKg');
    
UPDATE offer_locations
SET location_area = 'Sever'    
WHERE offer_id IN (
	'JuH66opZMTi', 'JutwTj3bM_v', 'JuFDHnuYFxT', 'JupbvvbWZFWc');

UPDATE offer_locations
SET location_area = 'Košúty'    
WHERE offer_id IN (
	'JuRjoCvdqrS', 'JupACoTE9Yo');
    
UPDATE offer_locations
SET location_area = 'Záturčia'  
WHERE offer_id = 'JuCUhlSV9_h';

UPDATE offer_locations
SET location_area = 'Stráne'  
WHERE offer_id = 'JulOKuOiom0';

UPDATE offer_locations
SET location_area = 'Tomčany'  
WHERE offer_id = 'Ju6FhwnbvkK';

UPDATE offer_locations
SET location_area = 'Košťany nad Turcom'  
WHERE offer_id = 'Ju2WQT7unmV';

UPDATE offer_locations
SET location_city = 'Košťany nad Turcom'  
WHERE offer_id = 'Ju2WQT7unmV';

UPDATE offer_locations
SET location_area = 'Sučany'  
WHERE offer_id = 'JuXBeZX2j2W';

UPDATE offer_locations
SET location_city = 'Sučany'  
WHERE offer_id = 'JuXBeZX2j2W';

UPDATE offer_locations
SET location_city = ''  
WHERE offer_id = 'JuuOm3BAvYEs';

DELETE FROM offer_locations
WHERE offer_id IN (
	'JuwfnF7mXZs', 'JuQGKRbpML5', 'JucfkD4TXI2', 'JumYD--tcfF', 'JulM-M8rFdz', 'Ju5qccZREsO');

# OKRES TURČIANSKE TEPLICE

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Turčianske Teplice'
	AND location_city != 'Turčianske Teplice';
    
UPDATE offer_locations
SET location_area = 'Diviaky'
WHERE location_district = 'okres Turčianske Teplice'
	AND location_city = 'Turčianske Teplice'
    AND location_area = ''
    AND (title LIKE '%Diviak%'
		OR location LIKE '%Diviak%');

UPDATE offer_locations
SET location_area = 'Turčiansky Michal'
WHERE location_district = 'okres Turčianske Teplice'
	AND location_city = 'Turčianske Teplice'
    AND location_area = ''
    AND (title LIKE '%Michal%'
		OR location LIKE '%Michal%');
        
UPDATE offer_locations
SET location_area = 'Dolná Štubňa'
WHERE location_district = 'okres Turčianske Teplice'
	AND location_city = 'Turčianske Teplice'
    AND location_area = ''
	AND (title LIKE '%Doln%'
		OR location LIKE '%Doln%');

UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id IN (
	'JuYVsYrHNhK', 'JuRzGNU0BD2', 'JufqC5RH_Te', 'JuVnevlBgml', 'JuDeBj46p9m', 
    'JulEUnG0Jam', 'JuGDxnx-MGv', 'JuqU9D7znCx', 'JuvbAAJAVQ8', 'JubDtFpPZPz', 
    'JukBZSTP0a5', 'Ju3mlopyrCW', 'Juy-j07S1W7', 'Ju_yl2A922o');
    
UPDATE offer_locations
SET location_area = 'Diviaky'
WHERE offer_id IN (
	 'JuBRCEsLH8a');
     
UPDATE offer_locations
SET location_area = 'Turčiansky Michal'
WHERE offer_id IN (
	 'JuiwpIv6ZO8n', 'JuJOjhQbYoo');
    
UPDATE offer_locations
SET location_area = 'Mošovce'
WHERE offer_id IN (
	 'Juc6GgFARDk');

UPDATE offer_locations
SET location_city = 'Mošovce'
WHERE offer_id IN (
	 'Juc6GgFARDk');

UPDATE offer_locations
SET location_area = 'Turček'
WHERE offer_id IN (
	 'JuvpwpffhEi');

UPDATE offer_locations
SET location_city = 'Turček'
WHERE offer_id IN (
	 'JuvpwpffhEi');

UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id IN (
	 'JuUZC8aojHf', 'JuDDQHUehhw', 'Juuarx0CWmR', 'JuOrA9qwl7f', 'Ju6Fxzj1aPV', 'JuIV5E-BtYf', 'JuMQiZOnaxz', 'Jum5hTEjQIq');
     
UPDATE offer_locations
SET location_area = 'Diviaky'
WHERE offer_id IN (
	 'Ju88ayVM-YP5');
     
UPDATE offer_locations
SET location_area = 'Turčiansky Michal'
WHERE offer_id IN (
	 'Ju1n1rQGodR');
     
UPDATE offer_locations
SET location_area = 'Jazernica'
WHERE offer_id IN (
	 'JuFnOWI1i1c', 'JuJU1QTMNeE');
     
UPDATE offer_locations
SET location_city = 'Jazernica'
WHERE offer_id IN (
	 'JuFnOWI1i1c', 'JuJU1QTMNeE');
     
UPDATE offer_locations
SET location_area = 'Kaľamenová'
WHERE offer_id IN (
	 'JuP5LbmRSZ8');
     
UPDATE offer_locations
SET location_city = 'Kaľamenová'
WHERE offer_id IN (
	 'JuP5LbmRSZ8');
    
UPDATE offer_locations
SET location_area = 'Budiš'
WHERE offer_id IN (
	 'JulxtEGlU-r');    

UPDATE offer_locations
SET location_city = 'Budiš'
WHERE offer_id IN (
	 'JulxtEGlU-r');   

UPDATE offer_locations
SET location_city = 'Košťany nad Turcom'
WHERE offer_id IN (
	 'JuFUoJz8z7g');   

UPDATE offer_locations
SET location_area = 'Košťany nad Turcom'
WHERE offer_id IN (
	 'JuFUoJz8z7g');   

UPDATE offer_locations
SET location_district = 'Martin'
WHERE offer_id IN (
	 'JuFUoJz8z7g');

UPDATE offer_locations
SET location_city = 'Valča'
WHERE offer_id IN (
	 'JuXgUKUYl2D');   

UPDATE offer_locations
SET location_area = 'Valča'
WHERE offer_id IN (
	 'JuXgUKUYl2D');   

UPDATE offer_locations
SET location_district = 'Martin'
WHERE offer_id IN (
	 'JuXgUKUYl2D');   
     

# OKRES DOLNÝ KUBÍN

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Dolný Kubín'
	AND location_city != 'Dolný Kubín';
    
UPDATE offer_locations
SET location_area = 'Mokraď'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND (title LIKE  '%Mokra%'
		OR location LIKE '%Mokra%');
        
UPDATE offer_locations
SET location_area = 'Záskalie'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND (title LIKE  '%Záskal%'
		OR location LIKE '%Záskal%');
        
UPDATE offer_locations
SET location_area = 'Malý Bysterec'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND (title LIKE  '%Mal%'
		OR location LIKE '%Mal%')
	AND (title LIKE  '%Byster%'
		OR location LIKE '%Byster%');
        
UPDATE offer_locations
SET location_area = 'Veľký Bysterec'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND (title LIKE  '%Veľk%'
		OR location LIKE '%Veľk%')
	AND (title LIKE  '%Byster%'
		OR location LIKE '%Byster%');
        
UPDATE offer_locations
SET location_area = 'Banisko'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND (title LIKE  '%Banisk%'
		OR location LIKE '%Banisk%');
        
UPDATE offer_locations
SET location_area = 'Brezovec'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND (title LIKE  '%Brezov%'
		OR location LIKE '%Brezov%');       
        
UPDATE offer_locations
SET location_area = 'Veľký Bysterec'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Bysterecká, Dolný Kubín, okres Dolný Kubín', 'Lucenkova, Dolný Kubín, okres Dolný Kubín', 
        'Na sihoti, Dolný Kubín, okres Dolný Kubín', 'Pelhřimovská, Dolný Kubín, okres Dolný Kubín', 
        'SNP, Dolný Kubín, okres Dolný Kubín', 'Športovcov, Dolný Kubín, okres Dolný Kubín');
    
UPDATE offer_locations
SET location_area = 'Malý Bysterec'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Fučíkova, Dolný Kubín, okres Dolný Kubín');
        
UPDATE offer_locations
SET location_area = 'Stred'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Gäceľská cesta, Dolný Kubín, okres Dolný Kubín', 'Hviezdoslavovo nám. 3686, Dolný Kubín, okres Dolný Kubín', 
        'Hviezdoslavovo námestie, Dolný Kubín, okres Dolný Kubín', 'Matúškova, Dolný Kubín, okres Dolný Kubín', 
        'Obrancov mieru, Dolný Kubín, okres Dolný Kubín', 'Československej armády, Dolný Kubín, okres Dolný Kubín');

UPDATE offer_locations
SET location_area = 'Brezovec'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Jána Hollého, Dolný Kubín, okres Dolný Kubín', 'Martina Hattalu, Dolný Kubín, okres Dolný Kubín', 
        'Mierová, Dolný Kubín, okres Dolný Kubín', 'Nemocničná 2068, Dolný Kubín, okres Dolný Kubín', 
        'Nemocničná, Dolný Kubín, okres Dolný Kubín', 'Ľ. Štúra, Dolný Kubín, okres Dolný Kubín', 
        'Ľudovíta Štúra, Dolný Kubín, okres Dolný Kubín');

UPDATE offer_locations
SET location_area = 'Banisko'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Jánoškova, Dolný Kubín, okres Dolný Kubín');

UPDATE offer_locations
SET location_area = 'Medzihradné'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Martina Hamuljaka, Dolný Kubín, okres Dolný Kubín');

UPDATE offer_locations
SET location_area = 'Záskalie'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Nad Brehmi, Dolný Kubín, okres Dolný Kubín');

UPDATE offer_locations
SET location_area = 'Kubínska hoľa'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND offer_id IN (
		'JuTmTC_fKnC', 'Ju9yeRQLBJd');
        
UPDATE offer_locations
SET location_area = 'Istebné'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Istebné, Dolný Kubín, okres Dolný Kubín');
        
UPDATE offer_locations
SET location_city = 'Istebné'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location IN (
		'Istebné, Dolný Kubín, okres Dolný Kubín');

UPDATE offer_locations
SET location_area = 'Kraľovany'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Kraľovany, Dolný Kubín, okres Dolný Kubín');
        
UPDATE offer_locations
SET location_city = 'Kraľovany'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location IN (
		'Kraľovany, Dolný Kubín, okres Dolný Kubín');
        
UPDATE offer_locations
SET location_area = 'Veličná'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location_area = ''
    AND location IN (
		'Veličná, Dolný Kubín, okres Dolný Kubín');
        
UPDATE offer_locations
SET location_city = 'Veličná'
WHERE location_district = 'okres Dolný Kubín'
	AND location_city = 'Dolný Kubín'
    AND location IN (
		'Veličná, Dolný Kubín, okres Dolný Kubín');
        
UPDATE offer_locations
SET location_area = 'Brezovec'
WHERE offer_id IN ('Ju8a3kcGYvG', 'Ju2W2fwASSP', 'JuSL8akIpnl');

UPDATE offer_locations
SET location_area = 'Veľký Bysterec'
WHERE offer_id IN ('Ju3ft9crnfA', 'Jun8HaIrjPB', 'JuauSxK_Grt', 'Juatx6SLjDH');

UPDATE offer_locations
SET location_area = 'Malý Bysterec'
WHERE offer_id IN ('JuT75QcQxxP');

UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id IN ('JubsYNuv_gH', 'JufEhhRezN-');

UPDATE offer_locations
SET location_area = 'Mokraď'
WHERE offer_id IN ('JugeXc96z-v');

# Rezidencia Košťany is in the Martin District, but it is also included in other districts
DELETE FROM offer_locations
WHERE offer_id IN ('JuCAoLux5O0', 'JuFUoJz8z7g', 'JuvnTkfCrNJ', 'JuXo1TVoC84');

# OKRES NÁMESTOVO

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Námestovo'
	AND location_city != 'Námestovo';

UPDATE offer_locations
SET location_area = 'Stred'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND location IN (
		'Cyrila a Metoda, Námestovo, okres Námestovo', 'Komenského, Námestovo, okres Námestovo', 
        'Rázusova, Námestovo, okres Námestovo', 'Červeného Kríža, Námestovo, okres Námestovo', 
        'Štefánikova 269, Námestovo, okres Námestovo', 'Štefánikova, Námestovo, okres Námestovo');
        
UPDATE offer_locations
SET location_area = 'Polom'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND location IN (
		'Kliňanská cesta, Námestovo, okres Námestovo');
    
UPDATE offer_locations
SET location_area = 'Brehy'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND location IN (
		'Severná, Námestovo, okres Námestovo', 'Slnečná, Námestovo, okres Námestovo', 
        'Veterná, Námestovo, okres Námestovo', 'Záhradkárska, Námestovo, okres Námestovo');
        
UPDATE offer_locations
SET location_area = 'Čerchle'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND location IN (
		'Čerchle, Námestovo, okres Námestovo');

UPDATE offer_locations
SET location_area = 'Slanická Osada'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND offer_id IN (
		'JuCh945YdSl', 'JufxA_4siD5');

UPDATE offer_locations
SET location_area = 'Brehy'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND offer_id IN (
		'Ju2txZynSMnS');
        
UPDATE offer_locations
SET location_area = 'Zubrohlava'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND offer_id IN (
		'JuIh9K2txJ3', 'JuRDPYuJ-Ru');
        
UPDATE offer_locations
SET location_city = 'Zubrohlava'
WHERE location_district = 'okres Námestovo'
	AND location_city = 'Námestovo'
    AND offer_id IN (
		'JuIh9K2txJ3', 'JuRDPYuJ-Ru');
    
UPDATE offer_locations
SET location_district = 'okres Tvrdošín'
WHERE offer_id = 'Ju7W5q5NyuP';
 
UPDATE offer_locations
SET location_city = ''
WHERE offer_id = 'Ju7W5q5NyuP';

DELETE FROM offer_locations
WHERE offer_id = 'JueR5iH76hh';

# OKRES TVRDOŠÍN

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Tvrdošín'
	AND location_city != 'Tvrdošín'
    AND location_city != 'Trstená';
    
UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id = 'Ju4hZgzLszu';

UPDATE offer_locations
SET location_city = 'Tvrdošín'
WHERE offer_id = 'Ju1PiVDdTRw';    
    
UPDATE offer_locations
SET location_area = 'Stred'
WHERE offer_id  IN ('Ju7J-Smt48P', 'JuC7FB5n3i0', 'JuZIrRq5Yby', 'Ju5JJVitOH3');

UPDATE offer_locations
SET location_area = 'Medvedzie'
WHERE offer_id = 'JuDCMQupxo0';

UPDATE offer_locations
SET location_area = 'Medvedzie'
WHERE offer_id = 'JuzzHVLtL7p';

UPDATE offer_locations
SET location_area = 'Medvedzie'
WHERE offer_id = 'JuuvunHgeuI';

UPDATE offer_locations
SET location_area = 'Medvedzie'
WHERE offer_id = 'Juh8S_7FwJj';

UPDATE offer_locations
SET location_area = 'Medvedzie'
WHERE offer_id = 'JuQydtvhuaC';

UPDATE offer_locations
SET location_area = 'Nižná'
WHERE offer_id = 'JucOec67NRR';

UPDATE offer_locations
SET location_city = 'Nižná'
WHERE offer_id = 'JucOec67NRR';

UPDATE offer_locations
SET location_area = 'Medvedzie'
WHERE offer_id = 'JueaMJQ3i3k';

UPDATE offer_locations
SET location_area = 'Medvedzie'
WHERE offer_id = 'Judr92_ylzz';

UPDATE offer_locations
SET location_area = 'Tvrdošín'
WHERE offer_id = 'JuRty8qQQ_7';

DELETE FROM offer_locations
WHERE offer_id = 'Ju1PiVDdTRw';

# OKRES RUŽOMBEROK

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Ružomberok'
	AND location_city != 'Ružomberok';
    
UPDATE offer_locations
SET location_area = 'Klačno'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Klačn%'
		OR location LIKE '%Klačn%');
        
UPDATE offer_locations
SET location_area = 'Baničné'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Baničn%'
		OR location LIKE '%Baničn%');
        
UPDATE offer_locations
SET location_area = 'Polík'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Polík%'
		OR location LIKE '%Polík%');
        
UPDATE offer_locations
SET location_area = 'Roveň'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Roveň%'
		OR title LIKE '%Rovn%'
		OR location LIKE '%Roveň%'
		OR location LIKE '%Rovn%');

UPDATE offer_locations
SET location_area = 'Biely Potok'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Potok%'
		OR location LIKE '%Potok%');
        
UPDATE offer_locations
SET location_area = 'Černová'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Černov%'
		OR location LIKE '%Černov%');
        
UPDATE offer_locations
SET location_area = 'Nová Hrboltová'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Nová Hrboltová%'
		OR location LIKE '%Nová Hrboltová%');
        
UPDATE offer_locations
SET location_area = 'Hrboltová'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Hrboltov%'
		OR location LIKE '%Hrboltov%');
        
UPDATE offer_locations
SET location_area = 'Rybárpole'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Rybárpol%'
		OR location LIKE '%Rybárpol%');
        
UPDATE offer_locations
SET location_area = 'Hrabovo'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Hrabov%'
		OR location LIKE '%Hrabov%');
        
DELETE FROM offer_locations
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND title LIKE '%TESTOVAC%';
    
UPDATE offer_locations
SET location_area = 'Likavka'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Likavk%'
		OR location LIKE '%Likavk%');
        
UPDATE offer_locations
SET location_city = 'Likavka'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND (title LIKE '%Likavk%'
		OR location LIKE '%Likavk%');
        
UPDATE offer_locations
SET location_area = 'Liptovská Osada'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Osad%'
		OR location LIKE '%Osad%');
        
UPDATE offer_locations
SET location_city = 'Liptovská Osada'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND (title LIKE '%Osad%'
		OR location LIKE '%Osad%');
        
UPDATE offer_locations
SET location_area = 'Liptovská Teplá'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Tepl%'
		OR location LIKE '%Tepl%');
        
UPDATE offer_locations
SET location_city = 'Liptovská Teplá'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND (title LIKE '%Tepl%'
		OR location LIKE '%Tepl%');
        
UPDATE offer_locations
SET location_area = 'Liptovská Štiavnica'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Štiav%'
		OR location LIKE '%Štiav%');
        
UPDATE offer_locations
SET location_city = 'Liptovská Štiavnica'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND (title LIKE '%Štiav%'
		OR location LIKE '%Štiav%');
        
UPDATE offer_locations
SET location_city = 'Liptovské Sliače'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND (title LIKE '%Sliač%'
		OR location LIKE '%Sliač%');
        
UPDATE offer_locations
SET location_area = 'Liptovské Sliače'
WHERE location_city = 'Liptovské Sliače';

UPDATE offer_locations
SET location_area = 'Ludrová'
WHERE offer_id = 'JuPmsU7zgrG';

UPDATE offer_locations
SET location_city = 'Ludrová'
WHERE offer_id = 'JuPmsU7zgrG';

UPDATE offer_locations
SET location_area = 'Roveň'
WHERE offer_id IN (
	'JuH-SEIASle',
	'JuaCjfZIx81',
	'JuIP59md355',
	'JuhxKlECA3G',
	'JuRDmAO0N5y',
	'JuyticuaW7A',
	'JuxFFLySNPg',
	'JuInvssV5eE',
	'JuV9NY1IIlj',
	'JuFOaiRGATh');
    
UPDATE offer_locations
SET location_area = 'Baničné'
WHERE offer_id IN (
	'JuDjC6lbUrb',
	'Jux9NoUYkfu',
	'Jue8OEdDtFX',
	'JuXBeof4cBw',
	'JuvSfTkJipf',
	'JudY9Gw22hd',
	'JuVPG71X4Wz');
    

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (
		'Antona Bernoláka, Ružomberok, okres Ružomberok', 'Karola Antona Medveckého  7, Ružomberok, okres Ružomberok', 
        'Karola Antona Medveckého 7, Ružomberok, okres Ružomberok', 'Mostová, Ružomberok, okres Ružomberok', 
        'Nám. A. Hlinku, Ružomberok, okres Ružomberok', 'Námestie Andreja Hlinku, Ružomberok, okres Ružomberok', 
        'Považská, Ružomberok, okres Ružomberok', 'R.Dúbravca, Ružomberok, okres Ružomberok', 'Riadok, Ružomberok, okres Ružomberok', 
        'Pod cintorínom, Ružomberok, okres Ružomberok', 'Ružová, Ružomberok, okres Ružomberok');

UPDATE offer_locations
SET location_area = 'Polík'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (        
		'D. Makovického, Ružomberok, okres Ružomberok', 'D.Makovického, Ružomberok, okres Ružomberok');

UPDATE offer_locations
SET location_area = 'Roveň'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (                
		'Gen. Miloša Vesela 86, Ružomberok, okres Ružomberok', 'Gen. Miloša Vesela, Ružomberok, okres Ružomberok');

UPDATE offer_locations
SET location_area = 'Baničné'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (     	
		'I.Houdeka, Ružomberok, okres Ružomberok', 'Papiernicka, Ružomberok, okres Ružomberok');
        
UPDATE offer_locations
SET location_area = 'Klačno'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (     	
		'Lesná, Ružomberok, okres Ružomberok', 'Liptovská, Ružomberok, okres Ružomberok', 
        'Veterná, Ružomberok, okres Ružomberok');
        
UPDATE offer_locations
SET location_area = 'Rybárpole'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (     	        
		'Malé Tatry, Ružomberok, okres Ružomberok');
        
UPDATE offer_locations
SET location_area = 'Pod Skalami'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (          
		'Pod Skalami, Ružomberok, okres Ružomberok', 'Sládkovičova 262, Ružomberok, okres Ružomberok');
        
UPDATE offer_locations
SET location_area = 'Biely Potok'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN ('SNP, Ružomberok, okres Ružomberok');

UPDATE offer_locations
SET location_area = 'Roveň'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (
		'Tatranská cesta, Ružomberok, okres Ružomberok', 'Za dráhou, Ružomberok, okres Ružomberok');
        
UPDATE offer_locations
SET location_area = 'Polík'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location IN (
		'Štefana Moyzesa, Ružomberok, okres Ružomberok');

UPDATE offer_locations
SET location_area = 'Komjatná'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location_area = ''
    AND location = 'Komjatná, Ružomberok, okres Ružomberok';
    
UPDATE offer_locations
SET location_city = 'Komjatná'
WHERE location_district = 'okres Ružomberok'
	AND location_city = 'Ružomberok'
    AND location = 'Komjatná, Ružomberok, okres Ružomberok';

UPDATE offer_locations
SET location_area = 'Kraľovany'
WHERE offer_id = 'JuxW1O4IZfX';

UPDATE offer_locations
SET location_city = 'Kraľovany'
WHERE offer_id = 'JuxW1O4IZfX';

UPDATE offer_locations
SET location_district = 'okres Dolný Kubín'
WHERE offer_id = 'JuxW1O4IZfX';

UPDATE offer_locations
SET location_area = 'Roveň'
WHERE offer_id IN (
	'Juacbmz9XNp', 'JukRhMNGZ-C', 'Juq8LRZ6yKQ',  'JuoVsoGKe3I');
    
UPDATE offer_locations
SET location_area = 'Baničné'
WHERE offer_id IN (
	'JugK_iVZsVR', 'Jul9YtuXJRu', 'JueQzTcIDeQ', 'Ju40F3aMhkE', 'Juk7YsiM63G', 
    'JufCUUh8n1P', 'JusX_sL1pCY', 'JucIMMNEosV');

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id IN (
	'JuCzDBx82gn', 'JuA1jb9HH8o', 'JuZUmgJDVA2', 'JuySZhvO7pX', 'JunJQlPuUZ5', 'JuPLeekzh_5', 
    'Ju1HQtU3BUR', 'JuajpkZsNxA', 'Ju3LCu23qXh', 'Jux6Z04Xzh-');
    
UPDATE offer_locations
SET location_area = 'Rybárpole'
WHERE offer_id = 'JuD2CR5HuKc';

UPDATE offer_locations
SET location_area = 'Klačno'
WHERE offer_id = 'JuwROzF7MPz';

UPDATE offer_locations
SET location_area = 'Gejdák'
WHERE offer_id = 'JuPaAE99_20';

UPDATE offer_locations
SET location_area = 'Hrabovo'
WHERE offer_id = 'JuDIbuwkSMQ';

UPDATE offer_locations
SET location_area = 'Polík'
WHERE offer_id = 'Ju6KRY_ibJj';

UPDATE offer_locations
SET location_area = 'Revúcka dolina'
WHERE offer_id = 'JuSwT_XLgPV';

DELETE FROM offer_locations
WHERE offer_id IN (
	'JuCyi8Nz0oh', 'JucdJl6RAZz', 'JuZMRH4zm4d', 'Jud3PtJyl7P', 
    'Ju53Xu6DNDM', 'Ju-yFk1s-Qs', 'JuLxKNZaVEo', 'JuHB-4yW8w7');

UPDATE offer_locations
SET location_area = 'Martinček'
WHERE offer_id = 'JuUOF1Y8GRc';

UPDATE offer_locations
SET location_city = 'Martinček'
WHERE offer_id = 'JuUOF1Y8GRc';

UPDATE offer_locations
SET location_area = 'Ľubochňa'
WHERE offer_id = 'JuKQcfqPzaF';

UPDATE offer_locations
SET location_city = 'Ľubochňa'
WHERE offer_id = 'JuKQcfqPzaF';

UPDATE offer_locations
SET location_area = 'Liptovské Sliače'
WHERE offer_id IN ('JuL3EMccaWT', 'Juo5DPi-NX1', 'Juv3W5C4xtN_');

UPDATE offer_locations
SET location_city = 'Liptovské Sliače'
WHERE offer_id IN ('JuL3EMccaWT', 'Juo5DPi-NX1', 'Juv3W5C4xtN_');

UPDATE offer_locations
SET location_area = 'Liptovské Revúce'
WHERE offer_id = 'Jut1FKOGHsr';

UPDATE offer_locations
SET location_city = 'Liptovské Revúce'
WHERE offer_id = 'Jut1FKOGHsr';

UPDATE offer_locations
SET location_area = 'Gejdák'
WHERE offer_id = 'JuUeAjh6h4i';


# OKRES LIPTOVSKÝ MIKULÁŠ

UPDATE offer_locations
SET location_area = location_city
WHERE location_district = 'okres Liptovský Mikuláš'
	AND location_city != 'Liptovský Mikuláš'
    AND location_city != 'Liptovský Hrádok';

UPDATE offer_locations
SET location_area = 'Belánska'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Hrádok'
    AND location_area = ''
    AND (title LIKE '%Belánsk%'
		OR location LIKE '%Belánsk%');
        
UPDATE offer_locations
SET location_area = 'Celiny'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Hrádok'
    AND location_area = ''
    AND location = 'Dr. A. Škarvana, Liptovský Hrádok, okres Liptovský Mikuláš';

UPDATE offer_locations
SET location_area = 'Liptovská Kokava'
WHERE offer_id = 'JuJITXm9Zsf';

UPDATE offer_locations
SET location_city = 'Liptovská Kokava'
WHERE offer_id = 'JuJITXm9Zsf';

UPDATE offer_locations
SET location_area = 'Dovalovo'
WHERE offer_id IN (
	'Ju_Lr-2Vc09', 'JuZdV5jCSUO', 'JuUrOuQWCVS', 'Ju8yXTZyQ0c', 'JuoszPD854T', 
    'JucEPDkzxLE', 'JuuYuhMI403', 'Ju_5Xv4V0EB', 'JulOG-brCZ9', 'JuV6E0eOThi', 
    'JuJYdMwBoGD');
    
UPDATE offer_locations
SET location_area = 'Prekážka'
WHERE offer_id IN (
	'JuSTaf-asxr', 'JureCrsruRg', 'JuGDOocgqAc', 'JuXUHfW6DDJ', 'JuMuHR9ALAx', 'JuSCw29I996');
    
UPDATE offer_locations
SET location_area = 'Nižné Fabriky'  
WHERE offer_id = 'Jua80WPKb_h';

UPDATE offer_locations
SET location_area = 'Podbreziny'  
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Podbrezin%'
		OR location LIKE '%Pedbrezin%');
        
UPDATE offer_locations
SET location_area = 'Vrbica - Nábrežie'  
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Vrbic%'
		OR location LIKE '%Vrbic%');
        
UPDATE offer_locations
SET location_area = 'Staré mesto'  
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Staré mesto%'
		OR location LIKE '%Staré mesto%');    
        
UPDATE offer_locations
SET location_area = 'Palúdzka'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Palúdzk%'
		OR location LIKE '%Palúdzk%');
        
UPDATE offer_locations
SET location_area = 'Liptovská Ondrašová'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Ondrašov%'
		OR location LIKE '%Ondrašov%');
        
UPDATE offer_locations
SET location_area = 'Okoličné'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Okoličn%'
		OR location LIKE '%Okoličn%');
        
UPDATE offer_locations
SET location_area = 'Demänová'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Demänov%'
		OR location LIKE '%Demänov%');  
        
UPDATE offer_locations
SET location_area = 'Ploštín'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Ploštín%'
		OR location LIKE '%Ploštín%');
        
UPDATE offer_locations
SET location_area = 'Iľanovo'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Iľanov%'
		OR location LIKE '%Iľanov%');
        
UPDATE offer_locations
SET location_area = 'Bodice' 
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Bodic%'
		OR location LIKE '%Bodic%');   

UPDATE offer_locations
SET location_area = 'Stošice'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Stošic%'
		OR location LIKE '%Stošic%'); 
        
UPDATE offer_locations
SET location_area = 'Benice'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND (title LIKE '%Benic%'
		OR location LIKE '%Benic%');   

UPDATE offer_locations
SET location_area = 'Vrbica - Nábrežie'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (
		'Alexyho, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Bellova, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Belopotockého 1883, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Borbisova, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Dr. Aurela Stodolu, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Kollárova, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Nešporova, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Nábrežie Dr. Aurela Stodolu, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Nábrežie, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Vrlíkova, Liptovský Mikuláš, okres Liptovský Mikuláš');

UPDATE offer_locations
SET location_area = 'Palúdzka'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (
		'Antona Droppu, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Chrenoviská, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'J. Žuffu, Liptovský Mikuláš, okres Liptovský Mikuláš', 'J.M.Oberuča 6, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Júliusa Lenka, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Palugyayho, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Vladimíra Kunu 730/2, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (        
		'Hurbanova, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Kapitána Nálepku, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Komenského, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Kpt. Nálepku, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Kukučínova, Liptovský Mikuláš, okres Liptovský Mikuláš', 'M. Pišúta, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Milana Pišúta, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Námestie Osloboditeľov 18A, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Námestie Osloboditeľov, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Stodolova, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Tranovského, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Tretia, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Čsl. Brigády, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Štefánikova 1780/12, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Štefánikova, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Štúrova, Liptovský Mikuláš, okres Liptovský Mikuláš');

UPDATE offer_locations
SET location_area = 'Podbreziny'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (             
		'Jabloňová, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Jahodová, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Jefremovská, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Kemi, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        'Morušová, Liptovský Mikuláš, okres Liptovský Mikuláš', 'Podbreziny Háje, Liptovský Mikuláš, okres Liptovský Mikuláš');

UPDATE offer_locations
SET location_area = 'Vitálišovce'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN ( 
		'Vitališovská, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Stošice'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN ( 
		'Štojšová, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Beňadiková'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (         
		'Beňadiková, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_city = 'Beňadiková'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location IN (         
		'Beňadiková, Liptovský Mikuláš, okres Liptovský Mikuláš');       

UPDATE offer_locations
SET location_area = 'Jamník'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (    
		'Jamník, Liptovský Mikuláš, okres Liptovský Mikuláš');
        

UPDATE offer_locations
SET location_city = 'Jamník'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location IN (    
		'Jamník, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Lazisko'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (   
		'Lazisko, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_city = 'Lazisko'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location IN (   
		'Lazisko, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Liptovská Anna'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (           
		'Liptovská Anna, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_city = 'Liptovská Anna'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location IN (           
		'Liptovská Anna, Liptovský Mikuláš, okres Liptovský Mikuláš');

UPDATE offer_locations
SET location_area = 'Liptovský Trnovec'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (  
		'Liptovský Trnovec, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_city = 'Liptovský Trnovec'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location IN (  
		'Liptovský Trnovec, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Malé Borové'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (  
		'Malé Borové, Liptovský Mikuláš, okres Liptovský Mikuláš');

UPDATE offer_locations
SET location_city = 'Malé Borové'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location IN (  
		'Malé Borové, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Pavčina Lehota'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (  
		'Pavčina Lehota, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_city = 'Pavčina Lehota'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location IN (  
		'Pavčina Lehota, Liptovský Mikuláš, okres Liptovský Mikuláš');
        
UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE location_district = 'okres Liptovský Mikuláš'
    AND location_city = 'Liptovský Mikuláš'
    AND location_area = ''
    AND location IN (  
		'1. mája, Liptovský Mikuláš, okres Liptovský Mikuláš', '1. Mája, Liptovský Mikuláš, okres Liptovský Mikuláš', 
        '1.mája, Liptovský Mikuláš, okres Liptovský Mikuláš');


UPDATE offer_locations
SET location_area = 'Liptovská Ondrašová'
WHERE offer_id IN (
	'Ju4N6fIAndO');

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id IN (
	'JulUy_Gy-T7', 'JuU5AQijDSV', 'JueH_k99MSI', 'Ju-lRWjvao3', 'JuJZH5W0xc8', 'JuKVTIO-aDH', 'JuyIru5Z-bn', 
    'Ju_P4weQ1yi', 'JuwJKqBh04b', 'Ju-fM3SCXjma', 'JutKisdKgjR', 'JuA6AvNGWkt', 'JuniaoRdvqE', 'JudGtDjR-sv', 
    'JurI-U1p2qQ');
    
UPDATE offer_locations
SET location_area = 'Vrbica - Nábrežie'
WHERE offer_id IN (    
	'JuYEF2k-qam', 'JuXGzvpMBBm', 'JudLFAAMGyd', 'Ju6CbHXXMaR', 'Ju2MLh38AzW');

UPDATE offer_locations
SET location_area = 'Palúdzka'
WHERE offer_id IN (
	'JuqUuNNcs6x', 'Jueq_fze_5r');
    
UPDATE offer_locations
SET location_area = 'Demänová'
WHERE offer_id IN (    
	'JuWKKdSpysj');
    
UPDATE offer_locations
SET location_area = 'Bodice'
WHERE offer_id IN (   
	'JuTsKQYVo81');
    
UPDATE offer_locations
SET location_area = 'Andice'
WHERE offer_id IN (   
	'Ju_WEW0Dt4l');
    
UPDATE offer_locations
SET location_area = 'Podbreziny'
WHERE offer_id IN (
	'JuiHO4ziDsX', 'JuN4Ko5MTcJ');

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id IN (
	'JuWNTIbPUJS', 'JubLSsddj46');
    
UPDATE offer_locations
SET location_area = 'Liptovská Mara - Tatralandia'
WHERE offer_id IN (
	'Ju_7fjs1rDI', 'JuZqtWo-t_S', 'JuZK70yldNu', 'JuI6MQ6tc2T', 'Juh1ylk55iy', 'JuRJMz106O3', 
    'JuOs2hhR_fq', 'JuVAMiylcZs', 'JuUYkSiI3DC', 'Juga_SyTI4R', 'Ju0wXtJ_miO', 'JulVwlSvctK', 
    'JudF4Y5NRYO', 'JuMCxXCgucb', 'Ju-rzMotwKF');
    
UPDATE offer_locations
SET location_area = 'Demänovská Dolina'
WHERE offer_id IN (
	'JuhigkHR5x2', 'JumNtvscU-s');
    
UPDATE offer_locations
SET location_city = 'Demänovská Dolina'
WHERE offer_id IN (
	'JuhigkHR5x2', 'JumNtvscU-s');
    
UPDATE offer_locations
SET location_area = 'Vyšná Boca'
WHERE offer_id IN (
	'Ju1AcChzPhX');
    
UPDATE offer_locations
SET location_city = 'Vyšná Boca'
WHERE offer_id IN (
	'Ju1AcChzPhX');

UPDATE offer_locations
SET location_area = 'Dúbrava'
WHERE offer_id IN (
	'JuWeOewD3Gg');
    
UPDATE offer_locations
SET location_city = 'Dúbrava'
WHERE offer_id IN (
	'JuWeOewD3Gg');

UPDATE offer_locations
SET location_area = 'Pribylina'
WHERE offer_id IN (
	'JuQ2hrgTY7r');
    
UPDATE offer_locations
SET location_city = 'Pribylina'
WHERE offer_id IN (
	'JuQ2hrgTY7r');

UPDATE offer_locations
SET location_area = 'Liptovská Anna'
WHERE offer_id IN (
	'JuPGYcuAlfl');
    
UPDATE offer_locations
SET location_city = 'Liptovská Anna'
WHERE offer_id IN (
	'JuPGYcuAlfl');

UPDATE offer_locations
SET location_area = 'Podsuchá'
WHERE offer_id IN (
	'JuIw5kl0QB9');
    
UPDATE offer_locations
SET location_city = 'Ružomberok'
WHERE offer_id IN (
	'JuIw5kl0QB9');
    
UPDATE offer_locations
SET location_district = 'okres Ružomberok'
WHERE offer_id IN (
	'JuIw5kl0QB9');

DELETE FROM offer_locations
WHERE offer_id IN (
	'Ju25L6t7egU', 'Jukh7ShziCp', 'JuMmFwDvobZ', 'Ju3FTuEEkm2', 'JuazCL1T27p', 'Ju8pNqlVDEE', 
    'JupeajWr4ykV', 'Ju09r1I1ST_', 'JuCdSqdzbEt', 'JuR64EZUgdH');


# FURTHER CLEANING

UPDATE offer_locations
SET location_district = 'okres Liptovský Mikuláš'
WHERE offer_id = 'Jux885vgQgO';

UPDATE offer_locations
SET location_city = 'Liptovský Trnovec'
WHERE offer_id = 'Jux885vgQgO';

UPDATE offer_locations
SET location_area = 'Liptovský Trnovec'
WHERE offer_id = 'Jux885vgQgO';

UPDATE offer_locations
SET location_district = 'okres Martin'
WHERE offer_id = 'JuUwCeqXqPl';

UPDATE offer_locations
SET location_city = 'Martin'
WHERE offer_id = 'JuUwCeqXqPl';

UPDATE offer_locations
SET location_area = 'Jahodníky'
WHERE offer_id = 'JuUwCeqXqPl';

UPDATE offer_locations
SET location_district = 'okres Liptovský Mikuláš'
WHERE offer_id = 'JunM5Oyfta7';

UPDATE offer_locations
SET location_city = 'Liptovský Hrádok'
WHERE offer_id = 'JunM5Oyfta7';

UPDATE offer_locations
SET location_district = 'okres Žilina'
WHERE offer_id = 'JuU-rP3IJ1-';

UPDATE offer_locations
SET location_city = 'Žilina'
WHERE offer_id = 'JuU-rP3IJ1-';

UPDATE offer_locations
SET location_area = 'Staré mesto'
WHERE offer_id = 'JuU-rP3IJ1-';

UPDATE offer_locations
SET location_district = 'okres Žilina'
WHERE offer_id = 'JuOH45yXH5x';

UPDATE offer_locations
SET location_city = 'Rajec'
WHERE offer_id = 'JuOH45yXH5x';

UPDATE offer_locations
SET location_area = 'Rajec'
WHERE offer_id = 'JuOH45yXH5x';

ALTER TABLE offer_locations
DROP COLUMN title;

ALTER TABLE offer_locations
DROP COLUMN location;

UPDATE offer_locations
SET location_city = NULL
WHERE location_city = '';

UPDATE offer_locations
SET location_area = NULL
WHERE location_area = '';

SELECT * 
FROM offer_locations;
