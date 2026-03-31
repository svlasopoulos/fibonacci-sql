-- this script is using [use Binet's algebraic formula](https://en.wikipedia.org/wiki/Fibonacci_sequence#Binet's_formula)

with rws as (
  select level-1 lvl from dual
 connect by level <= 22)
select listagg(fib, ',') within group (order by fib) fib from (
select round((power((1+sqrt(5))/2,lvl)-power(1-(1+sqrt(5))/2,lvl))/sqrt(5)) fib from rws)
;
