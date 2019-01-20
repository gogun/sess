  program p6;
type
  sp = ^spisok;
  spisok = record
    name:string[10];
    quanity:integer;
    next:sp;
  end;

var
  u1,u2:sp;
  f1,f2,f3:text;
  
  procedure p1(var uHead:sp;var f1:text);
  var
    tmp:sp;
  begin
    new(uHead);
    uHead^.next:=nil;
    readln(f1,uHead^.name,uHead^.quanity);
    tmp:=uHead;
    while not eof(f1) do 
    begin
      new(tmp^.next);
      tmp:=tmp^.next;
      tmp^.next:=nil;
      readln(f1,tmp^.name,tmp^.quanity);
    end;
  end;
  
  procedure p2(var uHead:sp;var f3:text);
  var
    tmp:sp;
  begin
    tmp:=uHead;
    while tmp <> nil do 
    begin
      writeln(f3,tmp^.name,' ',tmp^.quanity);
      tmp:=tmp^.next;
    end;
  end;
  
  procedure p3(var u1,u2:sp);
  var
    tmp1:sp;
    tmp2:sp;
    del:sp;
  begin
    tmp2:=u2;
    while tmp2 <> nil do
    begin
      tmp1:=u1;
      while tmp1 <> nil do
        begin
          if tmp1^.name = tmp2^.name then 
          begin
            if tmp1^.quanity = tmp2^.quanity then 
            begin
              tmp1^.quanity:=0;
              del:=u2;
              if del = tmp2 then
                u2:=tmp2^.next
              else
              begin
                while del^.next <> tmp2 do
                del:=del^.next;
                del^.next:=tmp2^.next;
              end;
            end
            else
            if tmp1^.quanity < tmp2^.quanity then
            begin
              tmp2^.quanity:=tmp2^.quanity - tmp1^.quanity;
              tmp1^.quanity:=0;
              
            end
            else if tmp1^.quanity > tmp2^.quanity then
            begin
              tmp1^.quanity:=tmp1^.quanity - tmp2^.quanity;
              del:=u2;
              if del = tmp2 then
                u2:=u2^.next
              else
              begin
                while del^.next <> tmp2 do
                del:=del^.next;
                del^.next:=tmp2^.next;
              end;
            end;
          end;
          tmp1:=tmp1^.next;
        end;
        tmp2:=tmp2^.next;
      end;
    end;
    
begin
  assign(f1,'dan.txt');
  reset(f1);
  assign(f2,'dan1.txt');
  reset(f2);
  assign(f3,'res.txt');
  rewrite(f3);
  p1(u1,f1);
  p1(u2,f2);
  p2(u1,f3);
  writeln(f3);
  p2(u2,f3);
  writeln(f3,'Что осталось на склад');
  p3(u1,u2);
  p2(u1,f3);
  writeln(f3,'Недоделаный заказ'  );
  p2(u2,f3);
  close(f3);
end.
  
  

         
              
            
  
      
    