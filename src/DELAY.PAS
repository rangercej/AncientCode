uses crt;
var err, dly : integer;
begin
  if paramcount=0 then
    begin
      writeln ('Invalid parameter.');
      writeln;
      halt(1);
    end;

  val (paramstr(1),dly,err);
  if err<>0 then
    begin
      writeln ('Invalid parameter.');
      writeln;
      halt(1);
    end;

  delay (dly);
end.