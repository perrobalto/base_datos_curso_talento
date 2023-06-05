CREATE TABLE arriendo (
    folio                      NUMERIC(12) NOT NULL,
    fecha                      DATE,
    dias                       NUMERIC(5) NOT NULL,
    valordia                   NUMERIC(12) NOT NULL,
    garantia                   VARCHAR(30) NOT NULL,
    herramienta_idherramienta  NUMERIC(12) NOT NULL,
    cliente_rut                VARCHAR(10) NOT NULL
);

ALTER TABLE arriendo ADD CONSTRAINT arriendo_pk PRIMARY KEY ( folio );

CREATE TABLE cliente (
    rut        VARCHAR(10) NOT NULL,
    nombre     VARCHAR(120) NOT NULL,
    correo     VARCHAR(80) NOT NULL,
    direccion  VARCHAR(120) NOT NULL,
    celular    VARCHAR(15) NOT NULL,
    alta       VARCHAR(10)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

CREATE TABLE empresa (
    rut        VARCHAR(10) NOT NULL,
    nombre     VARCHAR(120) NOT NULL,
    direccion  VARCHAR(120) NOT NULL,
    telefono   NUMERIC(15) NOT NULL,
    correo     VARCHAR(80) NOT NULL,
    web        VARCHAR(50) NOT NULL
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( rut );

CREATE TABLE herramienta (
    idherramienta  NUMERIC(12) NOT NULL,
    nombre         VARCHAR(120) NOT NULL,
    preciodia      NUMERIC(12) NOT NULL
);

ALTER TABLE herramienta ADD CONSTRAINT herramienta_pk PRIMARY KEY ( idherramienta );

ALTER TABLE arriendo
    ADD CONSTRAINT arriendo_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE arriendo
    ADD CONSTRAINT arriendo_herramienta_fk FOREIGN KEY ( herramienta_idherramienta )
        REFERENCES herramienta ( idherramienta );
    
-- insert 
       -- 1.	Inserte los datos de una empresa.
INSERT into empresa VALUES('11111111-1','Arrienda Herramientas','0123 Avenida Real',1234567890,'datosarriendo@herramientas.es','arrimientas.es');



-- 2.	Inserte 5 herramientas.
INSERT into herramienta VALUES(1,'Taladro Electrico',10000),
							  (2,'Cierra Electrica',20000),
							  (3,'Pistola de Clavos',30000),
							  (4,'Lijadora',40000),
							  (5,'Serrucho Electrico',50000);

-- 3.	Inserte 3 clientes.
INSERT into cliente VALUES('22222222-2','Juan Perez','j.perez@mail.com','1 Calle Uno',2222222222),
						  ('33333333-3','Juanita Sánches','j.sanches@mail.com','2 Calle Dos',3333333333),
						  ('44444444-4','Marcelo Ugarte','m.ugarte@mail.com','3 Calle Tres',4444444444);

-- 4.	Elimina el último cliente.
DELETE FROM cliente WHERE 'rut' = '44444444-4';

-- 5.	Elimina la primera herramienta.
DELETE FROM herramienta WHERE idherramienta = 1;

-- 6.	Inserte 2 arriendos para cada cliente. 
INSERT into arriendo VALUES(1,'12/11/22',5,20000,'Eficacia en 5 dias o menos',2,'22222222-2'),
						   (2,'12/11/22',2,30000,'Eficacia en 2 dias o menos',3,'22222222-2'),
						   (3,'12/11/22',1,40000,'Eficacia en 1 dia',4,'33333333-3'),
						   (4,'12/11/22',3,40000,'Eficacia en solo 3 dias',4,'33333333-3');
						   
-- 7.	Modifique el correo electrónico del primer cliente.
UPDATE cliente
SET correo = 'juan.p@mail.com'
WHERE rut = '22222222-2';

-- 8.	Liste todas las herramientas.
SELECT * FROM herramienta;

-- 9.	Liste los arriendos del segundo cliente.
SELECT * FROM arriendo WHERE cliente_rut = '33333333-3';

-- 10.	Liste los clientes cuyo nombre contenga una a.
SELECT * FROM cliente WHERE nombre LIKE '%a%';

-- 11.	Obtenga el nombre de la segunda herramienta insertada.
SELECT nombre FROM herramienta WHERE nombre LIKE '%a%';

-- 12.	Modifique los primeros 2 arriendos insertados con fecha 15/01/2020.
UPDATE arriendo
SET fecha = '01/15/2020'
WHERE folio = 1;

UPDATE arriendo
SET fecha = '01/15/2020'
WHERE folio = 2;

-- 13.	Liste Folio, Fecha y ValorDia de los arriendos de enero del 2020.
SELECT folio, fecha, valordia 
FROM arriendo
WHERE EXTRACT(MONTH FROM fecha) = 01 AND EXTRACT(YEAR FROM fecha)= 2020;

