Program p20;
type
  sp = ^spisok;
  spisok = record
    name:string[10];
    date:integer;
    price:integer;
    quanity:integer;
    next:sp;
  end;

var
  uHead:sp;
  f1,f2:text;

        
  procedure p1(var uHead:sp;var f1:text);
  var
    line:string;
    tmp:sp;
    c:char;
    
  begin
    new(tmp);
    readln(f1,tmp^.name,c,tmp^.date,c,tmp^.price,c,tmp^.quanity);
    tmp^.next:=nil;
    uHead^.next:=tmp;
    while not eof(f1) do
    begin
      new(tmp^.next);
      tmp:=tmp^.next;
      readln(f1,tmp^.name,c,tmp^.date,c,tmp^.price,c,tmp^.quanity);
      tmp^.next:=nil;
    end;
  end;

  procedure p2(var uHead:sp);
  var
    tmp:sp;
    u:sp;
    line:string;
    l:integer;
    m:integer;
    i:integer;
    err:integer;
    c:char;
  begin
    tmp:=uHead;
    Writeln('Введите новую запись');
    new(u);
    readln(u^.name,c,u^.date,c,u^.price,c,u^.quanity);
    while tmp^.next <> nil do
    begin
      if (tmp^.next^.name = u^.name) and (tmp^.next^.price = u^.price) and
         (tmp^.next^.date = u^.date) then
      begin
       tmp^.next^.quanity:=tmp^.next^.quanity + u^.quanity;
       exit;
      end;
       if u^.name < tmp^.next^.name then
        break;
      tmp:=tmp^.next;
     end;
      if tmp^.next = nil then
        tmp^.next:=u

      else
      begin
        u^.next:=tmp^.next;
        tmp^.next:=u;
      end;
  end;

  procedure p3(var uHead:sp);
  var
   u, u2,u4,u3,min:sp;
    l,n,err:integer;

  begin
  u:=uHead;
    while u^.next <> nil do
    begin
      u2:=u^.next;
      min:=u;
      while u2^.next <> nil do
      begin
        if u2^.next^.date < min^.next^.date then
          min:=u2;
        u2:=u2^.next;
      end;
      if min <> u then
      begin
        u3:=u^.next;
        u^.next:=min^.next;
        min^.next:=u3;

        u4:=u^.next^.next;
        u^.next^.next:=u3^.next;
        u3^.next:=u4;
      end;
      u:=u^.next;
     end;
   end;

  procedure p4(uHead:sp;var f2:text);
  var
    tmp:sp;
  begin
    tmp:=uHead^.next;
    while tmp <> nil do
    begin
      writeln(f2,tmp^.name,' ',tmp^.date,' ',tmp^.price,' ',tmp^.quanity);
      tmp:=tmp^.next;
    end;
  end;

  begin
  new(uHead);
  uHead^.next:=nil;
  assign(f1,'dan.txt');
  reset(f1);
  assign(f2,'res.txt');
  rewrite(f2);
  p1(uHead,f1);
  p4(uHead,f2);
  p2(uHead);
  writeln(f2);
  p4(uHead,f2);
  writeln(f2);
  p3(uHead);
  p4(uHead,f2);
  close(f2);
  end.
  
  
        
    
      
      
      
      
    
    
