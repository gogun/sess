program sess6;
type 
  ftree = ^el;
  el = record
    data : char;
    left : ftree;
    right :ftree;
  end;
  link = ^uk;
  uk = record
    data : char;
    next : link;
  end;
var
beg, tek: link;
root : ftree;
f1, f2: text;
procedure MakeMeTree(var root : ftree; c :char);
var 
tek : ftree;
begin
if (root = nil) then begin
  new(tek);
  tek^.left := nil; tek^.right := nil;
  tek^.data := c;
  root := tek;
end
else if (c < root^.data) then MakeMeTree(root^.left, c)
else MakeMeTree(root^.right, c);
end;
procedure p1(var f1 : text; var root : ftree);
var 
c : char;
begin
while not eof(f1) do 
begin
  while not eoln(f1) do
  begin
    read(f1, c);
    if c in ['A'..'Z'] then
    MakeMeTree(root, c);
  end;
  readln(f1);
end;
end;
procedure p2(var f2 : text; head : ftree);
begin
if head^.right<>nil then  write(f2, 'Right: ',head^.right^.data,'  ') else write(f2, 'Right: nil  ');
write(f2, 'Root: ',head^.data,'  ');
if head^.left <>nil then  write(f2, 'Left: ',head^.left^.data,'  ')  else write(f2, 'Left: nil  ');
writeln(f2);
if head^.right<>nil then  p2(f2, head^.right);
if head^.left <>nil then  p2(f2, head^.left);
end;
procedure p3(var beg : link; root : ftree);
begin
if (root^.right <> nil) then p3(beg, root^.right);
if (root <> nil) then 
begin
  new(beg^.next);
  beg := beg^.next;
  beg^.data := root^.data;
  write(f2, beg^.data, ' ');
  beg^.next:=nil; 
end;
if (root^.left <> nil) then p3(beg, root^.left);
end;
procedure proof(var f2:text;root : ftree);
begin
  if (root^.right <> nil) then proof(f2, root^.right);
  if (root <> nil) then write(f2, root^.data, ' ');
  if (root^.left <> nil) then proof(f2, root^.left);
end;
begin
assign(f1, 'input.txt');
assign(f2, 'output.txt');
reset(f1);
rewrite(f2);
p1(f1, root);
writeln(f2, '================RIGHT-ROOT-LEFT================');
writeln(f2, '====looks nice FROM TREE======');
p2(f2, root);
new(tek);
tek^.data := root^.data;
tek^.next := nil;
beg := tek;
writeln(f2, '====looks bad FROM LIST======');
p3(tek, root);
writeln(f2);
writeln(f2, '====looks bad FROM TREE======');
proof(f2, root);
writeln(f2, '(its really from tree)');
{beg:=beg^.next;
while beg <> nil do begin
  writeln(beg^.data);
  beg:= beg^.next;
end;}
close(f1);
close(f2);
end. 