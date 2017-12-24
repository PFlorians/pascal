program  cisla;
uses crt, dos;

var
c: real;
f: text;
kladne, zaporne: byte;
avg: real;
num: byte;
begin
        clrscr;
        assign(f, 'cisla.txt');
        reset(f);

        kladne:=0;
        zaporne:=0;
        avg:=0;
        num:=1;
        while seekeof(f)=false do
        begin
                read(f, c);
                if c>0 then
                begin
                        kladne:=kladne+1;
                end
                else
                begin
                        zaporne:=zaporne+1;
                end;
                num:=num+1;
                avg:=avg+c;
        end;
                writeln('Priemer: ', (avg/num):5:2);
                writeln('Kladne: ', kladne);
                writeln('Zaporne: ', zaporne);
                close(f);

        write('press any key to exit');
        repeat until keypressed;
end.
