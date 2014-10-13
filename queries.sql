--QUERIES
-- RESPOSTA A)

SELECT boleias_em_curso.nick, 
	   boleias_em_curso.data_hora, 
	   boleias_em_curso.custo_passageiro, 
	   boleias_em_curso.nome_origem, 
	   boleias_em_curso.nome_destino, 
	   boleias_em_curso.nick_condutor, 
	   boleias_em_curso.matricula, 
	   boleias_em_curso.marca, 
	   boleias_em_curso.modelo, 
	   boleias_em_curso.maxocupantes, 
	   inscricaop.nick_passageiro
	   
 FROM (SELECT boleia.nick, 
			  boleia.data_hora, 
			  boleia.custo_passageiro, 
			  boleia.nome_origem, 
			  boleia.nome_destino, 
			  boleia.nick_condutor, 
			  viatura.matricula, 
			  viatura.marca, 
			  viatura.modelo, 
			  viatura.maxocupantes 
		FROM boleia LEFT OUTER JOIN viatura 
			ON (boleia.matricula=viatura.matricula)) boleias_em_curso LEFT OUTER JOIN inscricaop 
																ON (boleias_em_curso.nick=inscricaop.nick_organizador 
																		AND boleias_em_curso.data_hora=inscricaop.data_hora);
	
-- RESPOSTA B)

SELECT DISTINCT nick_condutor
FROM (
	--tab_media_lucro
	SELECT nick_condutor, nick, data_hora, custo_passageiro*COUNT(*) AS lucro
	FROM boleiaunica NATURAL JOIN boleia 
					NATURAL JOIN trajeto 
					NATURAL JOIN inscricaop
	WHERE (trajeto.nome_origem='IST-Tagus' 
		OR trajeto.nome_destino='IST-Tagus')
	GROUP BY nick_condutor, nick, data_hora, custo_passageiro
	) tab_media_lucro
GROUP BY nick_condutor
HAVING AVG(lucro) >= all ( 
		SELECT AVG(lucro) AS media_lucro
		FROM ( 
			--tab_media_lucro
			SELECT nick_condutor, nick, data_hora, custo_passageiro*COUNT(*) AS lucro
			FROM boleiaunica NATURAL JOIN boleia 
							NATURAL JOIN trajeto 
							NATURAL JOIN inscricaop
			WHERE (trajeto.nome_origem='IST-Tagus' 
				OR trajeto.nome_destino='IST-Tagus')
			GROUP BY nick_condutor, nick, data_hora, custo_passageiro
			) tab_media_lucro
		GROUP BY nick_condutor );
								
-- RESPOSTA C)
 
SELECT DISTINCT u.nick
FROM utente u
WHERE NOT EXISTS ( 
      SELECT t.nome_origem, t.nome_destino
      FROM trajeto t
      WHERE t.nome_origem='IST-Tagus'
		AND NOT EXISTS (  
           SELECT b.nome_origem, b.nome_destino
           FROM (boleia natural join inscricaop) b
           WHERE (u.nick=b.nick_condutor or u.nick =b.nick_passageiro)
            AND b.nome_origem = t.nome_origem
			AND b.nome_destino = t.nome_destino))
