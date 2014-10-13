INSERT INTO Utente VALUES ('rui_', 'Rui Santos', '54654654', 180);
INSERT INTO Utente VALUES ('sofia_', 'Sofia Martins', '46546546', 60);
INSERT INTO Utente VALUES ('andreia_', 'Andreia Santos', '9878', 46);
INSERT INTO Utente VALUES ('antonio_', 'Antonio Amaral', '1651651', 60);
INSERT INTO Utente VALUES ('maria_', 'Maria Flores', '8761351', 20);
INSERT INTO Utente VALUES ('joao_', 'Joao Amaro', '212254', 25);
INSERT INTO Utente VALUES ('alex_', 'Alex Freitas', '987984', 60);
INSERT INTO Utente VALUES ('luis_', 'Luis Carlos', '564544', 15);
INSERT INTO Utente VALUES ('guilherme_', 'Guilherme Vale', '74623292', 0);
INSERT INTO Utente VALUES ('bernardo_', 'Bernardo Simoes', '3674823', 70);
INSERT INTO Utente VALUES ('christine_', 'Christine Blakemore', '84726516', 50);

INSERT INTO Aluno VALUES ('rui_', 'LEIC');
INSERT INTO Aluno VALUES ('sofia_', 'LEIC');
INSERT INTO Aluno VALUES ('andreia_', 'LERC');
INSERT INTO Aluno VALUES ('antonio_', 'LEGI');
INSERT INTO Aluno VALUES ('guilherme_', 'LERC');

INSERT INTO Viatura VALUES ('87-FD-02', 'opel', 'corsa', 5, 'antonio_');
INSERT INTO Viatura VALUES ('EG-20-45', 'fiat', 'punto', 3, 'rui_');
INSERT INTO Viatura VALUES ('56-FD-65', 'chevrolet', 'aveo', 4, 'sofia_');
INSERT INTO Viatura VALUES ('93-07-NX', 'citroen', 'saxo', 5, 'andreia_');

INSERT INTO Docente VALUES ('maria_');
INSERT INTO Docente VALUES ('joao_');
INSERT INTO Docente VALUES ('bernardo_');

INSERT INTO Funcionario VALUES ('alex_');
INSERT INTO Funcionario VALUES ('luis_');
INSERT INTO Funcionario VALUES ('christine_');

INSERT INTO Condutor VALUES ('rui_');
INSERT INTO Condutor VALUES ('sofia_');
INSERT INTO Condutor VALUES ('andreia_');
INSERT INTO Condutor values ('antonio_');
INSERT INTO Condutor values ('maria_');
INSERT INTO Condutor values ('joao_');
INSERT INTO Condutor values ('alex_');
INSERT INTO Condutor values ('luis_');
INSERT INTO Condutor values ('bernardo_');
INSERT INTO Condutor values ('christine_');
INSERT INTO Condutor values ('guilherme_');

INSERT INTO Passageiro VALUES ('rui_');
INSERT INTO Passageiro VALUES ('sofia_');
INSERT INTO Passageiro VALUES ('andreia_');
INSERT INTO Passageiro VALUES ('antonio_');
INSERT INTO Passageiro VALUES ('maria_');
INSERT INTO Passageiro VALUES ('alex_');
INSERT INTO Passageiro VALUES ('luis_');
INSERT INTO Passageiro VALUES ('joao_');
INSERT INTO Passageiro VALUES ('guilherme_');
INSERT INTO Passageiro VALUES ('bernardo_');
INSERT INTO Passageiro VALUES ('christine_');

INSERT INTO Local VALUES ('IST-Tagus', 80, 80);
INSERT INTO Local VALUES ('Lisboa', 50, 50);
INSERT INTO Local VALUES ('Alameda', 40, 40);
INSERT INTO Local VALUES ('BP', 30,40);
INSERT INTO Local VALUES ('OP', 10,10);
INSERT INTO Local VALUES ('Oeiras', 10 , 15);
INSERT INTO Local VALUES ('Queijas', 20 , 15);

INSERT INTO Trajeto VALUES ('IST-Tagus', 'Lisboa');
INSERT INTO Trajeto VALUES ('IST-Tagus', 'Oeiras');
INSERT INTO Trajeto VALUES ('Lisboa', 'Alameda');
INSERT INTO Trajeto VALUES ('Oeiras', 'OP');
INSERT INTO Trajeto VALUES ('BP', 'Lisboa');
--INSERT INTO Trajeto VALUES ('IST-Tagus', 'Queijas');  --trajecto com origem no IST-Tagus sem boleias

