unit lib;

interface

uses crt, dos;
procedure average(var val, val1: real);


implementation
        procedure average(var val, val1: real);
        var  i,a,b : byte;
        begin
                a:=0;
                b:=0;
                val:=0;
                val1:=0;
                for i:=1 to 26 do
                begin
                       a:=a+(random(5)+1);
                end;
                for i:=1 to 24 do
                begin
                        b:=b+(random(5)+1);
                end;

                val:=a/26;
                val1:=b/24;
        end;
end.

