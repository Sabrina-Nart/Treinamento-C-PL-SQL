 DO $$
DECLARE

	l_codigo INTEGER := 0;
	l_codigo_ant INTEGER := 0;
	l_nome_prod VARCHAR(100) := '';
	l_valor NUMERIC(12,2) := 0;     
	l_media NUMERIC(12,2) := 0;
BEGIN

	SELECT AVG(valor) 
		INTO l_media
		FROM itens_vendas;
			
	WHILE l_codigo_ant = 0 OR l_codigo_ant <> l_codigo LOOP
	
	l_codigo_ant := l_codigo;
			
	SELECT produtos.i_produto, produtos.nome, AVG (itens_vendas.valor_venda)--Média aqui também
		INTO l_codigo, l_nome_prod, l_valor  --Agrupando por produto
		FROM itens_vendas INNER JOIN produtos
			ON (itens_vendas.i_produto = produtos.i_produto)
		WHERE produtos.i_produto = (SELECT MIN(p.i_produto)
										FROM produtos p
									   WHERE p.i_produto > l_codigo)
			GROUP BY produtos.i_produto;
			
		IF l_codigo ISNULL THEN	
			EXIT;
		END IF;
		
		RAISE NOTICE 'l_codigo_ant: % - l_codigo: % ', l_codigo_ant, l_codigo;	
		
		RAISE NOTICE 'PRODUTO: % - VALOR: % ', l_nome_prod, l_valor;
		
		IF l_valor > l_media THEN
			RAISE NOTICE 'O valor médio de compras de: % estão acima da média: % ', l_nome_prod, l_media;
		ELSIF l_valor < l_media THEN
			RAISE NOTICE 'O valor médio de compras de: % estão abaixo da média: % ', l_nome_prod, l_media;
		ELSE
			RAISE NOTICE 'As valor médio de compras de: % estão iguais a média de compras por produto: % ', l_nome_prod, l_media;
		END IF;
		
	END LOOP;
END $$;


DO $$
DECLARE
	l_nome_pes VARCHAR(100) := '';
	l_nome_cid VARCHAR(100) := '';
	l_valor NUMERIC(12,2) := 0;
BEGIN
	SELECT pessoas.nome, cidades.nome,
		   SUM (vendas.valor)
		INTO l_nome_pes, l_nome_cid, l_valor  
		FROM vendas INNER JOIN pessoas 
			ON (vendas.i_pessoa = pessoas.i_pessoa)
			INNER JOIN cidades
			ON(pessoas.i_cidade = cidades.i_cidade)
		WHERE pessoas.i_pessoa = 1
		GROUP BY 1, 2; --Primeira e segunda coluna
			
	RAISE NOTICE 'Pessoa: % - Cidade: % - Valor: %', l_nome_pes, l_nome_cid, l_valor;
END $$;