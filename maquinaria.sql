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
