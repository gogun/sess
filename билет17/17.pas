program sess17;
type
  link = ^uk;
  uk = record
    num : integer;
    name :string[16];
    next : link;
  end;
  tt = record
    num : integer;
    name :string[16];
  end;
  t = file of tt;
var
beg1, beg2, last1,last2: link;
f1,f2 : t;
f3,f4,f5 : text;
procedure p1(var f1 : t;var f : text);
var
data :tt;
begin
  while not eof(f) do
  begin
    readln(f,data.num, data.name);
    write(f1, data);
  end;
end;
procedure p2(var f : t; var beg :link; var last: link);
var
tek : link;
k : tt;
ne :link;
begin
  reset(f);
  new(tek);
  tek^.next := nil;
  beg := tek;
  new(tek^.next);
  tek:=tek^.next;
  read(f, k);
  tek^.num := k.num;
  tek^.name := k.name;
  tek^.next := nil;
  new(tek^.next);
  tek:=tek^.next;
  tek^.num := maxint;
  tek^.name := 'zzzzzzzzzzzzzzzz';
  tek^.next := nil;
  last := tek;
  while not eof(f) do
  begin
    tek:=beg;
    read(f,k);
    while (k.name >= tek^.next^.name) and (tek^.next <> nil) do tek := tek^.next;
    new(ne);
    ne^.num := k.num; ne^.name := k.name;
    ne^.next := tek^.next;
    tek^.next := ne;
  end;
end;
procedure p5(var f : text;beg : link; last : link);
begin
  while beg <> last do
  begin
    writeln(f,beg^.num, beg^.name);
    beg := beg^.next;
  end;
end;
procedure p4(var beg1 : link;var beg2 : link;var last1 : link;var last2 : link);
var
ne : link;
tek1 : link;
tek2 : link;
begin
tek2 := beg2;
while tek2 <> last2 do
begin
  tek1 := beg1;
  while (tek2^.name >= tek1^.next^.name) and (tek1^.next <> last1) do tek1 := tek1^.next;
  new(ne);
  ne^.name := tek2^.name;
  ne^.num := tek2^.num;
  ne^.next := tek1^.next;
  tek1^.next := ne;

  tek2 := tek2^.next;
end;
end;
begin
assign(f1, 'input1.tip');
assign(f2, 'input2.tip');
assign(f3, 'input1.txt');
assign(f5, 'input2.txt');
assign(f4, 'output.txt');
reset(f3);
rewrite(f1);
rewrite(f4);
p1(f1, f3);
p2(f1, beg1, last1);
writeln(f4,'====FIRST LIST====');
p5(f4, beg1^.next, last1);
close(f1);
close(f3);

reset(f5);
rewrite(f2);
p1(f2, f5);
p2(f2, beg2, last2);
writeln(f4,'====SECOND LIST====');
p5(f4, beg2^.next, last2);
p4(beg1,beg2,last1,last2);
writeln(f4,'====NOW ITS NEW LIST====');
p5(f4, beg1^.next^.next, last1);
close(f2);
close(f5);

close(f4);
end.
  
