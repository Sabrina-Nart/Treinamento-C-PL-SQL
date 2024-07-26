CREATE OR REPLACE PACKAGE PKG_PESSOA AS
	FUNCTION F_SALARIO_ANUAL_T(inCodFunc IN NUMBER) RETURN NUMBER;
END;

/

CREATE OR REPLACE FUNCTION F_SALARIO_ANUAL_T(inCodFunc IN NUMBER) RETURN NUMBER
AS 
BEGIN
	FUNCTION F_SALARIO_ANUAL_T(inCodFunc IN NUMBER) RETURN NUMBER; --RETORNO
	PROCEDURE P_ATUALIZA_SALARIO(inCodFunc IN NUMBER, inPerc IN NUMBER); --SEM RETORNO
END;

/

CREATE OR REPLACE PACKAGE PKG_PESSO AS
	FUNCTION F_SALARIO_ANUAL_T(inCodFunc IN NUMBER) RETURN NUMBER;
	AS 
		varSalario number(15,2);
	BEGIN
	
		select salario * 12
		into varSalario
		from pessoa
		where idpessoa = inCodFunc;
		
		RETURN varSalario;
	END;
	
	PROCEDURE P_ATUALIZA_SALARIO(inCodFunc IN NUMBER, inPerc IN NUMBER)
	AS
		novoPerc number(15,2);
	BEGIN
	
		IF inCodFunc IS NOT NULL AND inCodFunc > 0 THEN 
		
			UPDATE pessoa
			SET salario = salario + (salario * inPerc);
			WHERE idpessoa = inCodFunc;
			
		ELSE 
			FOR item IN (SELECT IDPESSOA, CARGO FROM PESSOA) --O item armazena a busca de dados
			LOOP 
				
				CASE WHEN ITEM.IDCARGO = 2 THEN
						novoPerc := inPerc + 0.1;
					 WHEN ITEM.IDCARGO = 1 THEN 
						novoPerc := inPerc + 0.5;
				END CASE;
				
				UPDATE PESSOA  
				SET SALARIO = SALARIO + (SALARIO * novoPerc)
				WHERE idpessoa = item.IDPESSOA;
				
			END LOOP;
			
		END IF;
	

	END;
END;

///

SELECT PKG_PESSOA.F_SALARIO_ANUAL_T(9) AS SALARIO_ANUAL FROM DUAL

/

CALL PKG_PESSOA.P_ATUALIZA_SALARIO(9, 0.1)

/