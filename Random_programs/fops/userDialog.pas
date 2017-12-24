unit userDialog;

interface
uses crt, dos;
function getFileName():string;
procedure helpCmd();
procedure fopsMainDialog();

implementation
        function getFileName(): string;
        var fname: string;
        begin
                write('Please enter the name of file: ', #10, #13);
                readln(fname);
                getFileName:=fname;
        end;
        procedure helpCmd();
        begin
                clrscr;
                writeln('###############################################');
                writeln('       Basic commands:                         ');
                writeln('    /h/H/       -  this help                   ');
                writeln('    /f/F/       -  file operations             ');
                writeln('###############################################');
        end;
        procedure fopsMainDialog();
        begin
                clrscr;
                writeln('###############################################');
                writeln('               Make a choice:                  ');
                writeln('t  - Text file operations                      ');
                writeln('o  - Other file type operations                ');
                writeln('m  - Miscellanous operations                   ');
                writeln('e  - Exit                                      ');
                write('> ');
        end;
end.
