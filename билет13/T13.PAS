program p13;
type
  sp = ^spisok;
  spisok = record
    x,y,val:integer;
    next:sp;
  end;

var
   uHead:sp;
   f1,f2:text;



  procedure p1(var uHead:sp;var f1:text);
  var
    tmp,u:sp;
  begin
   new(u);
   u^.next:=nil;
   readln(f1,u^.x,u^.y,u^.val);
   uHead^.next:=u;
   while not eof(f1) do
   begin
     tmp:=uHead;
     new(u);
     u^.next:=nil;
     readln(f1,u^.x,u^.y,u^.val);
     while tmp^.next <> nil do
     begin
      if (u^.x < tmp^.next^.x) or ((u^.x <= tmp^.next^.x) and (u^.y < tmp^.next^.y)) then
        break;
      tmp:=tmp^.next;
     end;
     u^.next:=tmp^.next;
     tmp^.next:=u;
   end;
  end;

  procedure p2(var uHead:sp);
  var
     tmp:sp;
     del:sp;
  begin
    tmp:=uHead^.next;
    while tmp <> nil do
    begin
     del:=uHead;
     if tmp^.val = 0 then
     begin
     while del^.next <> tmp do
       del:=del^.next;
      del^.next:=tmp^.next;
     end;
     tmp:=tmp^.next;
  end;
 end;
  procedure p3(var uHead:sp;var f2:text);
  var
     tmp,u:sp;
     val:integer;
  begin
  writeln('Vvedite val');
  readln(val);
  tmp:=uHead;
  while tmp <> nil do
  begin
    if tmp^.val > val then
     writeln(f2,tmp^.x,' ',tmp^.y,' ',tmp^.val);
    tmp:=tmp^.next;
  end;
  end;

  procedure p4(var uHead:sp;var f2:text);
  var
     tmp:sp;
  begin
    tmp:=uHead;
    while tmp <> nil do
    begin
      writeln(f2,tmp^.x,' ',tmp^.y,' ',tmp^.val);
      tmp:=tmp^.next;
    end;
  end;

begin
 assign(f1,'dan.txt');
 reset(f1);
 assign(f2,'res.txt');
 rewrite(f2);
 new(uHead);
 uHead^.next:=nil;
 p1(uHead,f1);
 p4(uHead^.next,f2);
 p2(uHead);
 writeln(f2);
 p4(uHead^.next,f2);
 writeln(f2);
 p3(uHead^.next,f2);
 writeln(f2);
 p4(uHead^.next,f2);
 close(f2);
end.






















