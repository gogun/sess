program turbo;
type
    t1 = object
       function f1 : string;
    end;
    t2 = object(t1)
       function f1 : string;
       procedure p2(a1:string);
    end;
function t1.f1:string;
begin
     f1:='---';
end;
function t2.f1:string;
begin
     f1:= '+++';
end;
procedure t2.p2(a1:string);
begin
     a1 := inherited f1;
     writeln('a1=',a1);
     writeln('a1=',f1);
end;
var
   o1 : t1;
   o2: t2;
begin
   o2.p2('gay');
end.















