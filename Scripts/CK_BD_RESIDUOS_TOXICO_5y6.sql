create user C##_ANALISTA identified by analista
default tablespace "USERS"
TEMPORARY TABLESPACE "TEMP"
Account unlock;

alter user C##_ANALISTA quota unlimited on "SYSTEM";
alter user c##_analista quota unlimited on "SYSAUX";
alter user C##_Analista quota unlimited on "USERS";

grant   create session, 
        create any table,  
        alter any table, 
        drop any table,
        create any trigger, 
        alter any trigger, 
        drop any trigger,
        create any sequence, 
        alter any sequence, 
        drop any sequence
to C##_analista;