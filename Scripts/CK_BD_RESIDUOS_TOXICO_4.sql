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
    datos_traslado tbl_datos_tr;
    
    cursor cr_traslado 
    is select   a.COD_DESTINO, 
                a.cod_residuo,
                a.fecha_envio, 
                a.NIF_EMPRESA, 
                a.envase,
                a.fecha_llegada,
                a.tratamiento,
                cantidad_traslado,
                desc_traslado,
                desc_residuo,
                toxicidad
    from    traslado a,
            residuo b
    where a.nif_empresa = b.nif_empresa;
                

begin
    open cr_traslado;
    
    fetch cr_traslado into datos_traslado;
    while cr_traslado%Found loop
        
        dbms_output.put_line('Destino: ' || datos_traslado.destino);
        dbms_output.put_line('Codigo Residuo: ' ||datos_traslado.residuo_cod);
        dbms_output.put_line('Fecha Ennvio: '||datos_traslado.fecha_envio);
        dbms_output.put_line('Empresa Codigo: '||datos_traslado.empresa);
        dbms_output.put_line('Envase: ' ||datos_traslado.envase );
        dbms_output.put_line('Fecha llegada: '||datos_traslado.fecha_llegada );
        dbms_output.put_line('Tratamiento: '||datos_traslado.tratamiento );
        dbms_output.put_line('Traslados: ' ||datos_traslado.traslados );
        dbms_output.put_line('Descripcion de traslado: '||datos_traslado.descripcion_tras );
        dbms_output.put_line('Descripcion de residuo: '||datos_traslado.descripcion_res );
        dbms_output.put_line('Toxicidad: '||datos_traslado.toxicidad );
        dbms_output.put_line(chr(13));
        fetch cr_traslado into datos_traslado;
        
    end loop;

    close cr_traslado;
end;

/*
La diferencia entre trabajar con un bulk collect y un cursor es que cuando
se usa el bulk collect este trae todos los registros en una sola peticion, 
mientras que el cursor lo que hace es que cada vez que se realiza un fetch 
accede a la base de datos, mientras que la diferencia a trabjar en el codigo
es igua, lo unico que afecta es la cantidad de peticiones en la base de datos
lo que puede saturarla.
*/