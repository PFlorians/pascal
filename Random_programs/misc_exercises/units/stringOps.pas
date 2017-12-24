unit stringOps;

interface
uses crt, dos;
function backwards(str: string):string;
function palindrome(str: string): boolean;//return true if palindrome
function opBackwards(str: string): string;

implementation
        ////////////////////////////////////////////////////////////////

        function backwards(str: string):string;
        var tmp: string;
        i, j: byte;
        begin
                j:=length(str);
                for i:=1 to length(str) do
                begin
                        tmp[i]:=str[j];
                        j:=j-1;
                end;
                tmp[0]:=str[0];
                backwards:=tmp;
        end;

        function opBackwards(str: string): string;
        var tmp: string;
        i: byte;
        begin
                for i:=1 to length(str) do
                begin
                        tmp:=str[i]+tmp;
                end;
                opBackwards:=tmp;
        end;

        function palindrome(str: string): boolean;
        var i, j: byte;
        begin
                i:=length(str);
                j:=1;
                while (str[i]=str[j]) and (i<>j) do
                begin
                        i:=i-1;
                        j:=j+1;
                end;
                if i=j then
                 begin
                        palindrome:=true;
                 end
                else
                 begin
                        palindrome:=false;
                 end;
        end;
end.
