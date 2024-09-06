declare
    
begin
    savepoint EstadoGuardado;
    insert into traslado_empresatransportista
    values ('C-34534527-M', 1.01, sysdate, 'DESTINO-N01','A-87684567-B', 'Carretera', 300, 10000);
    insert into traslado_empresatransportista 
    values ('C-34534526-M', 1.01, sysdate, 'DESTINO-N03','A-87684567-B', 'Carretera', 300, 10000);
    savepoint EstadoGuardado;
    insert into traslado_empresatransportista 
    values ('C-34534525-M', 1.01, sysdate, 'DESTINO-N03','A-87684567-B', 'Carretera', 300, 10000);
    insert into traslado_empresatransportista 
    values ('C-34534524-M', 1.01, sysdate, 'DESTINO-N03','A-87684567-B', 'Carretera', 300, 10000);
    savepoint EstadoGuardado;
    insert into traslado_empresatransportista 
    values ('C-34534521-M', 1.01, sysdate, 'DESTINO-N03','A-87684567-B', 'Carretera', 300, 10000);
    insert into traslado_empresatransportista 
    values ('C-34534523-M', 1.01, sysdate, 'DESTINO-N03','A-87684567-B', 'Carretera', 300, 10000);
    savepoint EstadoGuardado;
    
    EXCEPTION
        when DUP_VAL_ON_INDEX then
            dbms_output.put_line('Valor de llave primaria duplicado');
        when others then
            if (SQLCODE = -2291) then
                dbms_output.put_line('Valor incorrecto de llave foranea');
            end if;
            if (SQLCODE = -1438) then
                dbms_output.put_line('Valor excedido al indicado');
            end if;
            if (SQLCODE = -12899) then
                dbms_output.put_line('Valor maximo excedido');
            end if;
        dbms_output.put_line('Ha ocurrido un error: ' || SQLCODE);
        Rollback to savepoint EstadoGuardado;
            
end;



