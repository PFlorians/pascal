program troj;
uses crt, dos;  //komentar

var
a, b: byte;
o: word;
t: real;
begin
    clrscr;
    write('zadajte a, b: ');
    read(a, b);
    t:=(a*b)/2;
    o:=(a*b);
    writeln('t: ', t:5:2, ' o: ', o);//control k+c je kopirovanie presun ctrl k+v

    repeat until keypressed;
end.
