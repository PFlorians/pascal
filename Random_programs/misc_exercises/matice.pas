program matice;
uses crt, dos;

type
matrix33=array[0..2] of array[0..2] of byte;
matrix44=array[0..3] of array[0..3] of byte;

var
arr331:matrix33;
arr332:matrix33;
arr441:matrix44;
arr442:matrix44;
f: text;
s: searchrec;


procedure multiplyWrite(var matrix: matrix33; var f: text);
var i, j: byte;
tmp: string;
v: byte;
begin
        for i:=0 to 2 do
        begin
                for j:=0 to 2 do
                begin
                        matrix[i][j]:=2*matrix[i][j];
//                        v:=matrix[i][j];
                        str(matrix[i][j], tmp);
                        tmp:=tmp+', ';
                        writeln(f, tmp);
                        tmp:='';
                end;
        end;
        writeln('Operation finished');
end;
procedure addMatrices(arr331: matrix33; arr332: matrix33; var f: text);
var i, j: byte;
matrix: matrix33;
begin
        for i:=0 to 2 do
        begin
                for j:=0 to 2 do
                begin
                        matrix[i][j]:=arr331[i][j]+arr332[i][j];
                end;
        end;
end;

procedure  vstupMatice33(arr331: matrix33; arr332: matrix33; var f: text);
var i, j: byte;
code: integer;
begin
        for i:=0 to 2 do
        begin
                for j:=0 to 2 do
                begin
                        writeln('[', i, ',', j,']: ');
                        val(readkey, arr331[i][j], code);
                        if code <> 0 then begin  writeln('Damn wrong input');break; end;
                end;
        end;
        for i:=0 to 2 do
        begin
                for j:=0 to 2 do
                begin
                        writeln('[', i, ',', j,']: ');
                        val(readkey, arr332[i][j], code);
                        if code <> 0 then begin  writeln('Damn wrong input');break; end;
                end;
        end;
        addMatrices(arr331, arr332, f);
end;

procedure vstupMatice44(arr441: matrix44; arr442: matrix44; var f: text);
var i, j: byte;
code: integer;
begin
        for i:=0 to 3 do
        begin
                for j:=0 to 3 do
                begin
                        writeln('[', i, ',', j,']: ');
                        val(readkey, arr441[i][j], code);
                end;
        end;
        for i:=0 to 2 do
        begin
                for j:=0 to 2 do
                begin
                        writeln('[', i, ',', j,']: ');
                        val(readkey, arr442[i][j], code);
                end;
        end;
end;

begin
        clrscr;
        assign(f, 'matrix.txt');
        findfirst('matrix.txt', anyfile, s);
        if doserror=0 then
        begin
                append(f);//ready to append at the end, no need to seek
                repeat
                        writeln('Zadajte aky typ matice pouzit 1: 3x3, 2: 4x4[1/2]');
                        case readkey of
                                '1': begin vstupMatice33(arr331, arr332, f) end;
                                '2': begin vstupMatice44(arr441, arr442, f) end;
                        end;
                        writeln('Press TAB to exit');
                until readkey=#9;

        end
        else
        begin
                rewrite(f);
                close(f);
                append(f);
                repeat
                        writeln('Zadajte aky typ matice pouzit 1: 3x3, 2: 4x4[1/2]');
                        case readkey of
                                '1': begin vstupMatice33(arr331, arr332, f) end;
                                '2': begin vstupMatice44(arr441, arr442, f) end;
                        end;
                        writeln('Press TAB to exit');
                until readkey=#9;
        end;
        close(f);
        write('Press any key to exit...');
        repeat until keypressed;

end.
