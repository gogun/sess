Unit sort;
INTERFACE 
  type
  tt = array[1..10] of string[28];
procedure sorting(var a: tt);
IMPLEMENTATION
procedure sorting;
begin
  for var i:= 1 to 9 do
   for var j:= 1 to 10-i do
      if(a[j])>(a[j+1]) then begin
        var s := a[j];
        a[j] := a[j+1];
        a[j+1] := s;
      end;
end;
begin
end.
