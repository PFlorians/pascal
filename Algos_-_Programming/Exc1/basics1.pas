program treti;
uses crt, dos;

var
c: char;
posun, res: byte;

begin
        clrscr;
        write('zadajte znak(a..j): ');
        read(c);
        write('zadajte posun(1..10): ');
        read(posun);
        res:=(ord(c)+posun);
        writeln('vysledok: ', chr(res));
        repeat until keypressed;
end.
