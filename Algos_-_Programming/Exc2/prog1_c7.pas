unit lib1;

interface
{vars + procs}
uses crt, dos;
procedure line;//declare as global
procedure zamen(znak: char);
procedure kod(var znak:  char);
function vymen(ret: string): string;


implementation
        procedure line;
        begin
            writeln;
            writeln('---------------------');
        end;
        procedure zamen(znak: char);
        begin
            case znak of
                'A'..'Z': write('$');
                'a'..'z': write('@');
                '0'..'9': write('#');
                else
                        begin
                            write('&');
                        end;
                end;
        end;
        procedure kod(var znak: char);
        begin
            case znak of
                'A'..'Z': znak:='$';
                'a'..'z': znak:='@';
                '0'..'9': znak:='#';
                else
                        begin
                           znak:='&';
                        end;
                end;
        end;
        function vymen(ret: string):string;
        var tmp: string;
        x: byte;
        begin
               for x:=1 to length(ret) do
               begin
                        case ret[x] of
                              'A'..'Z': tmp[x]:='$';
                              'a'..'z': tmp[x]:='@';
                              '0'..'9': tmp[x]:='#';
                        else tmp[x]:='&';
                        end;
                        write(tmp[x]);
               end;   //end for
               line;
                vymen:=tmp;//return call pop stack
        end;
end.

