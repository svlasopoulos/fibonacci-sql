with function fib(n int)
  return int
  as
    prev2 int:=0;
    prev1 int:=1;
    cur_val int;
  begin
    for i in 0..n-1 loop
      cur_val := prev2 + prev1;
      prev2 := prev1;
      prev1 := cur_val;
    end loop;
    return prev2;
  end;
rws as (
  select level-1 lvl from dual
 connect by level <= 22)  
select listagg(fib, ',') within group (order by fib) fib from (
select fib(lvl) fib from rws)
;

