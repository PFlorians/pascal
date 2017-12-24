program p1;
uses crt, dos, lib;
var a, b: byte;
val, val1: real;

begin
      clrscr;
      randomize;
      average(val, val1);
      writeln('avg1: ', val:5:2, ' avg2: ', val1:5:2);
      write('Press any key to exit...');
      repeat until keypressed;
end.
