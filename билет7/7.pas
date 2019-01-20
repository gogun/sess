program ses;
type
  ftree = ^el;
  el = record
    name : string[10];
    num : integer;
    right : ftree;
    left :ftree;
  end;
var
  root:ftree;
  f1,f2 : text;
procedure p1(var f1 : text; var root : ftree);
 label l1;
 var
   c:integer;
   s: string[10];
   dt,dt2 : ftree;
 begin
  new(root);
  read(f1, root^.name);
  readln(f1, root^.num);
  root^.left:=nil; root^.right:=nil;
  while not eof(f1) do
  begin
    dt := root;
    read(f1, s); 
    readln(f1, c);
    while dt <> nil do
    begin
      dt2:=dt;
      if(c >= dt^.num) then dt:=dt^.right
      else if (c < dt^.num) then dt:=dt^.left;
    end;
   
    new(dt);
    dt^.num := c;
    dt^.name := s;
    dt^.left:=nil; dt^.right:=nil;
    if(c >= dt2^.num) then dt2^.right:= dt
    else dt2^.left:= dt;
  end;
 end;
 procedure p2(var f : text; root : ftree);
 
begin
 if (root^.left <> nil) then write(f, 'left : ',root^.left^.num, ';  ') else write(f,'left : nil; ');
 write(f, 'root : ',root^.num, '  ');
 if (root^.right <> nil) then write(f, 'right : ',root^.right^.num, ';  ') else write(f,'right : nil; ');
 writeln(f);
 if (root^.left<>nil) then p2(f,root^.left);
 if (root^.right<>nil) then p2(f,root^.right);
end;
procedure p3(var f : text; root :ftree);
begin
if (root^.right = nil) and (root^.left = nil) then writeln(f, 'ITS LEAF : ', root^.num);
 if(root^.right <> nil) then p3(f, root^.right);
 if(root^.left <> nil) then p3(f, root^.left);
end;
begin
Assign(f1,'input.txt');
Assign(f2,'output.txt');
reset(f1);
rewrite(f2);
p1(f1, root);
writeln(f2, '===TREE===');
p2(f2, root);
writeln(f2, '===LEAFS FROM RIGHT TO LEFT===');
P3(f2, root);
close(f1);
close(f2);

end.
