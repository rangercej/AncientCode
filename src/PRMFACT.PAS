{$N+,E+}

var n   : real;
    k   : real;
    k0  : real;
    k1  : string;
    err : integer;

label l50,l70,l110,l140,l170;

begin
  if paramcount=0 then
    begin
      writeln;
      write ('Enter a number: ');
      readln (k1);
    end
  else k1:=paramstr(1);

 val(k1,k,err);
 if err<>0 then
   begin
     writeln;
     writeln ('Invalid Number - ',k1);
     writeln ('Syntax:');
     writeln ('PRMFACT [number]');
     halt(1);
   end;

  write (k:0:0,' = ');
  k0:=k;

l50:
  if int(k/2)*2=k then goto l140;
  n:=3;

l70:
  if int(k/n)*n=k then goto l110;
  if n*n>k then goto l170;
  n:=n+2;
  goto l70;

l110:
  write (n:0:0,' * ');
  k:=k/n;
  goto l70;

l140:
  write ('2 * ');
  k:=k/2;
  goto l50;

l170:
  if k=k0 then writeln ('PRIME');
  if (k<k0) and (k>1) then writeln(k:0:0);
end.