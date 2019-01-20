
type
link=^elem;
elem=record
data:integer;
prev:link;
end;
var //c:char;
st,work,tmp:link;
i,j,n,c:integer;

procedure print(work:link);
begin
  if work^.prev <> nil then if work^.prev^.prev <> nil then print(work^.prev^.prev);
  write(work^.data);
end;

procedure kill(var u:link);
  begin
  if u<>nil then
  begin
     kill(u^.prev);
     dispose(u);
  end;
end;

begin
readln(c);
new(st);
st^.prev:=nil;
st^.data:=c;

n:=1;
for i:=2 to 10 do begin 
  readln(c);
  new(work);
  work^.prev:=st;
  work^.data:=i;
  st:=work;
  inc(n);
end;

print(work^.prev);
writeln();
while st<>nil do begin 
  write(st^.data);
  st:=st^.prev; 
end;

kill(st);

end.