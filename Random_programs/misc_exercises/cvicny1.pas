program cvicny1;
uses crt, dos;


type
ftype=record
          vstup: string;
          vystup: string;
          a1, a2, a3, a4: byte;
        end;

var
f: file of ftype;
txtf: textfile;
frec: searchrec;
ft: ftype;


procedure analyze(vstup: string; var ft: ftype);
var i: byte;
vystup: string;
begin
        for i:=1 to length(vstup) do
        begin
                case vstup[i] of
                        'A'..'Z':  begin
                                        vystup[i]:='*';
                                        ft.a1:=ft.a1+1;
                                 end;
                        'a'..'z':begin
                                        vystup[i]:='+';
                                        ft.a2:=ft.a2+1;
                                 end;
                        '0'..'9':begin
                                        vystup[i]:='-';
                                        ft.a3:=ft.a3+1
                                 end;
                        else
                        begin
                                vystup[i]:='@';
                                ft.a4:=ft.a4+1;
                        end;
                end;

        end;
        vystup[0]:=vstup[0];
        ft.vystup:=vystup; //new output
        writeln('Analyze: ', ft.vystup, ' ', ft.vstup);
end;
procedure spark(var txtf: text; var ft: ftype);
var vstup: string;
s: string;
begin
        vstup:='';
        {$I-}
         append(txtf);
         Filemode:=2;//RW for binary
         reset(f);   //global
         seek(f, filesize(f));
        {$I+}

        if ioresult = 0 then
        begin
                repeat
                        //init first
                        writeln('Enter an input: ');
                        readln(vstup);
                        ft.a1:=0;
                        ft.a2:=0;
                        ft.a3:=0;
                        ft.a4:=0;
                        ft.vstup:=vstup;
                        //call f-ction
                        analyze(vstup, ft);
                        writeln('vstup: ', ft.vstup, ' vystup: ', ft.vystup);
                        //write text file
                        writeln(txtf, ft.vstup);
                        writeln(txtf, ft.vystup);
                        str(ft.a1, s);
                        writeln(txtf, s);
                        str(ft.a2, s);
                        writeln(txtf, s);
                        str(ft.a3, s);
                        writeln(txtf, s);
                        str(ft.a4, s);
                        writeln(txtf, s);
                        //write binary
                        write(f, ft);

                        writeln('press ESC to exit');
                until readkey=#27;
                close(f);
                close(txtf);
        end
        else
        begin
                writeln('There was an error: ', ioresult);
        end;
end;
procedure resolveDerror(val: integer);
begin
        case val of
                2: writeln('Error file not found');
                3: writeln('Error path not found');
                5: writeln('Error access denied');
                6: writeln('Error invalid handle');
                8: writeln('Error not enough memory');
                10: writeln('Error invalid environment');
                11: writeln('Error invalid format');
                18: writeln('Error no more files');
        end;
end;
begin
        clrscr;

        assign(f, 'cvicny1.bin');//binary
        assign(txtf, 'cvicny1.txt');//textfile
        findfirst('cvicny1.bin', anyfile, frec);

        if doserror = 0 then
        begin
                //f exists
                findfirst('cvicny1.txt', anyfile, frec);
                if doserror = 0 then
                begin

                        spark(txtf, ft);
                end
                else
                begin
                        resolveDerror(doserror);
                        rewrite(txtf);
                        close(txtf);

                        assign(txtf, 'cvicny1.txt');//textfile
                        spark(txtf, ft);
                end;
        end
        else
        begin
                resolveDerror(doserror);
                rewrite(f);//create f
                close(f);
                findfirst('cvicny1.txt', anyfile, frec);

                if doserror = 0 then
                begin

                        assign(f, 'cvicny1.bin');//binary
                        spark(txtf, ft);
                end
                else
                begin
                        resolveDerror(doserror);
                        rewrite(txtf);
                        close(txtf);
                        assign(f, 'cvicny1.bin');//binary
                        assign(txtf, 'cvicny1.txt');//textfile

                        spark(txtf, ft);
                end;
        end;

        write('Press any key to exit...');
        repeat until keypressed;

end.
