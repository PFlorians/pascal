program druhy;
uses crt, dos;

var
str: string;
d: byte;

begin
    clrscr;
    write('Zadajte text: ');
    read(str);
    writeln('druhy: ', str[2], ' ordinalna hodnota: ', ord(str[2]));
    writeln('predposledny: ', str[length(str)-1], ' ordinalna hodnota: ', ord(str[length(str)-1]));
    d:=length(str) div 2;
    //stredny kontrola poctu pismen
    writeln('stredny: ', str[d+1], ' ordinalna hodnota: ', ord(str[d+1]));
    repeat until keypressed;
end.
