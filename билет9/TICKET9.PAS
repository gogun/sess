program p9;
type 
  sp = ^spisok;
  spisok = record
    data:string;
    next:sp;
  end;

var
  u2,uHead,uTail:sp;
  f1,f2:text;

  procedure p1(var uHead,u2,uTail:sp;var f1:text);
  var
    tmp:sp;
  begin
    new(uHead);
    uHead^.next:=nil;
    readln(f1,uHead^.data);
    tmp:=uHead;
    while not eof(f1) do
    begin
      new(tmp^.next);
      tmp:=tmp^.next;
      
      readln(f1,tmp^.data);
      tmp^.next:=nil;
    end;
    tmp^.next:=uHead;
    u2:=uHead;
  end;
  
  procedure ring(var uHead,u:sp;f2:text);
  var
    tmp:sp;
  begin
    if uHead <>u2 then
    begin
      ring(uHead^.next,u,f2);
      writeln(f2,uHead^.data);
    end;  
   end;
  procedure p2(var uHead,uTail:sp;var f2:text);
  var
    n:integer;
    tmp:sp;
  begin
    writeln('Слева направо - 0, справа налево 1');
    readln(n);
    if n = 0 then 
    begin
      tmp:=uHead;
      writeln(f2,tmp^.data);
      tmp:=tmp^.next;
      while tmp <> uHead do
      begin
        writeln(f2,tmp^.data);
        tmp:=tmp^.next;
      end;
    end;
    if n = 1 then begin
     ring(uHead^.next,u2,f2);
     writeln(f2,uHead^.data);
     end;end;
  
  procedure p3(var uHead,uTail:sp);
  var
    tmp,del:sp;
    n:integer;
  begin
    tmp:=uHead;
    tmp:=tmp^.next;
    n:=2;
    while tmp <> uHead do
    begin
      if n mod 2 = 0 then 
      begin
        del:=uHead;
        while del^.next <> tmp do
          del:=del^.next;
          if tmp = uTail then
          uTail:=del;
          del^.next:=tmp^.next;
          
       end;
       n:=n+1;
       tmp:=tmp^.next;
     end
   end;
   
begin
  assign(f1,'input.txt');
  reset(f1);
  assign(f2,'output.txt');
  rewrite(f2);
  p1(uHead,u2,uTail,f1);
  
  p2(uHead,uTail,f2);
  writeln(f2);
  p3(uHead,uTail);
  p2(uHead,uTail,f2);
  close(f2);
end.
          
    
  
    