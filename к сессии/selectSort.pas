procedure sorting (u1:t);
var u2,u3,u4,min:t;
begin
    while u1^.next1 <> nil do   { for i:=0 to n-1 }
    begin
        u2 := u1^.next1;
        min := u1;
        while u2^.next1 <> nil do
        begin
            if u2^.next1^.fam < min^.next1^.fam then
               min := u2;
            u2 := u2^.next1;   { Perehod }
        end;
        if min <> u1 then
        begin
            u3 := u1^.next1;
            u1^.next1 := min^.next1;   { Change u1 -> min }
            min^.next1 := u3;

            u4 := u1^.next1^.next1;
            u1^.next1^.next1 := u3^.next1;
            u3^.next1 := u4;
        end;
        u1 := u1^.next1;    { Perehod }
    end;
end;