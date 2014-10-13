--FUNCAO
CREATE or REPLACE FUNCTION tempo(data_tab timestamp) RETURNS boolean 
AS $$
    DECLARE
        curtime timestamp := now();
		resposta boolean := false;
    BEGIN
        IF data_tab > curtime THEN
			resposta := true;
		END IF;
		RETURN resposta;
    END;
$$ LANGUAGE plpgsql IMMUTABLE;


--DROP INDEX nome_origem_idx;

-----
-- INDICE
CREATE INDEX nome_origem_idx 
	ON boleia (nome_origem, data_hora) 
	WHERE nome_origem = 'IST-Tagus' 
	AND tempo(data_hora);
	
--------
--TESTAR
/**
SELECT * 
FROM boleia
WHERE nome_origem = 'IST-Tagus' AND tempo(data_hora);

-----
INSERT INTO Boleia VALUES ('alex_','2023-06-03 07:00:50'::timestamp, 4, 'Lisboa', 'Alameda', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2022-06-03 07:00:50'::timestamp, 4, 'Lisboa', 'Alameda', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2021-06-03 07:00:50'::timestamp, 4, 'Lisboa', 'Alameda', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2008-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2009-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2010-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2011-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2012-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2013-06-03 07:00:50'::timestamp, 4, 'Lisboa', 'Alameda', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2014-06-03 07:00:50'::timestamp, 4, 'Lisboa', 'Alameda', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2015-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2016-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2017-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2018-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2019-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('alex_','2020-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
**/
