type
    uk=^NodeTree;
    NodeTree=record
      age:integer;
      count:integer;
      left:uk;
      right:uk;
    end;
    
    ukS=^NodeStack;
    NodeStack = record
      data:uk;
      next:ukS;
    end;

Procedure P1(var f:text;var PHead:uk);{создание дерева}
var c:char;
    p,q:uk;
    k:integer;
    b:boolean;
 begin
  reset(f);
  
  new(p); {запись корня дерева}
  while c<>',' do
    begin
      read(f,c);
    end;
  readln(f,p^.age);
  p^.count:=1;
  p^.left:=nil;p^.right:=nil;
  PHead:=p; 
 
  while not Eof(f) do
   begin
    c:='r'; {записываем данные из файла в переменные}
    while c<>',' do
      begin
       read(f,c);
      end;
    readln(f,k);
    
    b:=false;
    while b<>true do
     begin
      if p^.age = k then begin inc(p^.count); b:=true; end; {если в данном элементе такой же возвраст}
      if (p^.age > k) then {если возвраст элемента больше, записываем влево}
        begin 
         if p^.left <> nil then p:=p^.left 
            else begin        {если слева пусто, то создаем новый элемент}
                  new(q);
                  q^.age:=k;
                  q^.count:=1;
                  q^.left:=nil;q^.right:=nil;
                  p^.left:=q;
                  b:=true;
                 end;
        end;
      if (p^.age < k) then {если возвраст элемента меньше, записываем вправо}
        begin 
         if p^.right <> nil then p:=p^.right
            else begin      {если справа пусто, то создаем новый элемент}
                  new(q);
                  q^.age:=k;
                  q^.count:=1;
                  q^.left:=nil;q^.right:=nil;
                  p^.right:=q;
                  b:=true;
                 end;
        end;
     end;
    p:=PHead;{каждый раз заходим с корня дерева}
   end;
   
  close(f);
 end;

Procedure WriteNode(var f:text;P:uk);
 begin
  write(f,P^.age,' ');
  writeln(f,P^.count);
 end;

Procedure NewElemStack(var p:ukS;PHead:uk);
var q:ukS;
 begin
  new(q);
  q^.data:=PHead;
  q^.next:=p;
  p:=q;
 end;

Procedure GetElemStack(var p:ukS;var PHead:uk);
var q:ukS;
 begin
  PHead:=p^.data;
  q:=p;
  p:=p^.next;
  dispose(q);
 end;

Procedure P2(var f:text;Head:uk);
var ps:ukS;pt:uk; {ps - указатель стека, pt - указатель дерева}
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
       if ps^.data^.count<>0 then writeNode(f,ps^.data);
       GetElemStack(ps,pt);
       if pt=Head then i:=0;
       pt:=pt^.right;
      end;
     
   end;
 end;

Procedure find(var c:integer;k:integer;p:uk);{рекурсивный поиск и подсчет сотрудников}
 begin
  if p^.left<>nil then find(c,k,p^.left);
  if p^.age < k then c:=c+p^.count;
  if p^.right<>nil then find(c,k,p^.right);
 end;

Procedure P3(var f:text;PHead:uk);
var k:integer;
    count:integer;
 begin
  write('Введите возвраст: ');readln(k);
  count:=0;
  find(count,k,PHead);
  writeln(f);writeln(f);
  writeln(f,'Количество сотрудников младше ',k,': ',count);
 end;

var f1,f2 :text;
    Head:uk;    
Begin
 assign(f1,'inputS.txt');
 assign(f2,'output.txt');rewrite(f2);
 
 P1(f1,Head);
 P2(f2,Head);
 P3(f2,Head);
 
 close(f2);
end.