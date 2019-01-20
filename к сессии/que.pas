type link=^elem;
elem = record
prev:link;
data:integer;
end;
procedure print(work:link);
begin
  if work^.prev <> nil then print(work^.prev);
  write(work^.data);
end;
var work,head,last:link;
i:integer;
c:integer;
beg:link;
begin
new(head);
readln(c);
head^.data:=c;
head^.prev:=nil;
last:=head;
for i:=1 to 9 do begin
  new(work);
  readln(c);
  work^.data:=c;
  last^.prev:=work;
  work^.prev:=nil;
  last:=last^.prev;
end;
beg := head;
while head<>nil do begin 
  write(head^.data);
  head:=head^.prev;
end;
writeln();
print(beg);
end.