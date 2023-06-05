CREATE TABLE cliente (
    rut        VARCHAR(10) NOT NULL,
    nombre     VARCHAR(120) NOT NULL,
    correo     VARCHAR(80) NOT NULL,
    direccion  VARCHAR(120) NOT NULL,
    celular    VARCHAR(15) NOT NULL,
    alta       CHAR(1) NOT NULL
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

CREATE TABLE mantencion (
    idmantencion        NUMERIC(12) NOT NULL,
    fecha               DATE NOT NULL,
    trabajosrealizados  NUMERIC(1000) NOT NULL,
    venta_folio         NUMERIC(12) NOT NULL
);

ALTER TABLE mantencion ADD CONSTRAINT mantencion_pk PRIMARY KEY ( idmantencion );

CREATE TABLE marca (
    idmarca  NUMERIC(12) NOT NULL,
    nombre   VARCHAR(120) NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( idmarca );

CREATE TABLE tipovehiculo (
    idtipovehiculo  NUMERIC(12) NOT NULL,
    nombre          VARCHAR(120) NOT NULL
);

ALTER TABLE tipovehiculo ADD CONSTRAINT tipovehiculo_pk PRIMARY KEY ( idtipovehiculo );

CREATE TABLE vehiculo (
    idvehiculo                   NUMERIC(12) NOT NULL,
    patente                      VARCHAR(10) NOT NULL,
    marca                        VARCHAR(20) NOT NULL,
    modelo                       VARCHAR(20) NOT NULL,
    color                        VARCHAR(15) NOT NULL,
    precio                       NUMERIC(12) NOT NULL,
    frecuenciamantencion         NUMERIC(5) NOT NULL,
    marca_marca_id               NUMERIC(12) NOT NULL,
    tipovehiculo_idtipovehiculo  NUMERIC(12) NOT NULL,
    marca_idmarca                NUMERIC(12) NOT NULL
);



ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( idvehiculo );

CREATE TABLE venta (
    folio                 NUMERIC(12) NOT NULL,
    fecha                 DATE NOT NULL,
    monto                 NUMERIC(12) NOT NULL,
    vehiculo_vehiculo_id  NUMERIC(12) NOT NULL,
    cliente_rut           VARCHAR(10) NOT NULL,
    vehiculo_idvehiculo   NUMERIC(12) NOT NULL
);

CREATE UNIQUE INDEX venta__idx ON
    venta (
        vehiculo_vehiculo_id
    ASC );

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( folio );

ALTER TABLE mantencion
    ADD CONSTRAINT mantencion_venta_fk FOREIGN KEY ( venta_folio )
        REFERENCES venta ( folio );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_marca_fk FOREIGN KEY ( marca_idmarca )
        REFERENCES marca ( idmarca );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_tipovehiculo_fk FOREIGN KEY ( tipovehiculo_idtipovehiculo )
        REFERENCES tipovehiculo ( idtipovehiculo );

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE venta
    ADD CONSTRAINT venta_vehiculo_fk FOREIGN KEY ( vehiculo_idvehiculo )
        REFERENCES vehiculo ( idvehiculo );
       
              
-- INSERT PARA EJERCICIO --
-- •	Inserte los datos de una empresa.
INSERT INTO empresa VALUES('11111111-1','Arrienda Riendas','Avenida Real 2923',0987654321,'contacto@arriendariendas.cl','arriendariendas.cl');

-- •	Inserte 2 tipos de vehículo.
INSERT INTO tipovehiculo VALUES(1,'Transporte Pasajeros'),(2,'Carga Pesada');

-- •	Inserte 3 clientes.
INSERT INTO cliente VALUES('11111111-0','Marina Goyenechea','ma.go@mail.com','Calle Cordillera 0233',8092348762,'N'),
						  ('22222222-1','Juan Galvez','ju.ga@mail.com','Avenida Mar Azul 2',1233254365,'S'),
					      ('33333333-2','Pascal Rivera','pa.ri@mail.com','Pasaje Río Claro 98',9988776554,'N');

-- •	Inserte 2 marcas.
INSERT INTO marca VALUES(11,'Hyundai'),(22,'Audi');

-- •	Inserte 5 vehículos.
INSERT INTO vehiculo VALUES (1,'1D45THU8','Hyundia','Santa fe','Rojo',30000000,2,11,1,11),
							(2,'5T6HS8U9','Hyundia','Santa cruz','Azul',20000000,2,11,1,11),
							(3,'2V6J9L0G','Audi','R8','Amarillo',		120000000,5,22,1,22),
							(4,'223E6GHJ','Audi','A6','Naranjo',60000000,4,22,1,22),
							(5,'2EFKO99E','Hyundai','Ionic 5','Plomo',45000000,5,11,1,11);
							
-- •	Elimina el último cliente.
DELETE FROM cliente
WHERE rut = '33333333-2';

-- •	Inserte 1 venta para cada cliente. 
INSERT INTO venta VALUES(1,'11/13/2022',90000000,1,'11111111-0',1),
						(2,'11/13/2022',60000000,2,'22222222-1',2);
-- •	Modifique el nombre del segundo cliente.
UPDATE cliente
SET nombre = 'Jonatan Diaz'
WHERE rut = '22222222-1';

-- •	Liste todas las ventas.
SELECT * FROM venta;

-- •	Liste las ventas del primer cliente.
SELECT * FROM venta
WHERE cliente_rut = '11111111-0';

-- •	Obtenga la patente de todos los vehículos.
SELECT patente FROM vehiculo;


