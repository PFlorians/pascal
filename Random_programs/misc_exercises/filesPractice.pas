program filesPracitice;
uses crt, dos;

type
osoba=record
            meno: string[20];
            priezv: string[30];
            vek: byte;
        end;

var
cislo: real;
ucitel: osoba;
f: file of osoba;
cisla: text;
slova: text;
s: searchrec;
veta: string;

begin
        clrscr;
        assign(slova, 'slova.txt');
        rewrite(slova);
        assign(cisla, 'ciselny.txt');
        rewrite(cisla);

        assign(f, 'filespractice.bin');
        findfirst('filespractice.bin', anyfile, s);

        if doserror<>0 then
        begin
                rewrite(f);
                close(f);
                Filemode:=2;
                reset(f);
        end
        else
        begin
                Filemode:=2;
                reset(f);
                seek(f, filesize(f));//bez toho prepise cely subor
        end;

        ucitel.meno:='James';
        ucitel.priezv:='McConnelly';
        ucitel.vek:=25;
        write(f, ucitel);

        ucitel.meno:='Abdullah';
        ucitel.priezv:='Sultan';
        ucitel.vek:=45;
        write(f, ucitel);

        ucitel.meno:='Toshihiro';
        ucitel.priezv:='Kazewa';
        ucitel.vek:=32;
        write(f, ucitel);

        seek(f, 0);//reset pointah
        writeln('just checking pos: ', filepos(f), ' size: ', filesize(f), ' teachers');


        //prepise predosle hodnoty
        seek(f, filesize(f)-2);
        ucitel.meno:='Miklos';
        ucitel.priezv:='Pereszlenyi';
        ucitel.vek:=26;
        write(f, ucitel);
        seek(f, 0);
        write(cisla, '25.67 987 541 215 36.12', #13, #10);
//        writeln(cisla);

        write(cisla, '10 12.01245 3.15        546');

        //vypisy a pod.
        close(cisla);
        reset(cisla);
        while eof(cisla)<>true do
        begin
                read(cisla, cislo);
                writeln('Cislo: ', cislo:0:3);
        end;
        writeln('----------------------------');
        writeln(slova, 'csokkiraly az isztambul');
        writeln(slova, 'Some random 256.59 numbers');
        writeln(slova, 'Aj takto moze byt');
        close(slova);
        reset(slova);
        while seekeof(slova)<>true do
        begin
                readln(slova, veta);
                writeln(veta);
        end;
        while eof(f)<>true do
        begin
                read(f, ucitel);
                writeln('ucitel meno: ', ucitel.meno);
                writeln('Ucitel priezv: ', ucitel.priezv);
                writeln('Ucitel vek: ', ucitel.vek);
                writeln('################################');
        end;

        close(f);
        close(cisla);
        write('Press any key to exit...');
        repeat until keypressed;
end.
