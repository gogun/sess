program p19;
type
  sp = ^spisok;
  spisok = record
    next:sp;
    pred:sp;
    number:string;
    author:string;
    name:string;
    year:string;
    price:string;
  end;
  
var 
  f1,f2:text;
  uHead,uTail:sp;


  function reading(var line:string):string;
  begin
    if line[length(line)] <> ' ' then
      line:=line + ' ';
    reading:=copy(line,1,pos(' ',line)-1);
    delete(line,1,pos(' ',line));
  end;

  procedure p1(var uHead,uTail:sp; var f1:text);
  var
    tmp,u:sp;
    line:string;
    l,n,t,err:integer;
  begin
    uTail:=uHead;
      readln(f1,line);
      new(u);
      uHead^.next:=u;
      u^.next:=nil;
      u^.pred:=uHead;
      u^.number:=reading(line);
      u^.author:=reading(line);
      u^.name:=reading(line);
      u^.year:=reading(line);
      u^.price:=reading(line);
      while not eof(f1) do
    begin
     readln(f1,line);
      new(u);
      u^.next:=nil;
      u^.pred:=nil;
      u^.number:=reading(line);
      u^.author:=reading(line);
      u^.name:=reading(line);
      u^.year:=reading(line);
      u^.price:=reading(line);

      tmp:=uHead;
      val(u^.number,l,err);
      val(uTail^.number,t,err);
      if l > t then
      uTail:=u;
      while tmp^.next <> nil do
      begin
        val(tmp^.next^.number,n,err);
        if l < n then
          break;
        tmp:=tmp^.next;
      end;
      if tmp^.next = nil then
      begin
        tmp^.next:=u;
        u^.pred:=tmp;
      end
      else
      begin
        u^.next:=tmp^.next;
        tmp^.next^.pred:=u;
        tmp^.next:=u;
        u^.pred:=tmp;
      end;
    end;
  end;

  procedure p2(var uHead:sp);
  var
    u,tmp:sp;
    line:string;
    l,n,err:integer;
  begin
    writeln('vvedite zapis');
    readln(line);
    new(u);
    u^.next:=nil;
    u^.pred:=nil;
    u^.number:=reading(line);
    u^.author:=reading(line);
    u^.name:=reading(line);
    u^.year:=reading(line);
    u^.price:=reading(line);
    tmp:=uHead;
    val(u^.number,l,err);
    while tmp^.next <> nil do
    begin
      val(tmp^.next^.number,n,err);
      if l < n then
        break;
      tmp:=tmp^.next;
    end;
    u^.next:=tmp^.next;
    tmp^.next^.pred:=u;
    tmp^.next:=u;
    u^.pred:=tmp;
  end;

  procedure p3(var uHead,uTail:sp;var f2:text);
  var
    tmp,u:sp;
    author:string;
    name:string;
    l,n,err:integer;
  begin
    writeln('avtor');
    readln(author);
    writeln('name');
    readln(name);
    if (copy(author,1,1) >= 'A') and (copy(author,1,1) <= 'K') then
    begin
      tmp:=uHead;
      while tmp <> nil do
      begin
        if (tmp^.author = author) and (tmp^.name = name) then
        begin
          writeln(f2,tmp^.number,' ',tmp^.author,' ',tmp^.name
          ,' ',tmp^.year,' ',tmp^.price);
          break;
        end;
       tmp:=tmp^.next;
      end;
    end;
    if (copy(author,1,1) >= 'L') and (copy(author,1,1) <= 'Z') then
    begin
      tmp:=uTail;
      while tmp <> nil do
      begin
        if (tmp^.author = author) and (tmp^.name = name) then
        begin
          writeln(f2,tmp^.number,' ',tmp^.author,' ',tmp^.name
          ,' ',tmp^.year,' ',tmp^.price);
          break;
        end;
       tmp:=tmp^.pred;
      end;
    end;
  end;

  procedure p4(var uHead,uTail:sp;var f2:text);
  var
    tmp:sp;
  begin
    tmp:=uHead^.next;
    while tmp <> nil do
    begin
      writeln(f2,tmp^.number,' ',tmp^.author,' ',tmp^.name
          ,' ',tmp^.year,' ',tmp^.price);
      tmp:=tmp^.next;
    end;
    writeln(f2);
    tmp:=uTail;
    while tmp <> uHead do
    begin
      writeln(f2,tmp^.number,' ',tmp^.author,' ',tmp^.name
          ,' ',tmp^.year,' ',tmp^.price);
      tmp:=tmp^.pred;
    end;
  end;

begin
  assign(f1,'dan.txt');
  reset(f1);
  assign(f2,'res.txt');
  rewrite(f2);
  new(uHead);
  uHead^.next:=nil;
  uHead^.pred:=nil;
  p1(uHead,uTail,f1);
  p4(uHead,uTail,f2);
  writeln(f2);
  p2(uHead);
  p4(uHead,uTail,f2);
  writeln(f2,'/////////////////////////////////');
  p3(uHead,uTail,f2);
  writeln(f2);
  p4(uHead,uTail,f2);
  close(f2);
end.
          
    
        
  
  
      

    
  
    
  
  
    
