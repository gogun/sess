type
    uk=^T1;
    T1=object
     a1:integer;
     a2:string[2];
     procedure Init(pa1:integer;pa2:string);
    end;

Procedure T1.Init(pa1:integer;pa2:string);
 begin
  a1:=pa1;
  a2:=pa2;
 end;

var p:uk;
Begin
 new(p);
 p^.Init(2,'AA');
 writeln('a1=',p^.a1,' a2=',p^.a2);
 dispose(p);
end.