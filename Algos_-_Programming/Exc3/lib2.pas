unit lib2;

interface
uses crt, dos;
function slova(ret: string): byte;
function obrateny(ret: string): string;
function palindrom(ret: string): boolean;
function palindrom2(ret: string): boolean;


implementation
        function slova(ret: string): byte;
        var i,c: byte;
        len : integer;
        begin
                c:=1;
                len:=length(ret);
                for i:=1 to len do
                begin
                        if ret[i] = ' ' then//poistka
                        begin
                                c:=c+1;
                        end;
                end;
                slova:=c;
        end;
        function obrateny(ret: string): string;
        var len, i, j: byte;
            tmp, tmp2: string;
        begin
                tmp:='';

                for i:=1 to length(ret) do
                begin
                    tmp:=ret[i]+tmp;
                end;
                j:=1;
                for i:=length(ret) downto 1 do
                begin
                        tmp2[j]:=ret[i];
                        j:=j+1;
                end;
                writeln(tmp2);
                obrateny:=tmp;
        end;
        function palindrom(ret: string): boolean;
        var i, j, k:byte;
        begin
                i:=1;
                j:=length(ret);
                k:=0;
                while i<>j do
                begin
                        if i=j then
                        begin
                            palindrom:=true;
                        end;
                        if upcase(ret[i])=upcase(ret[j]) then
                        begin
                           i:=i+1;
                           j:=j-1;
                           continue;
                        end
                        else
                        begin
                           palindrom:=false;
                        end;
                end;
                palindrom:=true;
        end;
        function palindrom2(ret: string): boolean;
        begin
                if ret=obrateny(ret) then
                begin
                    palindrom2:=true;
                end
                else
                begin
                    palindrom2:=false;
                end;
        end;
end.
