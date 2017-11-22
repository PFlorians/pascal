program hadaj;
uses crt, dos;

var hadane, odhad_pc, interval, lbound, ubound: integer;          //definicia premennych

begin
clrscr;
randomize;
odhad_pc:=-1;
interval:=500;
lbound:=0;
ubound:=500;

writeln('zadajte bla bla bla');
readln(hadane);
writeln(vektor[1]);
odhad_pc:=random(interval)+1;

        while(odhad_pc<>hadane) do
        begin
                //writeln('odhad ', odhad_pc);
                //readkey;
                if odhad_pc <= hadane then
                begin
                        lbound:=odhad_pc;
                        odhad_pc:=random(interval-lbound)+1+lbound;//nove dno
                end
                else
                begin
                        ubound:=odhad_pc;
                        //zrezat velkost intervalu
                        interval:=ubound;
                        odhad_pc:=random(interval-lbound)+1+lbound;//normalizovat
                end
        end;

 writeln('vysledny ', odhad_pc);
writeln('kill_process...');
repeat until keypressed;
end.
