-- TRANSACCIONES----------------------------------------------------------

BEGIN;
	SELECT * FROM customers;
	insert into customers values(5,'Rolex Creek','roll@correo.cl');
	SELECT * FROM customers;
COMMIT; --O ROLLBACK

BEGIN;
	delete from customers;
	select * from customers;
	insert into customers ('hola'); --HARA ROLLBACK POR QUE UNO FALLO
COMMIT;

-- SAVE POINT

-- caso 1, nuestro script debe agregar dos filas, ya confirmadas
-- luego intentar un 3 insert (malo a proposito)
select * from customers;
	BEGIN;
	insert into customers values(5,'sara','correo1');
	insert into customers values(6,'jhon','correo2');
	insert into customers values('ddf');
	COMMIT;


-- caso 2 las mismas 2 filas

select * from customers;
BEGIN;
	insert into customers values(5,'sara','correo1');
	insert into customers values(6,'jhon','correo2');
	SAVEPOINT SARA_POINT;
	insert into customers values('ddf');
ROLLBACK TO SARA_POINT;
COMMIT;









