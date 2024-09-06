declare
    v_sql varchar(100);
begin 
    for name in (select table_name from user_tables) loop
        v_sql := 'update ' || name.table_name || ' set estado = 1';
        execute immediate v_sql;
    end loop;
end;
