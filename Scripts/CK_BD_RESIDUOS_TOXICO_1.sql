//1
create sequence sq_residuos_toxicos start with 17 increment by 1
minvalue 17
maxvalue 999;

create or replace trigger tg_residuos_toxicos before insert on destino
for each row
declare

begin
    :new.cod_destino := ('DESTINO-N'||sq_residuos_toxicos.nextval);
end;

insert into destino(nombre_destino, ciudad_destino) values ('PORSUR', 'Malaga')


