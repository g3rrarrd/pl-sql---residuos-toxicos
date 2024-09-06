declare
    type tbl_datos_tr is record (
        destino traslado.COD_DESTINO%type,
        residuo_cod traslado.COD_RESIDUO%type,
        fecha_envio traslado.FECHA_ENVIO%type,
        empresa traslado.NIF_EMPRESA%type,
        envase traslado.ENVASE%type,
        fecha_llegada traslado.FECHA_LLEGADA%type,
        tratamiento traslado.TRATAMIENTO%type,
        traslados traslado.CANTIDAD_TRASLADO%type,
        descripcion_tras traslado.DESC_TRASLADO%type,
        descripcion_res residuo.DESC_RESIDUO%type,
        toxicidad residuo.TOXICIDAD%type
    );
    type tbl_tralado is table of tbl_datos_tr;
    datos_traslado tbl_tralado;
begin 
    select  COD_DESTINO,
            a.COD_RESIDUO,
            FECHA_ENVIO,
            a.NIF_EMPRESA,
            ENVASE,
            FECHA_LLEGADA,
            TRATAMIENTO,
            CANTIDAD_TRASLADO,
            DESC_TRASLADO,
            DESC_RESIDUO,
            TOXICIDAD
    bulk collect into datos_traslado 
    from traslado a
    inner join residuo b
    on a.nif_empresa = b.nif_empresa;
    
    for iteracion in 1..SQL%rowcount loop
        if to_char(datos_traslado(iteracion).fecha_envio, 'mm') = '08' then
            if datos_traslado(iteracion).tratamiento = 'Incineración' or datos_traslado(iteracion).tratamiento = 'Almacenamiento' then
                dbms_output.put_line('Destino: ' || datos_traslado(iteracion).destino);
                dbms_output.put_line('Codigo Residuo: ' ||datos_traslado(iteracion).residuo_cod);
                dbms_output.put_line('Fecha Ennvio: '||datos_traslado(iteracion).fecha_envio);
                dbms_output.put_line('Empresa Codigo: '||datos_traslado(iteracion).empresa);
                dbms_output.put_line('Envase: ' ||datos_traslado(iteracion).envase );
                dbms_output.put_line('Fecha llegada: '||datos_traslado(iteracion).fecha_llegada );
                dbms_output.put_line('Tratamiento: '||datos_traslado(iteracion).tratamiento );
                dbms_output.put_line('Traslados: ' ||datos_traslado(iteracion).traslados );
                dbms_output.put_line('Descripcion de traslado: '||datos_traslado(iteracion).descripcion_tras );
                dbms_output.put_line('Descripcion de residuo: '||datos_traslado(iteracion).descripcion_res );
                dbms_output.put_line('Toxicidad: '||datos_traslado(iteracion).toxicidad );
                dbms_output.put_line(chr(13));
            end if;
        end if;
    end loop;
end;

