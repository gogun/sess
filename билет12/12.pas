program ses;
type
  link = ^el;
  el = record
    num : integer;
    auth :string[10];
    name : string[10];
    year : integer;
    price : integer;
    next : link;
    prev :link;
  end;

var
  beg, last:link;
  f1,f2 : text;
procedure p1(var f :text;var beg : link);
var
tek : link;
c : char;
begin
new(tek);
tek^.next := nil; tek^.prev := nil;
beg := tek;
while not eof(f)do
begin
  new(tek^.next);
  tek^.next^.prev := tek;
  tek:=tek^.next;
  read(f,tek^.num,tek^.auth,tek^.name,tek^.year);
  read(f,c);
  readln(f,tek^.price);
end;
last := tek;
end;
procedure p2(var f : text; beg : link; last : link);
var tek : link;
begin
  writeln(f, '===RIGHT DIRECTION');
  tek := beg^.next;
  while tek <> nil do begin
    writeln(f,tek^.num,tek^.auth,tek^.name,tek^.year, ' ',tek^.price);
    tek:= tek^.next;
  end;
  writeln(f, '===REVERSE DIRECTION');
  while last <> beg do begin
    writeln(f,last^.num,last^.auth,last^.name,last^.year, ' ',last^.price);
    last:= last^.prev;
  end;
end;
//сортировка вставками двунаправленного списка с пустыми началом и концом
procedure p3 (var uHead : link);
  var beg,tmp, tmp2 : link;
      num : integer;
    auth :string[10];
    name : string[10];
    year : integer;
    price : integer;
  begin
  beg := uHead;
    tmp := uHead^.next^.next;
    while tmp <> nil do begin
      num := tmp^.num;
      auth := tmp^.auth;
      name := tmp^.name;
      year := tmp^.year;
      price := tmp^.price;
      tmp2 := tmp;
      while (tmp2^.prev <> beg) do begin
  if tmp2^.prev^.auth > auth then
    break;
        tmp2^.num := tmp2^.prev^.num;
        tmp2^.auth := tmp2^.prev^.auth;
        tmp2^.name := tmp2^.prev^.name;
        tmp2^.year := tmp2^.prev^.year;
        tmp2^.price := tmp2^.prev^.price;
        
        tmp2 := tmp2^.prev
      end;
        tmp2^.num := num;
        tmp2^.auth := auth;
        tmp2^.name := name;
        tmp2^.year := year;
        tmp2^.price :=price;
        
      tmp := tmp^.next;
    end;
  end;

begin
Assign(f1,'input.txt');
Assign(f2,'output.txt');
reset(f1);
rewrite(f2);
p1(f1, beg);
p2(f2, beg, last);
writeln(beg^.num);
p3(beg);
p2(f2, beg, last);
writeln(' buuwehfiw' > ' nkqfhioiw');
close(f1);
close(f2);

end.
