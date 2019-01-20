program sess3;
type
  link = ^uk;
  uk = record
  num : integer;
  auth : string[10];
  data : string[10];
  next : link;
  prev : link;
end;
var
f1, f2 : text;
beg, last : link;

procedure p1(var f1 : text; var beg : link; var last : link);
var
tek,ne,work,tool : link;
k : integer;
s, c : string[10];
begin
new(tek);
beg := tek;
//beg^.num := 0;
tek^.next := nil; tek^.prev := nil;
new(tek^.next);
tek^.next^.prev := tek;
tek := tek^.next;
read(f1, tek^.num); read(f1, tek^.auth); readln(f1, tek^.data);
tool := tek;
new(tek^.next);
tek^.next^.prev := tek;
tek := tek^.next;
tek^.num := MaxInt;
last := tek;

while not eof(f1) do
begin
  tek := last;
  read(f1, k);
  read(f1, s);
  readln(f1, c);
  while  (k <= tek^.prev^.num) and (tek^.prev <> nil) do tek := tek^.prev;
  new(ne);
  ne^.num := k;
  ne^.auth := s;
  ne^.data := c;
  ne^.prev:=tek^.prev;
  tek^.prev := ne;

end;
reset(f1);
while not eof(f1) do begin
  tek := beg;
  read(f1, k);
  read(f1, s);
  readln(f1, c);
  if (k = tool^.num) and (s = tool^.auth) and(c = tool^.data) then continue;
  while  (k >= tek^.next^.num) and (tek^.next <> nil) do tek := tek^.next;
  new(ne);
  ne^.num := k;
  ne^.auth := s;
  ne^.data := c;
  ne^.next:=tek^.next;
  tek^.next:=ne;
end;
end;
procedure p2(beg : link; last : link);
var
tek, ne : link;
k : integer;
s,c : string;
begin
writeln('enter new num');
readln(k);
writeln('enter new auth');
readln(s);
writeln('enter new book');
readln(c);
tek := beg;
while (k >= tek^.next^.num) and (tek^.next <> nil) do tek := tek^.next;
new(ne);
ne^.num := k;
ne^.auth := s;
ne^.data := c;
ne^.next:=tek^.next;
tek^.next:=ne;

tek := last;
while (k <= tek^.prev^.num) and (tek^.prev <> nil) do tek := tek^.prev;
new(ne);
ne^.num := k;
ne^.auth := s;
ne^.data := c;
ne^.prev:=tek^.prev;
tek^.prev:=ne;
end;
procedure p3(var f2 : text; beg : link; last:link);
var
tek : link;
begin
tek := beg^.next;
writeln(f2, '=====RIGHT DERECTION=====');
while tek <> last do
begin
  writeln(f2, tek^.num, tek^.auth, tek^.data);
  tek := tek^.next;
end;
tek := last^.prev;
writeln(f2, '=====REVERSE DERECTION=====');
while tek <> beg do
begin
  writeln(f2, tek^.num, tek^.auth, tek^.data);
  tek := tek^.prev;
end;
end;
procedure p4(var f2: text;beg : link; last : link);
var 
tek : link;
s :string;
begin 
writeln('enter auth name');
readln(s);
tek := beg^.next;
writeln(f2, '===BOOKS OF', s, '===');
while tek <> last do
begin
  if (tek^.auth = s) then 
  begin
    writeln(f2, tek^.data);
  end;
  tek := tek^.next;
end;
end;
begin
assign(f1, 'input.txt');
assign(f2, 'output.txt');
reset(f1);
rewrite(f2);
p1(f1,beg,last);
p3(f2, beg, last);
p2(beg, last);
p3(f2, beg, last);
p4(f2, beg, last);
close(f1);
close(f2);
end.