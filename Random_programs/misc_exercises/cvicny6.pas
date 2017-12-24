program cvicny6;//small calculator
uses crt, dos;

const
ops:set of char=['+', '-', '*', '/', '^', '~'];

var
c, choice: char;
op1, op2: real;
oper: char;
f: text;
s: searchrec;
tmp: real;
ts: string;
t1, t2, t3: string;
meno: string;

function nameGame(var meno: string):boolean;
var
i: byte;
begin
        if pos(' ', meno) = 0 then
        begin
                for i:=1 to length(meno) do
                begin
                        if (i mod 2)=0 then
                        begin
                                meno[i]:=upcase(meno[i]);
                        end;
                end;
                nameGame:=true;
                writeln('Meno: ', meno);
        end
        else
        begin
                nameGame:=false;
        end;
end;
function power(op: real; deg: word):real;
var i: byte;
res, tmp: real;
begin
        tmp:=op;
        res:=op;
        for i:=1 to deg do
        begin
                res:=res*tmp;
        end;
        power:=res;
        writeln('mocnina i: ', i);
end;

function calc(op1: real; op2: real; oper: char):real;
begin
        case oper of
                '+': calc:=op1+op2;
                '-': calc:=op1-op2;
                '*': calc:=op1*op2;
                '/': calc:=op1/op2;
                '^': calc:=power(op1, trunc(op2));
                '~': calc:=sqrt(op1);
        end;
end;

begin
        clrscr;
        //file ops
        ts:='';
        op2:=0;
        assign(f, 'cvicny6.txt');
        findfirst('cvicny6.txt', anyfile, s);
        if doserror<>0 then
        begin
                writeln('Creating file...');
                rewrite(f);
                close(f);
                append(f);
        end
        else
        begin
                append(f);
        end;

        repeat
                writeln('Please enter the first operand: ');
                readln(op1);

                repeat
                        writeln('Please choose an operation[+;-;*;/;^;~(sqrt)]: ');
                        oper:=readkey;
                until (oper in ops)=true;
                if oper <> '~' then
                begin
                        writeln('Enter a second operand...');
                        readln(op2);
                end;
                tmp:=calc(op1, op2, oper);
                                str(op1:5:3, t1);
                                str(op2:5:3, t2);
                                str(tmp:5:3, t3);
                //vypis
                case oper of
                      '+': begin
                                ts:=ts+'Sucet cisel '+t1+ ' a ' +t2 + ' je: '+ t3;
                                writeln(ts);
                                writeln(f, ts);
                                writeln('Sucet cisel ', op1:5:3, ' a ', op2:5:3, ' je: ', tmp:5:3);
                           end;
                      '-': begin
                                ts:=ts+'Rozdiel cisel ' +t1+ ' a ' +t2 + ' je: '+ t3;
                                writeln(f, ts);
                                writeln('Rozdiel cisel ', op1:5:3, ' a ', op2:5:3, ' je ', tmp:5:3);
                           end;
                      '*': begin
                                ts:=ts+'Sucin cisel ' +t1+ ' a ' +t2 + ' je: '+ t3;
                                writeln(f, ts);
                                writeln('Sucin cisel ', op1:5:3, ' a ', op2:5:3, 'je ', tmp:5:3);
                           end;
                      '/': begin
                                ts:=ts+'Podiel cisel ' +t1+ ' a ' +t2 + ' je: '+ t3;
                                writeln(f, ts);
                                writeln('Podiel cisel ', op1:5:3, ' a ', op2:5:3, ' je ', tmp:5:3);
                           end;
                      '^': begin
                                ts:=ts+'Mocnina cisla ' +t1+ ' a ' +t2 + ' je: '+ t3;
                                writeln(f, ts);
                                writeln('Mocnina cisla ', op1:5:3, ' na ', op2:5:0, ' je ', tmp:5:3);
                           end;
                      '~': begin
                                ts:=ts+'Odmocnina cisla '+ t1 + 'je ' + t3;
                                writeln(f, ts);
                                writeln('Odmocnina cisla ', op1:5:3, 'je ', tmp:5:3);
                           end;
                end;

                writeln('Would you like to exit? press delete if yes');

                c:=readkey;
                if c=#27 then
                begin
                        writeln('Do you want to leave application?[Y/N]');
                        choice:=upcase(readkey);
                        if choice='Y' then
                        begin   repeat
                                        clrscr;
                                        writeln('Please enter your name> ');
                                        readln(meno);
                                until nameGame(meno)=true;
                                writeln(f, meno);
                        end;
                end
                else begin writeln('ord: ', c); end;
        until choice='Y';
        close(f);
        writeln('press any key to exit...');
        repeat until keypressed;
end.
