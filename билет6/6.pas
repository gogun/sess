program sess6;
type 
  link = ^uk;
  uk = record
    data : string[10];
    num : integer;
    next : link;
  end;
var
beg1, beg2 : link;
f1, f2, f3 : text;
procedure p1(var f : text; var beg : link);
var
tek : link;
begin
  new(tek);
  tek^.next := nil;
  beg := tek;
  while not eof(f) do
  begin
    new(tek^.next);
    tek := tek^.next;
    read(f, tek^.data);readln(f, tek^.num);
    tek^.next := nil;
  end;
end;
procedure p2(var f : text; beg : link);
var
tek : link;
begin
  tek := beg;
  while tek <> nil do 
  begin
    writeln(f, tek^.data, tek^.num);
    tek := tek^.next;
  end;
end;
procedure p3(beg1 : link; beg2 : link);
var
tek1, tek2, tmp1, tmp2 : link;
begin
  tek1 := beg1;
  tmp1 := tek1;
  tek1 := tek1^.next;
  while tek1 <> nil do
  begin
    tek2 := beg2;
    tmp2 := tek2;
    tek2 := tek2^.next;
    while tek2 <> nil do
    begin
      if (tek1^.data = tek2^.data) then
      begin
      
        if (tek1^.num > tek2^.num) then 
        begin
          tek1^.num := tek1^.num - tek2^.num;
          tmp2^.next := tek2^.next;
          dispose(tek2);
          tek2 := tmp2;
          tek2^.next := tmp2^.next;
        end
        else if (tek1^.num < tek2^.num) then
        begin
          tek2^.num := tek2^.num - tek1^.num;
          tmp1^.next := tek1^.next;
          dispose(tek1);
          tek1 := tmp1;
          tek1^.next := tmp1^.next;
        end
        else if (tek1^.num = tek2^.num) then
        begin
          tmp1^.next := tek1^.next;
          dispose(tek1);
          tek1 := tmp1;
          tek1^.next := tmp1^.next;
          tmp2^.next := tek2^.next;
          dispose(tek2);
          tek2 := tmp2;
          tek2^.next := tmp2^.next;
        end;
      end;
      tmp2 := tek2;
      tek2 := tek2^.next;
    end;
    tmp1 := tek1;
    tek1 := tek1^.next;
  end;
end;

begin
assign(f1, 'input1.txt');
assign(f2, 'input2.txt');
assign(f3, 'output.txt');
reset(f1);
reset(f2);
rewrite(f3);
p1(f1, beg1);
p1(f2, beg2);
writeln(f3, '===HAVE===');
p2(f3, beg1^.next);
writeln(f3, '===NEED===');
p2(f3, beg2^.next);
p3(beg1, beg2);
writeln(f3, '===HAVE(AFTER)===');
p2(f3, beg1^.next);
writeln(f3, '===NEED(AFTER)===');
p2(f3, beg2^.next);
close(f1);
close(f2);
close(f3);
end. 