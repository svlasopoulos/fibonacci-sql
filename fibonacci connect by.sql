with t as (
  select rownum id 
    from dual
 connect by rownum <= power(2, 19) / 19)
,pairs as (
  select t1.id id1, t2.id id2
    from t t1, t t2
   where t2.id between (1 / 2) * t1.id
                   and (2 / 3) * t1.id
   union all
  select 1, 0 from dual
   union all
  select 1, 1 from dual)  
select listagg(fib, ',') within group (order by fib) fib
from (
      select rownum lvl, id2 fib
        from pairs
       start with (id1, id2) in ((1, 0))
     connect by prior id1 = id2
         and prior (id1 + id2) = id1
         and level <= 25
)
;