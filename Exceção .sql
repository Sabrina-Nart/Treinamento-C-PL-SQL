DECLARE 
	nValorContas number(15, 2)
BEGIN

	BEGIN
		nValorContas := 1 + 1;
	EXCEPTION WHEN OTHERS THEN
		nValorContas := 0;
	END;
	
EXCEPTION WHEN OTHERS THEN 
	nValorContas := 0;
	RAISE_APPLICATION_ERROR(-20000, 'Ocorreu um erro! ' || nValorContas || SQLERRM); --Mensagem original do banco e mostrar
END;