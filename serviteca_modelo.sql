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
