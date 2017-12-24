program typef;
uses crt, dos;

type
pes = record
            meno: string[20];
            vek: byte;
            vyska: byte;
        end;

var
azor: pes;
f: file of pes;

begin
        clrscr;

        assign(f, 'seznam.bin');
        azor.meno:='Azor';
        azor.vek:=10;
        azor.vyska:=3;

        //kontrola
        {$I-}
        rewrite(f);
        {$I+}

        if ioresult=0 then
        begin
                write(f, azor);
        end
        else
        begin
                writeln('Nastala chyba pr ioresult');
        end;
        close(f);//zavriet
        write('Press any key to exit...');
        repeat until keypressed;
end.
