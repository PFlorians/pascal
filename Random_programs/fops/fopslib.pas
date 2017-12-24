unit fopslib;

interface
uses crt, dos, userDialog, sysutils, video;

var
fopsChoices: set of char = ['T', 'O', 'M', 'E'];
(* main ops *)
procedure fopsCmd();

(* text files subprogs declaration *)
procedure readText();
procedure readText(fname: string);

(* directories etc. *)
function dir():string;

(* experimental procedures *)
procedure exp1();

implementation
        procedure fopsCmd();//dialogue to serve fops cmd
        var choice: string;
        begin
                textcolor(3);//cyan
                repeat
                        fopsMainDialog();
                        readln(choice);

                until upcase(choice)='E';
        end;
        procedure readText();//reading text file until end
        var
        fl: text;
        fname: string;
        tmp: string;
        errCode: integer;
        c: char;
        begin
                fname:=getFileName();
                {$i-}//turn off io runtime error
                assign(fl, fname);
                reset(fl);
                {$i+}
                errCode:=IOResult;
                if ((FileExists(fname))=true) and (errCode=0) and (fname<>'') then
                begin
                        while EOF(fl) <> true do
                         begin
                                readln(fl, tmp); //move cursor 1 line down
                                writeln(output, tmp);
                         end;
                         close(fl);
                end
                else
                begin
                        writeln('There was an error!!!');
                        if FileExists(fname)=false then
                        begin
                                writeln('File does not exists.');
                                writeln('Would you like to create file"',
                                        fname,'"? [Y/N]');
                                read(input, c);
                                if (upcase(c)='Y') then
                                begin
                                        //close(fl);
                                        {$i-}
                                        //assign(fl, fname);
                                        rewrite(fl);
                                        {$i+}
                                        if IOResult <> 0 then
                                        begin
                                                writeln('error creating file: ', IOResult);
                                        end;
                                        writeln('File created.');
                                end;
                        end
                        else
                        begin
                        writeln('Error code of assign/reset: ', errCode);
                        writeln('File name: "', fname, '"');
                        end;
                        close(fl)
                end;
        end;

        procedure readText(fname: string);
        var
        fl: textfile;
        tmp: string;
        begin

        end;

        function dir():string;
        var


        {experimentals go after this line}
        procedure exp1();
        begin

        end;
end.
