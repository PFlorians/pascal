program main;
uses crt, dos, fopslib, userDialog;

var
uinp: char;

begin
        clrscr;
        uinp:=#0; //init as empty

        writeln('#######################################################');
        writeln('       Welcome user running in console mode...         ');
        writeln('       Basic caommands:                                ');
        writeln('    /h/H/     - open this help                         ');
        writeln('    /f/F/     - file operations                        ');

        repeat
                write('> ');
                read(input, uinp);
                case upcase(uinp) of
                     'H' :  helpCmd;
                     'F' :  fopsCmd;
                     'E' :  break;
                     else
                     begin
                        writeln('Unknown choice!');
                        helpCmd;
                     end;
                end;
        until (upcase(uinp))='E';

        write('Press any key to exit...');
        repeat until keypressed;
end.
