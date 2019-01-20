program ses;
type
  link = ^el;
  el = record
    prev : link;
    data : string;
  end;
var
  last:link;
  f1,f2,f3 : text;
procedure p1(var f:text;var last : link);
var
  st:link;
  work:link;
begin
  new(st);
  st^.prev:=nil;
  //st^.data := '0';
  readln(f, st^.data);
  while not eof(f) do begin
    new(work);
    work^.prev:=st;
    st:=work;
    readln(f, work^.data);
  end;

  last := st;
end;
procedure p2(var f2 : text;last:link);
var
  st : link;
begin
  st := last;
  if st^.prev <> nil then p2(f2, st^.prev);
  writeln(f2, st^.data);
end;
procedure p3(var f:text;last : link);
var
  st : link;
  str : string;
  ne : link;
begin
while not eof(f) do begin
  st := last;
  readln(f2, str);
  while  (str <= st^.prev^.data) and (st^.prev <> nil) do st := st^.prev;
  new(ne);
  ne^.data:=str;
  ne^.prev:=st^.prev;
  st^.prev:=ne;
end;
end;
begin
Assign(f1,'input81.txt');
Assign(f2,'input82.txt');
Assign(f3,'output8.txt');
reset(f1);
reset(f2);
rewrite(f3);
p1(f1,last);
p3(f2,last);
p2(f3, last);
close(f1);
close(f2);
close(f3);
end.
