program ss;
type
  link = ^el;
  el = record
    num : integer;
    auth : string[10];
    name :string[10];
    year : integer;
    price : integer;
    prev : link;
    next : link;
  end;
procedure p1(var beg : link; var f1 : text; var last : link);
var
  st, work : link;
  u1,u2,u3,u4,min:link;
begin
  new(st);
  beg := st;
  read(f1, st^.num, st^.auth, st^.name, st^.year, st^.price);   
  readln(f1);
  st^.prev := nil;
  st^.next := nil;
  while not eof(f1) do
  begin
    new(work);
    work^.prev:=st;
    read(f1, work^.num, work^.auth, work^.name, work^.year, work^.price);   
    readln(f1);
    work^.next:=nil;
    st^.next:=work;
    st:=st^.next;
  end;
  new(work);
  work^.prev:=st;
  work^.next:=nil;
  st^.next:=work;
  st:=st^.next;
  last := st;
  u1 := last;
  while u1^.prev <> nil do   
    begin
        u2 := u1^.prev;
        min := u1;
        while u2^.prev <> nil do
        begin
            if u2^.prev^.auth < min^.prev^.auth then
               min := u2;
            u2 := u2^.prev;  
        end;
        if min <> u1 then
        begin
            u3 := u1^.prev;
            u1^.prev := min^.prev;   
            min^.prev := u3;

            u4 := u1^.prev^.prev;
            u1^.prev^.prev := u3^.prev;
            u3^.prev := u4;
        end;
        u1 := u1^.prev;    
    end;
end;


procedure p2(beg : link;var last : link);
var
  tek,tekb : link;
  work : link;
  
begin

  tek := last;
  tekb := beg;
  writeln('Введите новую запись');
  new(work);
  read(work^.num, work^.auth, work^.name, work^.year, work^.price);
  while (tek^.prev <> nil) and (work^.auth >= tek^.prev^.auth) do tek := tek^.prev;  
  work^.prev := tek^.prev;
  tek^.prev := work;
  
  while tekb <> tek^.next do
  begin
    if(tekb^.auth = tek^.auth) then begin
    work^.next := tekb^.next^.next;
    tekb^.next^.next := work;
    end;
    tekb := tekb^.next;
  end;

end;
procedure p3(beg : link; last : link; var f2 : text);
var
  tekb, tekl : link;
begin
  tekb := beg;
  tekl := last;
  writeln(f2, '====NON SORTED====');
  while tekb <> tekl do
  begin
    writeln(f2, tekb^.num, tekb^.auth, tekb^.name, tekb^.year,' ', tekb^.price);
    tekb := tekb^.next;
  end;
  writeln(f2);
  tekl := tekl^.prev;
  writeln(f2,'======SORTED======');
  while tekl <> nil do
  begin
    writeln(f2, tekl^.num, tekl^.auth, tekl^.name, tekl^.year,' ', tekl^.price);
    tekl := tekl^.prev;
  end;
  writeln(f2);
end;
var
  beg, last : link;
  f1,f2 : text;
begin
  assign(f1, 'input18.txt');
  assign(f2, 'output18.txt');
  reset(f1);
  rewrite(f2);
  p1(beg, f1, last);
  p3(beg, last,f2);
  p2(beg, last);
  p3(beg, last,f2);
  
 

  close(f1);
  close(f2);
end.
  
    