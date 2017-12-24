program p1;
uses crt, dos, lib1;

var
userIn: string;
i: byte;

begin
        clrscr;

        repeat
                write(#10, #13, 'enter string> ');
                readln(userIn);
                vymen(userIn);


                ////////////////////////////////////////
               { for i:=1 to length(userIn) do
                begin
                    kod(userIn[i]);//call lib1.zamen()
                    write(userIn[i]);
                end;
                line;}
                write(#10, #13, 'Press "N" or "n" to exit> ');
        until upcase(readkey)='N';
        line;
        write('Press any key to exit...');
        repeat until keypressed;
end.
