program prog3;
uses dos, crt;

const
male_samohlasky: set of char = ['a', 'e', 'i', 'o', 'u', 'y'];
label
jmp1;

var
str: string;
i, len: byte;
begin
    clrscr;
    writeln('please enter a string>');
    readln(str);
    i:=1;
    len:=length(str);
    jmp1:
        if str[i] in male_samohlasky then
        begin
            writeln(str[i]);
        end;
        i:=i+1;//iter by 1
        if i<len then
        begin
                goto jmp1;//short jmp distance
        end;
    writeln('press any key to exit');
    repeat until keypressed;
end.

