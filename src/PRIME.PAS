{$N+}

uses Crt,printer;

var number    : real;
    limit     : longint;
    i         : longint;
    thenumber : longint;
    err       : integer;
    Step      : integer;
    z         : char;
    kp        : char;
    key       : byte;
    y         : byte;
    outp      : text;
    printit   : boolean;
    found     : boolean;
    Stop      : boolean;

label GetKey,EndOfSearch;

begin
  printit:=false;
  found:=false;
  Stop:=false;
  clrscr;

  if paramcount>0 then
    begin
      val(paramstr(1),number,err);
      if err<>0 then
        begin
          writeln ('Syntax: ');
          writeln ('PRIME [number] [/P]');
          halt(1);
        end;
      if paramcount>1 then
        begin
          if ((paramstr(2)='/P') or (paramstr(2)='/p')) then
            begin
              printit:=true;
              write (lst,chr(13));
            end;
        end;
    end
  else
    begin
      write ('Enter a number: ');
      readln (number);

      write ('Do you wish the results to be printed (Y/N) ? ');

GetKey:
      z:=upcase(readkey);
      if (z<>'Y') and (z<>'N') then goto GetKey;

      key:=ord(z);
      writeln (chr(key));
      writeln;
      if z='Y' then
        begin
          printit:=true;
          write(lst,chr(13));
        end;
    end;

  thenumber:=trunc(number);

  writeln ('Hit [ESC] to quit search');

  write ('Number is: ');
  writeln (thenumber);
  writeln ('Divisors are: ');

  if printit=true then
    begin
      write (lst, 'Number is: ');
      writeln (lst, thenumber);
      writeln (lst, 'Divisors are: ');
    end;

  if (number/2)=(int(number/2)) then step:=0 else step:=1;

  limit:=trunc(int(number/2)+1);
  y:=wherey;
  gotoxy(30,1);
  writeln ('Limit: ',limit);

{ This next section is the loop that finds the divisors }

  for i:=(2+step) to limit do
    begin
      gotoxy (30,1);
      write ('Limit: ',limit);
      gotoxy (60,1);
      if keypressed then
        begin
          KP:=readkey;
          if kp=chr(27) then
            begin
              i:=limit-1;
              Stop:=true;
            end;
        end;
      if Stop=true then goto EndOfSearch;
      write ('Testing: ',i);
      if (number/i)=int(number/i) then
        begin
          gotoxy (1,y);
          writeln ('       ',i);
          y:=wherey;
          if printit=true then
            begin
              write (lst, '       ');
              writeln (lst,i);
            end;
          found:=true;
        end;
EndOfSearch:
      i:=i+1;
      if i>limit then i:=limit-2;
    end;


  if Stop=true then
    begin
      gotoxy (1,y);
      writeln ('Searching stopped by user hitting [ESC]');
      if printit=true then writeln (lst,'Searching stopped by user hitting [ESC]');
      halt(2);
    end;

  if found=true then
    begin
      gotoxy (1,y);
      writeln ('No more divisors');
      if printit=true then writeln (lst,'No more divisors');
    end
  else
    begin
      gotoxy (1,y);
      writeln ('       No divisors except 1 and itself.');
      writeln ('       Number is prime.');
      if printit=true then
        begin
          writeln (lst, '       No divisors except 1 and itself.');
          writeln (lst, '       Number is prime.');
        end;
    end;
end.



