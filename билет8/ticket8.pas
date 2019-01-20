Program pp1;
type 
  sp = ^stek;
  stek = record
  data:string;
  next:sp;
  end;

var
  head:sp;
  f1,f2,f3:text;
  

  
  procedure p1(var head:sp;var f1:text);
  var
    tmp:sp;
  begin 
    new(tmp);
    readln(f1,tmp^.data);
    tmp^.next:=head;
    head:=tmp;
  while not eof(f1) do 
  begin
    new(tmp);
    readln(f1,tmp^.data);
    tmp^.next:=head;
    head:=tmp;
  end;
  end;
  
  procedure p2(var head:sp;var f3:text);
  begin
    if head<>nil then 
    begin
      p2(head^.next,f3);
      writeln(f3,head^.data);
    end;
  end;
  
  procedure p3(head:sp;var f1:text;var f2:text);
  var 
    hp:string;
    tmp:sp;
    ne:sp;
  begin
    while not eof(f2) do
    begin
      tmp:=head;
      readln(f2,hp);
      while (tmp^.next<>nil) and (hp<=tmp^.next^.data)  do
      tmp:=tmp^.next;
      new(ne);
      ne^.data:=hp;
      ne^.next:=tmp^.next;
      tmp^.next:=ne;
      
    end;
  end;
 
 begin
 Assign(f1,'input81.txt');
Assign(f2,'input82.txt');
Assign(f3,'output8.txt');
reset(f1);
reset(f2);
rewrite(f3);
 p1(head,f1);
 p3(head,f1,f2);
 p2(head,f3);
close(f1);
close(f2);
close(f3);
 end.
    
  
    