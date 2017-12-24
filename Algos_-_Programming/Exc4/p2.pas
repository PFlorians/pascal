program p2;
uses crt, dos;

var
f: text;
f1: text;
meno, priez, tmp1: string;

begin
    clrscr;
    //{$i-}
    assign(f, 'jmena.txt');
    assign(f1, 'prohozena-jmena.txt');
    reset(f);
    rewrite(f1);
    //{$i+} writeln (output, ioresult);

    while eof(f)=false do
    begin
        readln(f, tmp1);
        priez:=copy(tmp1, 1, pos(' ', tmp1)-1);
        meno:=copy(tmp1, pos(' ', tmp1), length(tmp1));
        tmp1:=meno+' '+priez;
        writeln(f1, tmp1);
    end;

    close(f);
    close(f1);
      write('Press any key to exit...');
      repeat until keypressed;
end.
