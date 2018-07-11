{$M 8192,0,0 }
uses dos;

label change;

var drv : string;

procedure error;
  begin
    writeln ('Invalid parameter');
    halt(1);
  end;

begin
  if paramcount=0 then error;
  drv:=copy(paramstr(1),1,2);
  if copy(drv,2,1)<>':' then goto change;
  drv:='/C '+drv;
  swapvectors;
  exec(getenv('COMSPEC'),drv);
  swapvectors;
change:
  {$I-}
  chdir(paramstr(1));
  if IOResult<>0 then writeln ('Error changing to ',paramstr(1));
  {$I+}
end.
