CREATE TABLE rol(
    id int4 NOT NULL,
    PRIMARY KEY (id)
);
 insert into rol values (1);
 insert into rol values (2);
 insert into rol values (3);

 select * from rol;

CREATE TABLE "user"(
    id int4 NOT NULL,
    PRIMARY KEY (id)
);
 insert into "user" values (1);
 insert into "user" values (2);
 insert into "user" values (3);

 select * from "user";

CREATE TABLE rol_user(
    id int4 NOT NULL,
    id_rol int4 NOT NULL,
    id_user int4 NOT NULL,
PRIMARY KEY (id),
constraint fk_rol foreign key (id_rol) references rol (id),
constraint fk_user3 foreign key (id_user) references "user"(id)


);
 insert into rol_user values (1,1,1);

 select * from rol_user;


CREATE TABLE vendedor (
    id int4 NOT NULL,
    id_user int4 NOT NULL,
    PRIMARY KEY (id),
    constraint fk_user2 foreign key (id_user) references "user"(id)
);
 insert into vendedor values (1,2);
 insert into vendedor values (2,3);
 insert into vendedor values (3,1);


 select * from vendedor;


CREATE TABLE tipo_pago (
    id int4 NOT NULL,
    PRIMARY KEY (id)
);
insert into tipo_pago values (1);
insert into tipo_pago values (2);
insert into tipo_pago values (3);

select * from tipo_pago;

CREATE TABLE pedido (
    id int4 NOT NULL,
    fecha date NOT NULL,
    PRIMARY KEY (id)
);

insert into pedido values (1, '05/05/2020');
insert into pedido values (2, '12/06/2020');

select * from pedido;

CREATE TABLE tipo_documento (
    id int4 NOT NULL,
    sigla varchar(100) NOT NULL UNIQUE,
    nombre_documento varchar(500) NOT NULL,
    Estado varchar(50) NOT NULL,
    PRIMARY KEY (id)

);
alter table tipo_documento add numero_documento varchar(500);
insert into tipo_documento values (1,'C.C', 'Cedula de ciudadania', 'vigente', '1000.131.444');


select * from tipo_documento;


CREATE TABLE cliente (
    id int4 NOT NULL,
    id_tipo_documento int4 NOT NULL,
    id_user int4 NOT NULL,
    PRIMARY KEY (id),
    constraint fk_tipo_documento2 foreign key (id_tipo_documento) references tipo_documento(id),
    constraint fk_user foreign key (id_user) references "user"(id)
);
insert into cliente values (1,1,2);

select * from cliente;


CREATE TABLE factura (
    id int4 NOT NULL,
    numero_factura varchar(500) NOT NULL UNIQUE,
    fecha date NOT NULL,
    total varchar(500),
    id_vendedor int4 NOT NULL,
    id_tipo_pago int4 NOT NULL,
    id_pedido int4 NOT NULL,
    id_cliente int4,
    PRIMARY KEY (id),
    constraint fk_vendedor foreign key (id_vendedor) references vendedor (id),
    constraint fk_tipo_pago foreign key (id_tipo_pago) references tipo_pago (id),
    constraint fk_pedido foreign key (id_pedido) references pedido (id),
    constraint fk_cliente foreign key (id_cliente) references cliente (id)
);
insert into factura values (1,'1586', '24/07/2020', '500.000', 1, 2, 2, 1 );
select * from factura;


CREATE TABLE almacen (
    id int4 NOT NULL,
    id_tipo_documento int4 NOT NULL UNIQUE,
    numero_documento varchar(500) NOT NULL UNIQUE,
    nombre varchar(1000) NOT NULL,
    direccion varchar(1000) NOT NULL,
    telefono varchar(1000) NOT NULL,
    PRIMARY KEY (id),
    constraint fk_tipo_documento foreign key (id_tipo_documento) references tipo_documento (id)
);
alter table almacen drop column numero_documento;
insert into almacen values (1,1, 'Intershop', 'Carrera#30-Bosa', '778859');


select * from almacen;


CREATE TABLE categoria (
    id int4 NOT NULL,
    nombre varchar(500) NOT NULL,
    estado varchar(80) NOT NULL,
    PRIMARY KEY (id)
);

insert into categoria values (1, 'jeans' , 'En stock');
insert into categoria values (2, 'Sudaderas' , 'En stock');

select * from categoria;


CREATE TABLE referencia (
    id int4 NOT NULL,
    nombre varchar(500) NOT NULL,
    estado varchar(80) NOT NULL,
    PRIMARY KEY (id)
);
insert into referencia values (1,'Tiro alto', 'En stock');
insert into referencia values (2,'Algodon', 'En stock');

select * from referencia;


CREATE TABLE producto (
    id int4 NOT NULL,
    serial varchar(500) NOT NULL UNIQUE,
    nombre varchar(500) NOT NULL,
    stock varchar(100) NOT NULL,
    imagen varchar(100) NOT NULL,
    precio varchar(500) NOT NULL,
    id_categoria int4,
    id_referencia int4,
    PRIMARY KEY (id),
    constraint fk_categoria foreign key (id_categoria) references categoria (id),
    constraint fk_referencia foreign key (id_referencia) references referencia (id)
);

insert into producto values (1,'555-554', 'Straigth', '15', 'imagen', '$35.000', 1,1);
insert into producto values (2,'778-556', 'Nike', '15', 'imagen', '$55.000', 2,2);

select * from producto;


CREATE TABLE almacen_producto (
    id_almacen int4 NOT NULL,
    id_producto int4 NOT NULL,
    stock varchar(500),
    PRIMARY KEY (id_almacen, id_producto),
    constraint fk_almacen foreign key (id_almacen) references almacen(id),
    constraint fk_producto foreign key (id_producto) references producto (id)
);

insert into almacen_producto values (1,1,'En venta');
insert into almacen_producto values (1,2,'En venta');

select * from almacen_producto;


CREATE TABLE pedido_producto (
    id int4 NOT NULL,
    Cantidad varchar(500) NOT NULL,
    precio_venta varchar(500) NOT NULL,
    id_pedido int4 NOT NULL UNIQUE,
    id_producto int4 NOT NULL UNIQUE,
    PRIMARY KEY (id),
    constraint fk_pedido2 foreign key (id_pedido) references pedido (id),
    constraint fk_producto2 foreign key (id_producto) references producto (id)
);

insert into pedido_producto values (1,'2', '$110.000', 2, 2);
select * from pedido_producto;
