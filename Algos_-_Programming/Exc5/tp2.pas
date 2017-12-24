program tp2;
uses crt, dos, sysutils;
type
pes = record
            meno: string[20];
            vek: byte;
            vyska: byte;
        end;
var
azor: pes;
f: file of pes;
 c: byte;
 choice: char;
d: searchrec;
begin
        clrscr;
        Filemode:=2;//RW ops
        //defining searchrec


        findfirst('seznam.bin', anyfile, d);
        if doserror<>0 then
        beign
                writeln('Subor neexistuje: ', doserror);
        end
        else
        begin
                writeln('Subor existuje');
        end;
        assign(f, 'seznam.bin');
        //kontrola IO

        {$I-}
        reset(f);
        {$I+}
        c:=1;

        if ioresult=0 then
        begin
                repeat
                        writeln('Please enter name: ');
                        readln(azor.meno);
                        writeln('Please enter age: ');
                        readln(azor.vek);
                        writeln('Please enter vyska: ');
                        readln(azor.vyska);
                        //zapis

                        write(f, azor);
                        if c>=3 then
                        begin
                                writeln('Would you like to continue?[N for exit]');
                                choice:=readkey;
                        end;
                        c:=c+1;
                until (upcase(choice)='N') and (c>=3);
                //vypis
                seek(f, 0);
                {$I-}
                while eof(f)<>true do
                begin
                        {$I+}
                        writeln('IOresult: ', ioresult);
                        read(f, azor);
                        writeln('Meno: ', azor.meno, ' Vek: ', azor.vek, ' vyska: ', azor.vyska);


                end;
        end
        else
        begin
                writeln('Nastala chyba IO result: ', ioresult);
        end;
        write('Press any key to exit...');
        repeat until keypressed;

end.
