type
  t_info = record
    numb:integer;
    nas:string[13];
  end;
  
  sp = ^spisok;
  spisok = record
    numb:integer;
    nas:string[13];
    next:sp;
  end;

var
  f: file of t_info;
  f4: file of t_info;
  f1,f2,f3:text;
  uHead1,uHead2:sp;
  
  
  procedure p1(var f:file of t_info; var f1:text);
  var
    info:t_info;
    c:char;
  begin
    while not eof(f1) do
    begin
      readln(f1,info.numb,c,info.nas);
      write(f,info);
    end;
  end;
  
  procedure p2(var f:file of t_info; var uHead1:sp);
  var
    tmp,u:sp;
    info:t_info;
  begin
    while not eof(f) do
    begin
      new(u);
      read(f,info);
      u^.next:=nil;
      u^.numb:=info.numb;
      u^.nas:=info.nas;
      tmp:=uHead1;
      while tmp^.next <> nil do
      begin
        if u^.nas < tmp^.next^.nas then 
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
  end;
  
  procedure p4(var uHead1,uHead2:sp);
  var
    tmp1,tmp2,u:sp;
  begin
    tmp1:=uHead1;
    tmp2:=uHead2^.next;
    while tmp2 <> nil do
      begin
        tmp1:=uHead1;
        while tmp1^.next <> nil do
        begin
          if tmp2^.nas < tmp1^.next^.nas  then 
            break;
          tmp1:=tmp1^.next;
        end;
        new(u);
        u^.numb:=tmp2^.numb;
        u^.nas:=tmp2^.nas;
        
        u^.next:=tmp1^.next;
        tmp1^.next:=u;
        
        tmp2:=tmp2^.next;
      end;
   end;
   
  procedure p5(var uHead:sp;var f3:text);
  var
    tmp:sp;
  begin
    tmp:=uHead;
    while tmp <> nil do 
    begin
      writeln(f3,tmp^.numb,' ',tmp^.nas);
      tmp:=tmp^.next;
    end;
  end;
  
begin
  assign(f,'res.tip');
  rewrite(f);
  assign(f1,'dan.txt');
  reset(f1);
  assign(f2,'dan1.txt');
  reset(f2);
  assign(f3,'res.txt');
  rewrite(f3);
  new(uHead1);
  uHead1^.next:=nil;
  new(uHead2);
  uHead2^.next:=nil;
  p1(f,f1);
  close(f);
  reset(f);
  p2(f,uHead1);
  close(f);
  p5(uHead1^.next,f3);
  writeln(f3);
  
  assign(f4,'res1.tip');
  rewrite(f4);
  p1(f4,f2);
  close(f4);
  reset(f4);
  p2(f4,uHead2);
  close(f4);
  p5(uHead2^.next,f3);
  
  writeln(f3);
  p4(uHead1,uHead2);
  p5(uHead1^.next,f3);
  close(f3);
end.
  
  
          
        
        
     
    
    

    
 
  
    
    
  