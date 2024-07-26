CREATE OR REPLACE TRIGGER 
BEFORE INSERT	
ON PESSOA REFERENCES NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE 
	inId number (9);
BEGIN
	
	SELECT PESSOA_SEQ.NEXTVAL
	INTO inId
	FROM DUAL;
	
	:NEW.IDPESSOA := inId;
END;