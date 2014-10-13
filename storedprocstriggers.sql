---RESTRIÇOES

--A)
DROP TRIGGER sub_saldo ON inscricaop;
DROP FUNCTION sub_saldo();
CREATE FUNCTION sub_saldo() RETURNS TRIGGER 
AS 
$$
    DECLARE
       saldo1 utente.saldo%TYPE;
	   custo1 boleia.custo_passageiro%TYPE;
    BEGIN
        SELECT saldo 
		INTO saldo1
		FROM utente
		WHERE utente.nick=NEW.nick_passageiro;
		
		SELECT custo_passageiro 
		INTO custo1
		FROM boleia
		WHERE NEW.data_hora=boleia.data_hora AND NEW.nick_organizador=boleia.nick;
		
		IF saldo1 < custo1 THEN
			RAISE EXCEPTION 'O seu saldo nao é suficiente para participar nesta boleia.';
		ELSE
			saldo1 := saldo1 - custo1;
			UPDATE utente 
			SET saldo = saldo1
			WHERE utente.nick=NEW.nick_passageiro;
			RETURN NEW;
		END IF;	
    END
$$
 LANGUAGE 'plpgsql';

CREATE TRIGGER sub_saldo
BEFORE INSERT ON inscricaop
FOR EACH ROW
EXECUTE PROCEDURE sub_saldo();

--INSERT INTO Inscricaop values ('guilherme_', 'luis_','2013-10-18 17:25:50'::timestamp); --saldo nao e suficiente
--INSERT INTO Inscricaop values ('bernardo_', 'luis_','2013-10-18 17:25:50'::timestamp); --increve-se

--- B)
DROP TRIGGER associacao ON boleia;
DROP FUNCTION associacao();
CREATE FUNCTION associacao() RETURNS TRIGGER 
AS 
$$
    DECLARE
       npassageiros integer;
	   max_ocupantes viatura.maxocupantes%TYPE;
    BEGIN
        SELECT maxocupantes 
		INTO max_ocupantes
		FROM viatura
		WHERE NEW.nick_condutor=viatura.nick 
		AND NEW.matricula=viatura.matricula;
		
		SELECT count(*) 
		INTO npassageiros
		FROM boleia NATURAL JOIN inscricaop
		WHERE NEW.data_hora=boleia.data_hora 
		AND NEW.nick=boleia.nick
		GROUP BY inscricaop.nick_organizador,inscricaop.data_hora;
		
		IF max_ocupantes <= npassageiros THEN
			RAISE EXCEPTION 'O seu carro nao tem lugares suficientes.';
		ELSE
			RETURN NEW;	
		END IF;	
		
    END
$$
 LANGUAGE 'plpgsql';
CREATE TRIGGER associacao
BEFORE UPDATE ON boleia
FOR EACH ROW
EXECUTE PROCEDURE associacao();

------------
--update boleia set nick_condutor='rui_', matricula= 'EG-20-45' where nick='luis_' and data_hora='2013-10-18 17:25:50'::timestamp; -- da excepcao
--update boleia set nick_condutor='andreia_', matricula= '93-07-NX' where nick='luis_' and data_hora='2013-10-18 17:25:50'::timestamp;  --faz update
