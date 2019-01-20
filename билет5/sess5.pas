program sess;
type 
  link2 = ^el2;
  el2 = record 
    prev : link2;
    num : integer;
    fam : string[10];
    next : link2;
   end;
  link1 = ^el1;
  el1 = record 
    num : integer;
    fam : string[10];
    next1 : link1;
   end;
var 
  beg2, last2 : link2;
  beg,beg1 : link1;
  f1,f2 : text;
procedure p1(var beg : link2; var last : link2; var f1 : text);
var
  tek : link2;
begin
new(tek);
//readln(f1, tek^. fam, tek^.num);
tek^.prev := nil;
tek^.next := nil;
beg := tek;
while not eof(f1) do begin
  new(tek^.next);
  tek^.next^.prev := tek;
  tek := tek^.next;
  readln(f1, tek^. fam, tek^.num);
  tek^.next := nil;
end;
last := tek;
end;
procedure p2(beg : link2; last: link2;var f2 : text);
var
  tek,begi : link2;
  i : integer;
begin
  writeln('Введите 0 если хотите вывести элементы в прямой последовательности, а 1 если в обратной');
  readln(i);
  begi := beg;
  if (i = 0) then begin
    tek := beg;
    while beg <> nil do begin
      writeln(f2, beg^.fam,beg^.num);
      beg := beg^.next;
    end;
  end;
  if (i = 1) then begin
    tek := last;
    while last <> begi^.prev do begin
      writeln(f2, last^.fam,last^.num);
      last := last^.prev;
    end;
  end;
end;
procedure p3(beg2 : link2;var beg1 : link1; var beg : link1);
var
  u1, u2,u3,u4,min:link2;
  tek,tek1 : link1;
begin
    u1 := beg2;
      
      while u1^.next <> nil do   { for i:=0 to n-1 }
    begin
        u2 := u1^.next;
        min := u1;
        while u2^.next <> nil do
        begin
            if u2^.next^.fam < min^.next^.fam then
               min := u2;
            u2 := u2^.next;   { Perehod }
        end;
        if min <> u1 then
        begin
            u3 := u1^.next;
            u1^.next := min^.next;   { Change u1 -> min }
            min^.next := u3;

            u4 := u1^.next^.next;
            u1^.next^.next := u3^.next;
            u3^.next := u4
        end;
        u1 := u1^.next;    { Perehod }
    end;
    new(tek);
    tek^.next1 := nil;
    beg1 := tek;
    u1 := beg2;
    while u1 <> nil do begin 
      new(tek^.next1);
      tek := tek^.next1;
      tek^.fam := u1^.fam;
      tek^.next1 := nil;
      u1 := u1^.next;
    end;
    u1 := beg2;
      
    while u1^.next <> nil do   
    begin
        u2 := u1^.next;
        min := u1;
        while u2^.next <> nil do
        begin
            if u2^.next^.num < min^.next^.num then
               min := u2;
            u2 := u2^.next;  
        end;
        if min <> u1 then
        begin
            u3 := u1^.next;
            u1^.next := min^.next;   
            min^.next := u3;

            u4 := u1^.next^.next;
            u1^.next^.next := u3^.next;
            u3^.next := u4
        end;
        u1 := u1^.next;    
    end;
    new(tek1);
    tek1^.next1 := nil;
    beg := tek1;
    u1 := beg2;
    while u1 <> nil do begin 
      new(tek1^.next1);
      tek1 := tek1^.next1;
      tek1^.num := u1^.num;
      tek1^.next1 := nil;
      u1 := u1^.next;
    end;
end;

begin
  assign(f1, 'input5.txt');
  assign(f2, 'output5.txt');
  reset(f1);
  rewrite(f2);
  p1(beg2, last2, f1);
  writeln(f2, '====NON SORTED ALL====');
  p2(beg2^.next, last2, f2);
  p3(beg2,beg1,beg);
  beg := beg^.next1^.next1;
  beg1 := beg1^.next1^.next1;
  writeln(f2, '====SORTED SURBANES====');
  while beg1 <> nil do begin
    writeln(f2, beg1^.fam);
    beg1 := beg1^.next1;
  end;
  writeln(f2, '====SORTED NUMBERS====');
  while beg <> nil do begin
    writeln(f2, beg^.num);
    beg := beg^.next1;
  end;
  
  close(f1);
  close(f2);
end.
    