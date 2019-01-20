program ob12;
type
t1 = object
   procedure p1;
   function f1(a1:string):string;virtual;
   constructor Init;
end;
t2 = object(t1)
   b:byte;
   function f1(a1:string):string;virtual;
   constructor Init;
end;
procedure t1.p1;
begin
     writeln(f1('123'));
end;
function t1.f1(a1:string):string;
begin
     f1:=a1;
end;
constructor t1.Init;
begin
end;
function t2.f1(a1:string):string;
begin
     f1:=a1;
     b:=ord(a1[0]);
     writeln('b=',b);
end;
constructor t2.Init;
begin
end;
var
o1:t1;
o2:t2;
begin
     writeln('');
     o1.Init;
     o1.p1;
     o2.Init;
     o2.p1;
end.













