program exam;
type 
  link = ^el;
  el = record
    prev : link;
    data : string;
    next : link;
  end;
var 
  beg, last : link;
  f1,f2 : text;
  i : integer;
procedure p1(var f1 : text;var beg : link;var last : link; var i : integer);
var
  st, work : link;
begin
  new(st);
  beg := st;
  st^.prev := nil;
  readln(f1, st^.data);
  st^.next := nil;
  i := 1;
  while not eof(f1) do
  begin
    inc(i);
    new(work);
    work^.prev:=st;
    readln(f1, work^.data);
    work^.next:=nil;
    st^.next:=work;
    st:=st^.next;
  end;
  last := st;
end;
procedure p2(var f2 : text;beg : link;last : link; i : integer);
var 
  work : link;
  a : integer;
begin
  writeln('Если желаете вывести фамилии с начала введите 1, если желаете с конца введите 0');
  readln(a);
    if (a = 1) then begin 
      work := beg^.next;
      while work^.next <> nil do
      begin
        writeln(f2, work^.data);
        work := work^.next;
      end; 
      if ((i mod 2) = 0) then writeln(f2, last^.data);
    end
    else if (a = 0) then begin 
      if ((i mod 2) = 0) then writeln(f2, last^.data);
      work := last^.prev;
      while work^.prev <> nil do
      begin
        writeln(f2, work^.data);
        work := work^.prev;
      end;
    end;
  
  
end;

procedure p3(beg :link;var  last :link);
var
  work : link;
begin
  work := beg;
  while work <> last do
  begin
    if work^.next^.next = nil then break;
    work^.next := work^.next^.next;
    work := work^.next;
  end;
  work := last;
  while work <> beg do
  begin
    if work^.prev^.prev = nil then break;
    work^.prev := work^.prev^.prev;
    work := work^.prev;
  end;
end;


begin
assign(f1, 'input10.txt');
assign(f2, 'output10.txt');
reset(f1);
rewrite(f2);
p1(f1,beg, last, i);
p3(beg^.next,last);
p2(f2, beg, last, i);

close(f1);
close(f2);
end.
  