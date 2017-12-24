program prime;
uses crt, dos;

var
options: set of char=['M', 'S', 'O'];
userinp: word;
j: byte;
f: text;
primen: boolean;
r, o: char;

//M-monitor
procedure vysledok(rozhod: char; cislo: word;var f: text);
var tmp: string;
vysl: string;
begin
        str(cislo, tmp);
       vysl:= 'Cislo '+ tmp + ' je prvocislo';
        case rozhod of
                'M': writeln(output, vysl);
                'S': writeln(f, vysl);
                'O': begin
                        writeln(output, vysl);
                     writeln(f, vysl);
                     end;
        end;
end;
begin
        clrscr;

        assign(f, 'vysledok.txt');
        rewrite(f);

        repeat
                write('Please enter your number: ');
                read(input, userinp);
                primen:=false;

               for j:=2 to 9 do
               begin
                         if ((userinp mod j)=0) and (userinp<>j) then
                         begin
                                   primen:=false;
                                   break;
                         end
                         else
                         begin
                                   primen:=true;
                         end;
                end;

                if primen=true then
                begin
                       write('Zadajte kam zapisat: [M, S, O]: ');
                       repeat
                            writeln('leak');
                            read(input, r);
                       until r in options;
                       vysledok(r, userinp, f);
                end;

                writeln('Would you like to continue[Y/N]');
                o:=upcase(readkey);
        until o='N';
        close(f);
        write('Press any key to exit...');
        repeat until keypressed;

end.
