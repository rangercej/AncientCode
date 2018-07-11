program Turtle_Graphics (INPUT,OUTPUT);

uses Graph3,Crt,Graph;
var angle : integer;

procedure fd (distance : integer);
  begin
    setheading (north);
    angle:=0;
    forwd (distance);
  end;

procedure bk (distance : integer);
  begin
    setheading (south);
    angle:=180;
    forwd (distance);
  end;

procedure lf (distance : integer);
  begin
    setheading (west);
    angle:=270;
    forwd (distance);
  end;

procedure rh (distance : integer);
  begin
    setheading (east);
    angle:=90;
    forwd (distance);
  end;

procedure turn (distance : integer);
  begin
    angle:=angle + distance;
    setheading (angle);
  end;

procedure gotoangle (distance : integer);
  begin
    angle:=distance;
    setheading (angle);
  end;

procedure toplh;
  begin
    hideturtle;
    penup;
    home;
    fd (85);
    lf (155);
    showturtle;
    pendown;
    setheading (115);
  end;

{
procedure doprogram;
}

procedure command;
  procedure erasecommline;
    begin
      gotoxy (1,24);
      writeln ('                                                               ');
      gotoxy (1,24);
    end;

  function caps(text : string):string;
    var i : integer;
    begin
      for i:=1 to length(text) do
        text[i]:=upcase(text[i]);
      caps:=text;
    end;

  label Loop1;
  var kommand : string[10];
      komm    : string[4];
      parm    : string[6];
      x       : char;
      vparm   : integer;
      err     : integer;
  begin
  Loop1:
    gotoxy (1,24);
    write ('Enter command: ');
    readln (kommand);
    kommand:=caps(kommand);
    komm := copy(kommand,1,pos(' ',kommand)-1);
    parm := copy(kommand,pos(' ',kommand)+1,length(kommand));
    if komm='' then
      begin
        komm:=kommand;
        parm:='';
      end;
    if parm<>'' then
      begin
        val(parm,vparm,err);
        if err<>0 then
          begin
            erasecommline;
            writeln ('Invalid command . . . Hit a key to continue');
            sound (300);
            delay (40);
            nosound;
            repeat until keypressed;
            x:=readkey;
            goto Loop1;
          end;
      end;
    if komm='UP' then fd (vparm)
    else if komm='DN' then bk (vparm)
    else if komm='LF' then lf (vparm)
    else if komm='RG' then rh (vparm)
    else if komm='FD' then forwd (vparm)
    else if komm='BK' then back (vparm)
    else if komm='N' then fd (vparm)
    else if komm='E' then rh (vparm)
    else if komm='S' then bk (vparm)
    else if komm='W' then lf (vparm)
    else if komm='PU' then penup
    else if komm='PD' then pendown
    else if komm='SHOW' then showturtle
    else if komm='HIDE' then hideturtle
    else if komm='TN' then turn (vparm)
    else if komm='AN' then gotoangle (vparm)
    else if komm='COL' then setpencolor (vparm)
    else if komm='CLS' then clearscreen
    else if komm='PAL0' then palette (0)
    else if komm='PAL1' then palette (1)
    else if komm='PAL2' then palette (2)
    else if komm='PAL3' then palette (3)
    else if komm='HOME' then home
    else if komm='TOP' then toplh
    else if komm='QUIT' then
                          begin
                            clearscreen;
                            halt(0);
                          end
    else begin
           erasecommline;
           writeln ('Invalid command ... Hit a key to cancel');
           sound (300);
           delay (40);
           nosound;
           repeat until keypressed;
           x:=readkey;
         end;
    erasecommline;
    goto Loop1;
  end;

begin
  GraphColorMode;
  HiResColor (0);
  Showturtle;
  Wrap;
  Turtlewindow (0,0,3000,325);
  Home;
  Setheading (north);
  angle:=0;
  command;
end.
