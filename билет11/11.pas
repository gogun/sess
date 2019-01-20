program sess11;
type 
 ftree=^uk;
 uk=record
   age:integer;
   kol:integer;
   left,right:ftree
 end;
   st = ^stak;
  stak = record
    data:ftree;
    next:st;
  end;
 var
  f1 : text;
  root : ftree;
 procedure p1(var f1 : text; var root : ftree);
 label l1;
 var
   c,i:integer;
   s: char;
   t:ftree;
   dt,dt2 : ftree;
 begin
  new(root);
  for i:= 1 to 10 do read(f1, s); 
  readln(f1, root^.age);
  root^.kol := 1;
  root^.left:=nil; root^.right:=nil;
  l1:
  while not eof(f1) do
  begin
    dt := root;
    for i:= 1 to 10 do read(f1, s); 
    readln(f1, c);
    while dt <> nil do
    begin
      dt2:=dt;
      if(c > dt^.age) then dt:=dt^.right
      else if (c < dt^.age) then dt:=dt^.left
      else begin inc(dt^.kol);
      goto l1;
      end;
    end;
    new(dt);
    dt^.age := c;
    dt^.kol := 1;
    dt^.left:=nil; dt^.right:=nil;
    if(c > dt2^.age) then dt2^.right:= dt
    else dt2^.left:= dt;
  end;
 end;
 Procedure WriteNode(P:ftree);
 begin
  write(P^.age,' ');
  writeln(P^.kol);
 end;
Procedure GetElemStack(var p:st;var PHead:ftree);
var q:st;
 begin
  PHead:=p^.data;
  q:=p;
  p:=p^.next;
  dispose(q);
 end;
Procedure NewElemStack(var p:st;PHead:ftree);
var q:st;
 begin
  new(q);
  q^.data:=PHead;
  q^.next:=p;
  p:=q;
 end;
Procedure P2(Head:ftree);
var ps:st;pt:ftree; {st - указатель стека, ftree - указатель дерева}
    i:integer;
 begin
  new(pt);
  pt^.left:=Head;
  new(ps);
  ps^.data:=pt;
  ps^.next:=nil;
  pt:=pt^.left;
  i:=1;
  
  While (ps<>nil)or(i=0) do
   begin
    i:=1;
    if pt<>nil then
     begin 
       NewElemStack(ps,pt);
       pt:=pt^.left;
     end
    else 
      begin
       if ps^.data^.kol<>0 then writeNode(ps^.data);
       GetElemStack(ps,pt);
       if pt=Head then i:=0;
       pt:=pt^.right;
      end;
     
   end;
 end;
 {procedure pp2(var u2, uHead : st; u : ftree);
  begin
    new (u2);
    u2^.next := uHead;
    u2^.data := u;
    uHead := u2;
  end;

procedure p2 (uRoot : ftree);
  var uHead, u2 : st;
      u: ftree;
      k : integer;
  begin
    new (uhead);
    uHead^.data := uRoot;
    uHead^.next := nil;
    while uHead <> nil do begin
      u := uHead^.data;
      uHead := uHead^.next;
      if u^.right <> nil then
        pp2 (u2, uHead, u^.right);
      if u^.left <> nil then begin
        pp2 (u2, uHead, u);
        uHead^.k := true;
        pp2 (u2, uHead, u^.left);
      end
      else begin
        write(u^.age, '-', u^.kol, '; ');
        while (uHead <> nil) and (uHead^.k = true) do begin
          u := uHead^.data;
          write(u^.age, '-', u^.kol, '; ');
          uHead := uHead^.next;
        end;
      end;
    end;
  end;}
 procedure gettree(ukt1: ftree; var k : integer; n : integer);
begin
  
  if ukt1^.left <> nil then gettree(ukt1^.left, k, n);
  if ukt1^.age < n then k:=k+ukt1^.kol;
  if ukt1^.right <> nil then gettree(ukt1^.right, k, n);
  
end;
procedure p3(root : ftree);
var
  n,k : integer;
begin
  writeln('Введите возраст сотрудника: ');read(n);
  k := 0;
  gettree(root, k, n);
  write('Количество сотрудников: ');
  writeln(k);
end;
 begin
   assign(f1, 'input.txt');
   reset(f1);
   p1(f1, root);
   p2(root);
   p3(root);
   //gettree(root);
   close(f1);
 end.