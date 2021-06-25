Create table cliente(
 id_cliente int4 not null,
 nombre varchar(45) not null,
 apellido varchar(45) not null,
 contrasena varchar(50) not null,
 direccion Varchar(50) not null,
 telefono int4 not null,
 primary key (id_cliente),
 constraint uk_cli UNIQUE (contrasena)
);

Create table almacen
(
    id_almacen  int4 not null,
    id_producto int4 not null,
    id_provedor int4 not null,
    nombre varchar(45) not null,
    cantidad int4 not null,
    primary key (id_almacen),
    constraint uk_alma UNIQUE (cantidad)
);

create table categorias (
  id_categorias int4 not null,
  camisetas varchar (20)not null,
  pantalones varchar (20) not null,
  ropa_deportiva varchar (20) not null,
  vestidos varchar (20) not null,
  primary key (id_categorias)
);

create table venta(
  id_venta int not null ,
  id_cliente int not null  ,
  id_vendedor int not null ,
  fecha date not null,
  total int4 not null,
  vendedor_id_vendedor int not null ,

  primary key (id_venta),
  constraint uk_venta UNIQUE (id_cliente,id_vendedor,vendedor_id_vendedor),
  constraint fk_cli_ven foreign key (id_venta) references cliente (id_cliente)
);

Create table producto (

    id_producto int4 not null ,
    nombre varchar(45) not null,
    categoria varchar(45) not null,
    precio int8 not null,
    descripcion varchar(70) not null,
    almacen_id_almacen int not null,

 primary key (id_producto),
 constraint uk_produc UNIQUE (categoria,precio),
 constraint fk_producto_almacen1 foreign key (almacen_id_almacen) references almacen(id_almacen),
 constraint fk_pro_cat foreign key (id_producto) references categorias(id_categorias),
 constraint fk_pro_ven foreign key (id_producto) references venta (id_venta)
);





create table detalle_venta(
    id_detalle_venta int not null,
    id_producto varchar(45) not null ,
    cantidad int4 not null ,
    producto_id_producto int not null ,
    venta_id_venta int not null ,
    primary key (id_detalle_venta,producto_id_producto,venta_id_venta),
    constraint uk_detalle_ve UNIQUE (id_producto,cantidad,venta_id_venta),
    constraint fk_venta_producto1 foreign key (producto_id_producto) references producto(id_producto),
    constraint fk_detalle_venta_venta1 foreign key (venta_id_venta) references venta(id_venta)
);

create table proveedor (
  id_proveedor int not null ,
  nombre varchar(45) not null ,
  primary key (id_proveedor),
  constraint uk_pro UNIQUE (nombre)
);

create table factura(
   id_factura int not null ,
   pago int4 not null ,
   fecha date not null ,
   importe decimal(6,5) not null ,
  constraint pk_factura primary key (id_factura),
  constraint uk_fact UNIQUE (fecha,importe,pago)
);

create table solicitud(
  id_solicitud int4 not null ,
  id_factura int4 not null ,
  id_producto VARCHAR(45) not null,
  NIT VARCHAR(10) not null ,
  cliente_id_cliente int4 not null ,
  producto_id_producto int4 not null,
  factura_id_factura int4 not null,

  primary key (id_solicitud,cliente_id_cliente,producto_id_producto,factura_id_factura),
  constraint uk_soli UNIQUE (id_factura,NIT,cliente_id_cliente),
  constraint fk_solicitud_cliente foreign key (cliente_id_cliente) references cliente(id_cliente),
  constraint fk_solicitud_factura1 foreign key (factura_id_factura) references factura(id_factura),
  constraint fk_solicitud_producto1 foreign key (producto_id_producto) references producto(id_producto)


);

create table proveedor_has_almacen (
    provedor_id_provedor int not null,
    almacen_id_almacen int not null,

   primary key (provedor_id_provedor,almacen_id_almacen),
   constraint uk_pro_has_al UNIQUE (almacen_id_almacen,provedor_id_provedor),
    constraint fk_provedor_has_almacen_provedor1 foreign key (provedor_id_provedor) references proveedor (id_proveedor),
    constraint fk_provedor_has_almacen_almacen1 foreign key (almacen_id_almacen) references almacen (id_almacen)
);

/*Dml*/

