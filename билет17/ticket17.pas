Program p11;
type tr = ^tree;
  tree = record
    lf,rt:tr;
    count:integer;
    agekey:integer;
  end;

  st = ^stak;
  stak = record
    data:tr;
    k : boolean;
    next:st;
  end;

var
 uRoot:tr;
 f1,f2:text;
 age:integer;
 k:integer;

function fun(line:string):integer;
var
  err, i, age : integer;
begin
  for i := 1 to length(line) do
    if (line[i] >= '0') and (line[i]<='9') then
      break;
  val(copy(line,i,length(line)-i+1), age, err);
  fun:=age;
end;

procedure p1(var uRoot:tr; var f:text);
label l1;
var
  dt,dt2:tr;
  line:string;
  age:integer;
begin
  new(uRoot);
  readln(f,line);
  age := fun (line);
  uRoot^.agekey:=age;
  uRoot^.lf:=nil;
  uRoot^.rt:=nil;
  uRoot^.count:=1;
  l1:
  while not eof(f) do
  begin
    dt:=uRoot;
    readln(f,line);
    age := fun (line);
    while dt <> nil do
    begin
      dt2:=dt;
      if age>dt^.agekey then
        dt:=dt^.rt
      else
        if age < dt^.agekey then
          dt:=dt^.lf
        else begin
          dt^.count := dt^.count + 1;
          goto l1;
        end;
    end;
    new(dt);
    dt^.agekey:=age;
    dt^.lf:=nil;
    dt^.rt:=nil;
    dt^.count := 1;
    if age>dt2^.agekey then
      dt2^.rt:=dt
    else dt2^.lf:=dt;
  end;
end;

procedure pp2(var u2, uHead : st; u : tr);
  begin
    new (u2);
    u2^.next := uHead;
    u2^.data := u;
    uHead := u2;
  end;

procedure p2 (uRoot : tr; var f : text);
  var uHead, u2 : st;
      u: tr;
      k : integer;
  begin
    new (uhead);
    uHead^.data := uRoot;
    uHead^.next := nil;
    while uHead <> nil do begin
      u := uHead^.data;
      uHead := uHead^.next;
      if u^.rt <> nil then
        pp2 (u2, uHead, u^.rt);
      if u^.lf <> nil then begin
        pp2 (u2, uHead, u);
        uHead^.k := true;
        pp2 (u2, uHead, u^.lf);
      end
      else begin
        write(f, u^.agekey, '-', u^.count, '; ');
        while (uHead <> nil) and (uHead^.k = true) do begin
          u := uHead^.data;
          write(f, u^.agekey, '-', u^.count, '; ');
          uHead := uHead^.next;
        end;
      end;
    end;
  end;

procedure p3(u : tr;age:integer;var k:integer);
begin
    if u^.lf <> nil then
      p3(u^.lf,age,k);
    if u^.agekey<age then
    k:=k+u^.count;
    if u^.rt <> nil then
      p3(u^.rt,age,k);
end;

Begin
  assign (f1, 'inputT11.txt');
  reset (f1);
  assign (f2, 'outputT11.txt');
  rewrite (f2);
  uRoot := nil;
  p1 (uRoot, f1);
  p2 (uRoot, f2);
  writeln('write age ');
  readln(age);
  p3(uRoot,age,k);
  writeln(k);
  close (f2);
  readln;
end.