INSERT INTO Boleia VALUES ('alex_','2012-05-13 08:15:31'::timestamp, 4, 'IST-Tagus', 'Lisboa', 'sofia_',  '56-FD-65'); 		-- freq
INSERT INTO Boleia VALUES ('luis_','2010-04-07 12:30:15'::timestamp, 3, 'Lisboa', 'Alameda', 'rui_', 'EG-20-45'); 			-- unica
INSERT INTO Boleia VALUES ('luis_','2010-08-29 10:00:00'::timestamp, 3, 'Lisboa', 'Alameda', NULL, NULL); 					-- unica
INSERT INTO Boleia VALUES ('sofia_','2011-02-10 11:05:20'::timestamp, 5, 'IST-Tagus', 'Oeiras', 'sofia_',  '93-07-NX'); 	-- unica
INSERT INTO Boleia VALUES ('andreia_','2011-03-21 06:45:00'::timestamp, 8, 'IST-Tagus', 'Oeiras', 'sofia_',  'EG-20-45'); 	-- unica
INSERT INTO Boleia VALUES ('andreia_','2012-05-21 20:15:00'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 	-- unica
INSERT INTO Boleia VALUES ('alex_','2012-06-03 07:00:50'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 		-- unica
INSERT INTO Boleia VALUES ('andreia_','2013-01-10 10:15:00'::timestamp, 4, 'IST-Tagus', 'Oeiras', 'sofia_',  '56-FD-65'); 	-- unica
INSERT INTO Boleia VALUES ('luis_','2013-10-18 17:25:50'::timestamp, 3, 'Lisboa', 'Alameda', NULL, NULL); 					-- unica

INSERT INTO BoleiaFrequente VALUES ('alex_','2012-05-13 08:15:31'::timestamp , TO_DATE( '2-DEC-2012', 'DD-MON-YYYY' ), 'Semanal');

INSERT INTO BoleiaUnica VALUES ('luis_','2010-04-07 12:30:15'::timestamp);
INSERT INTO BoleiaUnica VALUES ('luis_','2010-08-29 10:00:00'::timestamp);
INSERT INTO BoleiaUnica VALUES ('sofia_','2011-02-10 11:05:20'::timestamp);
INSERT INTO BoleiaUnica VALUES ('alex_','2012-06-03 07:00:50'::timestamp);
INSERT INTO BoleiaUnica VALUES ('luis_','2013-10-18 17:25:50'::timestamp);
INSERT INTO BoleiaUnica VALUES ('andreia_','2011-03-21 06:45:00'::timestamp);
INSERT INTO BoleiaUnica VALUES ('andreia_','2012-05-21 20:15:00'::timestamp);
INSERT INTO BoleiaUnica VALUES ('andreia_','2013-01-10 10:15:00'::timestamp);

--condutor:_sofia, ist-tagus - lisboa , frequente
INSERT INTO Inscricaop VALUES ('alex_', 'alex_' ,'2012-05-13 08:15:31'::timestamp); 
INSERT INTO Inscricaop VALUES ('rui_', 'alex_' ,'2012-05-13 08:15:31'::timestamp);
INSERT INTO Inscricaop VALUES ('joao_', 'alex_' ,'2012-05-13 08:15:31'::timestamp);
INSERT INTO Inscricaop VALUES ('andreia_', 'alex_' ,'2012-05-13 08:15:31'::timestamp);
INSERT INTO Inscricaop VALUES ('bernardo_', 'alex_' ,'2012-05-13 08:15:31'::timestamp);
INSERT INTO Inscricaop VALUES ('christine_', 'alex_' ,'2012-05-13 08:15:31'::timestamp);
--condutor:_sofia, lisboa - alameda, unica
INSERT INTO Inscricaop VALUES ('luis_', 'luis_','2010-04-07 12:30:15'::timestamp);
INSERT INTO Inscricaop VALUES ('sofia_', 'luis_','2010-04-07 12:30:15'::timestamp);
INSERT INTO Inscricaop VALUES ('antonio_', 'luis_','2010-04-07 12:30:15'::timestamp);
--condutor:null, lisboa - alameda, unica
--condutor:_sofia, ist-tagus - oeiras, unica
INSERT INTO Inscricaop VALUES ('joao_', 'sofia_' ,'2011-02-10 11:05:20'::timestamp);
INSERT INTO Inscricaop VALUES ('antonio_', 'sofia_','2011-02-10 11:05:20'::timestamp);
INSERT INTO Inscricaop VALUES ('sofia_', 'sofia_','2011-02-10 11:05:20'::timestamp);
--condutor:_rui, ist-tagus - oeiras, unica
INSERT INTO Inscricaop VALUES ('sofia_', 'andreia_','2011-03-21 06:45:00'::timestamp);
--condutor:_sofia, ist-tagus - oeiras, unica
--condutor:_sofia, ist-tagus - oeiras, unica
INSERT INTO Inscricaop VALUES ('rui_', 'alex_' ,'2012-06-03 07:00:50'::timestamp);
INSERT INTO Inscricaop VALUES ('andreia_', 'alex_' ,'2012-06-03 07:00:50'::timestamp);
--condutor:_sofia, ist-tagus - oeiras, unica
INSERT INTO Inscricaop VALUES ('antonio_', 'andreia_','2013-01-10 10:15:00'::timestamp);
INSERT INTO Inscricaop VALUES ('rui_', 'andreia_','2013-01-10 10:15:00'::timestamp);
---condutor:NULL, lisboa - alameda, unica
INSERT INTO Inscricaop VALUES ('rui_', 'luis_','2013-10-18 17:25:50'::timestamp);
INSERT INTO Inscricaop VALUES ('andreia_', 'luis_','2013-10-18 17:25:50'::timestamp);
INSERT INTO Inscricaop VALUES ('antonio_', 'luis_','2013-10-18 17:25:50'::timestamp);
INSERT INTO Inscricaop VALUES ('alex_', 'luis_','2013-10-18 17:25:50'::timestamp);


