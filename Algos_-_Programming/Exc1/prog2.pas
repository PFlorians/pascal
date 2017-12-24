program prog2;
uses crt, dos;

type
student=record
        meno: string[25];
        prie: string[30];
        vyska: byte;
        rok: word;
       end;

var
ziaci: array[1..2] of student;

begin
        clrscr;
        writeln('enter firstname student1:');
        readln(ziaci[1].meno);//pouzit lebo read vezme do buffer crlf z writeln
        writeln('enter lastname student 1:');
        readln(ziaci[1].prie);
        writeln('enter fname student 2:');
        readln(ziaci[2].meno);
        writeln('enter lname student 2:');
        readln(ziaci[2].prie);

        writeln('enter birth year of student 1.');
        read(ziaci[1].rok);
        writeln('enter birth year of student 2.');
        read(ziaci[2].rok);
        writeln('enter height of student 1.');
        read(ziaci[1].vyska);
        writeln('enter height of student 2.');
        read(ziaci[2].vyska);
        // end of read

        writeln(' rozdiel: ', abs((ziaci[1].rok-ziaci[2].rok)));
        if ziaci[1].vyska > ziaci[2].vyska then
        begin
                writeln('ziak 1 je vacsi ako ziak 2');
        end
        else
        begin
                if ziaci[1].vyska = ziaci[2].vyska then
                begin
                    writeln('ziaci su rovnako vysoky');
                end
                else
                begin
                      writeln('ziak 2 je vacsi ako ziak 1');
                end;
        end;
        writeln('press any key to exit');
        repeat until keypressed;
end.
//zevraj else if je mozny lenze to je else begin if ... end dalsie else
