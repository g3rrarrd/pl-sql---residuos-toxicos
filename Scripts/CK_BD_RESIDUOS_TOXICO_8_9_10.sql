create table COCHES  (
    MAT varchar2(8) primary key,
    MARCA varchar2(15),
    MODELO varchar2(15),
    AN_FAB number(4)
);


insert into coches values ('M3020KY', 'TOYOTA', 'CARINA', 1996);
insert into coches values ('J1234Z', 'RENAULT', 'MEGANE', 1997);
insert into coches values ('GR4321A', 'RENAULT', '5', 1978);
insert into coches values ('B4444AC', 'PEUGEOT', '504', 1978);
insert into coches values ('CA0000AD', 'PEUGEOT', '205', 1996);
insert into coches values ('GR1111AK', 'PEUGEOT', '207', 1998);
insert into coches values ('J9999AB', 'VW', 'BEATTLE', 1998);

create table MECANICOS (
    DNI varchar2(9) primary key,
    NOMBRE varchar(15),
    PUESTO varchar2(15)
);

insert into mecanicos values('1111', 'ANTONIO', 'MOTOR');
insert into mecanicos values('2222', 'LUIS', 'MOTOR');
insert into mecanicos values('3333', 'PEPE', 'AMORTIGUADOR');
insert into mecanicos values('4444', 'LOLA', 'CHAPA');
insert into mecanicos values('5555', 'LUISA', 'AMORTIGUADOR');
insert into mecanicos values('6666', 'EMILIO', 'CHAPA');
insert into mecanicos values('7777', 'ANGEL', 'CHAPA');

create table trabajos (
    MAT varchar(8),
    DNI varchar(9),
    HORAS number(3,1) constraint ck_trabajo check(horas>=0.5),
    fecha_rep date,
    constraint fk1_trabajos FOREIGN key (MAT) references coches (MAT),
    constraint fk2_trabajos foreign key (DNI) references mecanicos (DNI)
);

insert into trabajos values ('M3020KY', '2222', 2.5, TO_DATE('23-FEB-96', 'DD/MM/YY'));
insert into trabajos values ('J134Z', '4444', 7, TO_DATE('19-MAR-97', 'DD/MM/YY'));
insert into trabajos values ('J134Z', '2222', 3, TO_DATE('19-MAR-97', 'DD/MM/YY'));
insert into trabajos values ('GR4321A', '3333', 2.1, TO_DATE('01-JAN-98', 'DD/MM/YY'));
insert into trabajos values ('B4444AC', '3333', 3.2, TO_DATE('23-APR-96', 'DD/MM/YY'));
insert into trabajos values ('CA0000AD', '3333', 8, TO_DATE('23-FEB-96', 'DD/MM/YY'));
insert into trabajos values ('M3020KY', '5555', 2, TO_DATE('23-FEB-96', 'DD/MM/YY'));
insert into trabajos values ('J9999AB', '6666', 1, TO_DATE('05-MAR-96', 'DD/MM/YY'));
insert into trabajos values ('J9999AB', '5555', 0.6, TO_DATE('05-MAR-96', 'DD/MM/YY'));
insert into trabajos values ('J9999AB', '2222', 0.9, TO_DATE('05-MAR-96', 'DD/MM/YY'));

CREATE TABLE LOGS (
    ID NUMBER(10),
    NOMBRE_USUARIO VARCHAR2(50),
    FECHA_MOD DATE,
    DESCRIPCION_TIPO VARCHAR2(100)
);

select table_name from user_tables;

/*
Se ocuparia la ayuda de una linea llamada execure inmediate 
mas la sentencia a hacer en estos casos crear o alterar la tabla
*/

