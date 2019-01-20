type
link=^elem;
elem=record
data:integer;
next:link;
prev:link;
end;
var c:integer;
st,st1,work:link;
i:integer;
begin

//readln(c);
new(st);
st^.prev:=nil;
st^.data:=1;
st^.next:=nil;
for i:=2 to 10 do begin 
  //readln(c);
  new(work);
  work^.prev:=st;
  work^.data:=i;
  work^.next:=nil;
  st^.next:=work;
  st:=st^.next;
end;

st1:=st;
while st<>nil do begin write(st^.data);st:=st^.prev; end;

while st1^.prev<>nil do st1:=st1^.prev;
writeln();
st1 := st1^.next;
while st1^.next<>nil do begin write(st1^.data);st1:=st1^.next^.next; end;

end.