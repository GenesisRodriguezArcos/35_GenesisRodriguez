/*CREACION DE BASE DE DATOS*/
DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE database dbGamarraMarket DEFAULT CHARACTER SET utf8;
/*PONER EN USO LA BASE DE DATOS*/
use dbGamarraMarket;
/*ELIMINAR LA BASE DE DATOS*/
DROP database dbGamarraMarket;

/*CREACION DE TABLAS*/
/*CREACION DE LA TABLA CLIENTE*/
CREATE TABLE cliente(
id int, 
tipo_documento char(3),
numero_documento char(15),
nombres varchar(60),
apellidos varchar(90),
email varchar(80),
celular char(9),
fecha_nacimiento date,
activo bool,
CONSTRAINT cliente_pk PRIMARY KEY (id)
);
/*CREACION DE LA TABLA VENDEDOR*/
CREATE TABLE vendedor(
id int, 
tipo_documento char(3),
numero_documento char(15),
nombres varchar(60),
apellidos varchar(90),
salario decimal(8,2),
celular char(9),
email varchar(90),
activo bool,
CONSTRAINT vendedor_pk PRIMARY KEY (id)

);
/*CREACION DE LA TABLA PRENDA*/
CREATE TABLE prenda(
id int,
descripcion varchar(90),
marca varchar(60),
cantidad int,
talla varchar(10),
precio decimal(8,2),
activo bool,
CONSTRAINT prenda_pk PRIMARY KEY (id)
);
/*CREACION DE LA TABLA VENTA*/
CREATE TABLE venta(
id int,
fecha_hora timestamp DEFAULT current_timestamp,
activo bool,
CONSTRAINT venta_pk PRIMARY KEY (id)
);
/*CREACION DE LA TABLA VENTA_DETALLE*/
CREATE TABLE venta_detalle(
id int,
cantidad int,
CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);
/*VER ESTRUCTURA*/
SHOW COLUMNS IN cliente;
/*LISTAR TABLAS*/
SHOW TABLES;
/*AGREGAR COLUMNA*/
ALTER TABLE cliente ADD COLUMN estado_civil char(1);
/*ELIMINAR COLUMNA*/
ALTER TABLE cliente DROP COLUMN fecha_nacimiento;
/*ELIMINAR TABLA*/
DROP TABLE cliente;

/*CREACION DE RELACIONES*/
/*CREACION DE RELACION VENTA_CLIENTE*/
ALTER TABLE venta
ADD CONSTRAINT venta_cliente FOREIGN KEY (cliente_id)
REFERENCES cliente (id)
ON UPDATE CASCADE
ON DELETE CASCADE;
/*CREACION DE RELACION VENTA_VENDEDOR*/
ALTER TABLE venta
ADD CONSTRAINT venta_vendedor FOREIGN KEY (vendedor_id)
REFERENCES vendedor (id)
ON UPDATE CASCADE
ON DELETE CASCADE;
/*CREACION DE RELACION VENTA_DETALLE_PRENDA*/
ALTER TABLE venta_detalle
ADD CONSTRAINT venta_detalle_prenda FOREIGN KEY (prenda_id)
REFERENCES prenda (id)
ON UPDATE CASCADE
ON DELETE CASCADE;
/*CREACION DE RELACION VENTA_DETALLE_VENTA*/
ALTER TABLE venta_detalle
ADD CONSTRAINT venta_detalle_venta FOREIGN KEY (venta_id)
REFERENCES venta (id)
ON UPDATE CASCADE
ON DELETE CASCADE;
/*ELIMINAR RELACIONES*/
ALTER TABLE venta DROP CONSTRAINT VENTA_CLIENTE;