insert into cliente
values ('01','Francisco','Lopez','pbf123','cr 21 i 11 sur','315871971');
insert into cliente
values ('02','Camilo','Gomez','ca5','cll75isur·78 d 28','31278595');
insert into cliente
values ('03','Edwin','Suarez','sus','cll21a78d7','31179375');
insert into cliente
values ('04','Camila','Roman','cam','cr 54 d 61 h ','32083627');
insert into cliente
values ('05','Marlon','Villamil','zam','cll 11 sur 78 f 3','32476575');
select * from cliente;

insert into almacen
values ('01','01','01','selemtwo','43');
insert into almacen
values ('02','02','02','selemtwo','20');
insert into almacen
values ('03','03','03','hato','84');
insert into almacen
values ('04','04','04','stylehp','59');
insert into almacen
values ('05','05','05','jhfashion','50');
select * from almacen;


insert into producto
values ('01','bluejean','pantalon','78000','azul,jean','01');
insert into producto
values ('02','blusa con escote en v','camisas','19000','rosada,ceda','02');
insert into producto
values ('03','abrigo','sacos','58000','azul,algodon perchado','03');
insert into producto
values ('04','medias tobilleras','medias','11000','blancas,lana','04');
insert into producto
values ('05','esqueleto mariposa','camisas','15000','magenta,ceda','05');
select * from producto;

insert into venta
values ('01','01','01','07/06/2021','84000','01');
insert into venta
values ('02','02','02','07/06/2021','94000','02');
insert into venta
values ('03','03','03','07/06/2021','83000','03');
insert into venta
values ('04','04','04','07/06/2021','28000','04');
insert into venta
values ('05','05','05','07/06/2021','93000','05');
select * from venta;

insert into detalle_venta
values ('01','01','37','01','01');
insert into detalle_venta
values ('02','02','83','02','02');
insert into detalle_venta
values ('03','03','84','03','03');
insert into detalle_venta
values ('04','04','90','04','04');
insert into detalle_venta
values ('05','05','50','05','05');
Select * from detalle_venta;


insert into proveedor
values ('01','Alex');
insert into proveedor
values ('02','Lion');
insert into proveedor
values ('03','Maik');
insert into proveedor
values ('04','Jhons');
insert into proveedor
values ('05','Mars');
select * from proveedor;

insert into factura
values ('01','84000','07/06/2021','0');
insert into factura
values ('02','97000','07/06/2021','1');
insert into factura
values ('03','100000','07/06/2021','3');
insert into factura
values ('04','89000','07/06/2021','7');
insert into factura
values ('05','98000','07/06/2021','8');
Select * from factura;


insert into proveedor_has_almacen
values ('01','01');
insert into proveedor_has_almacen
values ('02','02');
insert into proveedor_has_almacen
values ('03','03');
insert into proveedor_has_almacen
values ('04','04');
insert into proveedor_has_almacen
values ('05','05');
select * from proveedor_has_almacen;

insert into solicitud
values ('1','01','01','456123','01','01','01');
insert into solicitud
values ('2','02','02','123456','02','02','02');
insert into solicitud
values ('3','03','03','987456','03','03','03');
insert into solicitud
values ('4','04','04','321987','04','04','04');
Select * from solicitud;


/*DDL*/

select * from solicitud
join factura
on solicitud.id_factura = factura.id_factura;

Select * from solicitud
join producto
on solicitud.producto_id_producto = producto.id_producto;

Select * from detalle_venta
join producto
on detalle_venta.producto_id_producto = producto.id_producto;

Select * from almacen
join proveedor
on almacen.id_provedor = proveedor.id_proveedor;

Select * from venta
join cliente
on venta.id_cliente = cliente.id_cliente;

select * from solicitud
join factura
on solicitud.id_factura = factura.id_factura
where solicitud.id_factura = '3' and pago = '100000';

Select * from venta
join cliente
on venta.id_cliente = cliente.id_cliente
where venta.id_cliente = '1' and fecha = '2021-06-07';

Select * from detalle_venta
join producto
on detalle_venta.producto_id_producto = producto.id_producto
where detalle_venta.producto_id_producto = '5' and cantidad = '50';

Select * from solicitud
join producto
on solicitud.producto_id_producto = producto.id_producto
where solicitud.producto_id_producto = '3' and NIT = '987456';

Select * from almacen
join proveedor
on almacen.id_provedor = proveedor.id_proveedor
where proveedor.id_proveedor = '4' and proveedor.nombre = 'Jhons';
