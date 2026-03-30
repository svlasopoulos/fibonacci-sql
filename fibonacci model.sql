select listagg(fib, ',') within group (order by fib) fib from
(
select fib
  from dual
    model
    dimension by (0 i)
    measures (0 fib)
    rules iterate(22) until (fib[iteration_number]>10000)
    (
      fib[iteration_number] = case iteration_number when 0 then 0 when 1 then 1 else fib[cv()-1]+fib[cv()-2] end)
 order by fib
)
;
