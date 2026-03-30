with function fib (x in int)
  return int
  as
  begin
    if x <= 1 then
       return x;
    end if;  
    return fib(x-1)+fib(x-2);
  end;
rws as (
  select level-1 lvl from dual
 connect by level <= 22)
select listagg(fib, ',') within group (order by fib) fib
from (select fib(lvl) fib from rws)
;
