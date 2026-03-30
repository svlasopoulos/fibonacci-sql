with fib(next_val, cur_val, position) as (
  select 1,0,1
    from dual
   union all
  select cur_val+next_val, next_val, position+1
    from fib
   where position < 22
)
select listagg(cur_val, ',') within group (order by cur_val) fib
  from (select cur_val from  fib)
;
