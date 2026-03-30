with t as (
  select 1 x from dual union all
  select level-1
    from dual
 connect by level <= 15000)
  select listagg(x, ',') within group (order by x) fib
  from
      (
       select x
         from t
         match_recognize
        ( order by x
          all rows per match
          pattern ((fib|{-dummy-})+)
          define fib as (x<=2 or x=last(fib.x, 1) + last(fib.x, 2))
      )
)
;