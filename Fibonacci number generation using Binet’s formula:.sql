with rws as (
  select level-1 lvl from dual
 connect by level <= 22)
select listagg(fib, ',') within group (order by fib) fib from (
select round((power((1+sqrt(5))/2,lvl)-power(1-(1+sqrt(5))/2,lvl))/sqrt(5)) fib from rws)
;

--The exact value of the golden ratio can be calculated as follows: f = (1+v5) / 2
