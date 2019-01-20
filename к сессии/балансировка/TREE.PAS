program tree;
type node = ^t;
t = record
  val : integer;
  left : node;
  right : node;
end;
procedure AddElemLeft(var head:node; val:integer);
var
  tmp, newNode,buff:node;
begin
  tmp := head;
  New(newNode);
  newNode^.val := val;
  newNode^.right := nil;
  newNode^.left := nil;
  if tmp = nil then begin head := newNode; exit end;
  while (tmp^.Left <> nil) and (tmp^.Left^.val > val) do begin
  
  tmp := tmp^.Left;
  end;
  if val > head^.val then begin
    newNode^.left := head;
    head := newNode;
    exit;
  end;
  buff := tmp^.left;
  tmp^.left := newNode;
  newNode^.left := buff;
end;
procedure AddElemRight(var head:node; val:integer);
var
  tmp, newNode,buff:node;
begin
  tmp := head;
  New(newNode);
  newNode^.val := val;
  newNode^.right := nil;
  newNode^.left := nil;
  if tmp = nil then begin head := newNode; exit end;
  while (tmp^.Right <> nil) and (tmp^.Right^.val < val) do begin
  
  tmp := tmp^.Right;
  end;
  if val < head^.val then begin
    newNode^.Right := head;
    head := newNode;
    exit;
  end;
  buff := tmp^.Right;
  tmp^.Right := newNode;
  newNode^.Right := buff;
end;
procedure WriteTree(var head:node);
begin
write('Node: ',head^.val,'  ');
if head^.left <>nil then  write('Left: ',head^.left^.val,'  ')  else write('Left: nil  ');
if head^.right<>nil then  write('Right: ',head^.right^.val,'  ') else write('Right: nil  ');
writeln;
if head^.left <>nil then  WriteTree(head^.left);
if head^.right<>nil then  WriteTree(head^.right);
end;

procedure SplitTree(var head:node; point:integer );
var
tmp,pp,buff:node;
i:integer;
right:boolean;
begin
if point = 0 then exit;
point := point div 2;
tmp := head;
pp:=head;
if head^.right = nil then right := true else right := false;
for i:= 1 to point do if right then tmp := tmp^.left else tmp := tmp^.right;
  for i:= 1 to point  do begin
   if right then  AddElemRight(tmp,pp^.val)  else  AddElemLeft(tmp,pp^.val); 
   if right then  buff := pp^.left  else buff := pp^.right; 

   pp^.left := nil;
   pp^.right := nil;
   Dispose(pp);
   pp:=buff;
  end;
  head := tmp;
  if head^.right <> nil then SplitTree(head^.right, point);
  if head^.left <> nil then SplitTree(head^.left, point);
end;

var 
head:node;
tmp,num:integer;
begin
  assign(input, 'input.txt');
  assign(output, 'output.txt');
  reset(input);
  rewrite(output);

while not EOLN do begin
  read(tmp);
  AddElemRight(head,tmp);
  Inc(num);
end;

writeln('Before balancing');
WriteTree(head);

SplitTree(head,num);

writeln('After balancing');
WriteTree(head);
end.