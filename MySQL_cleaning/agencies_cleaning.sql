USE real_estates;

UPDATE agencies
SET agency = NULL
WHERE agency = '';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE office_city LIKE '%Bratislava%';

UPDATE agencies
SET office_city = 'Košice'
WHERE office_city LIKE '%Košice%';

UPDATE agencies
SET office_city = NULL
WHERE office_city = '';

UPDATE agencies
SET office_city = 'Žilina'
WHERE office_city = '100011403';

UPDATE agencies
SET office_address = NULL
WHERE office_address = '';

UPDATE agencies
SET office_city = 'Ovčiarsko'
WHERE agency = 'ADH-REAL s.r.o. Hirjaková Adriana';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'ADH-REAL s.r.o. Hirjaková Adriana';

UPDATE agencies
SET office_city = 'Bučany'
WHERE agency = 'Bonjour real';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'Bonjour real';

UPDATE agencies
SET office_city = 'Žilina'
WHERE agency = 'Euro Bauer s.r.o.';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'Euro Bauer s.r.o.';

UPDATE agencies
SET office_city = 'Bytča'
WHERE agency = 'Fortio Popper s.r.o.';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'Fortio Popper s.r.o.';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'HERRYS s.r.o.';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'HERRYS s.r.o.';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'M&G, s.r.o.';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'M&G, s.r.o.';


UPDATE agencies
SET office_city = 'Liptovská Lúžna'
WHERE agency = 'Obec Liptovská Lúžna';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'Obec Liptovská Lúžna';

UPDATE agencies
SET office_city = 'Brno'
WHERE agency = 'OPENREALITY';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'OPENREALITY';

UPDATE agencies
SET office_city = 'Příbor'
WHERE agency = 'Stanislav Slovák';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'Stanislav Slovák';

UPDATE agencies
SET office_city = 'Dolný Kubín'
WHERE agency = 'RK VILLEA, s. r. o.';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'RK VILLEA, s. r. o.';

UPDATE agencies
SET office_city = 'Senec'
WHERE agency = 'TL Agentura s.r.o';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'TL Agentura s.r.o';

UPDATE agencies
SET office_city = 'Žilina'
WHERE agency = 'YFE, s.r.o.';

UPDATE agencies
SET office_address = NULL
WHERE agency = 'YFE, s.r.o.';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'AP REAL, s.r.o.';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'BAU holding - rodinné domy, s. r. o.';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'Domovia s. r. o.';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'Envire';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'MS Alpex, k.s.';

UPDATE agencies
SET office_city = 'Bratislava'
WHERE agency = 'Prvá Realitná Kancelária, s.r.o.';

ALTER TABLE agencies
DROP COLUMN office_address;

SELECT *
FROM agencies;