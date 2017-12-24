program prog1;
//this just adds number in matrix nothing more
uses dos, crt;

type
matrix = array[1..2, 1..2] of real;
var
matica: matrix;


begin
        clrscr;
        writeln('please enter val for [1][1]');
        read(matica[1][1]);
        writeln('please enter val for [1][2]');
        read(matica[1][2]);
        writeln('please enter val for [2][1]');
        read(matica[2][1]);
        writeln('please enter val for [2][2]');
        read(matica[2][2]);
        // vysledny vypis
        writeln('diagonala[1][1] ', matica[1][1]:5:2, ' diagonala [2][2]',
        matica[2][2]:5:2);
        writeln('sucet: ', (matica[1][1]+matica[2][2]):5:2);
        write('press any key to exit');
        repeat until keypressed;

end.
