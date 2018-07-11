{$N+,E+}

PROGRAM Evaluate (INPUT,OUTPUT);

{ EVALUATE - Copyright 1992 Christopher Johnson.
           This program, both executable and source, may NOT be copied in any
           form, except for a SINGLE back-up copy.

Evalute is a command line maths program and may be used by entering the
sum to work out at the dos prompt.

e.g. To find out 2 + 3 + û8 / 45,
     then enter at the DOS prompt: EVALUATE 2 + 3 + sqroot 8 / 45
     The answer will be printed out below.

Commands supported:
         sin cos tan sinh cosh tanh cot coth
         arcsin arccos arctan arcsinh arccosh arctanh arccot arccoth
         sec csc sech csch
         arcsec arccsc arcsech arccsch
         sqroot square raise
         log ln exp 10x
         pi

PLEASE NOTE that this program does NOT follow BODMAS.
}



USES crt;

VAR s,t,u,w,x,y,z : real;
    c,i,pp,code,np,st,nd : integer;
    px,rp,uc : string;
    col : byte;

PROCEDURE upperit(rp:string);
     begin
       for c:=1 to length(rp) do rp[c]:=upcase(rp[c]);
       uc:=rp;
     end;

PROCEDURE typeuseage; forward;

PROCEDURE invalparam; forward;

PROCEDURE initializevars;
     begin;
       s:=0;
       t:=0;
       u:=0;
       w:=0;
       x:=0;
       y:=0;
       z:=0;
       c:=0;
       i:=1;
       pp:=0;
       code:=0;
       np:=0;
       st:=0;
       nd:=0;
       px:='';
       rp:='';
       uc:='';
       col:=7;
     end;

PROCEDURE squareroot (pp : integer; st : integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=sqrt(t);
       nd:=st+1;
     end;

PROCEDURE square (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=t*t;
       nd:=st+1;
     end;

PROCEDURE sine (pp : integer; st : integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=sin(t/(180/Pi));
       nd:=st+1;
     end;

PROCEDURE cosine (pp:integer;st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=cos(t/(180/Pi));
       nd:=st+1;
     end;

PROCEDURE tangent (pp:integer;st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=sin(t/(180/Pi))/cos(t/(180/Pi));
       nd:=st+1;
     end;

PROCEDURE cotangent (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=cos(t*(Pi/180))/sin(t*(Pi/180));
       nd:=st+1;
     end;

PROCEDURE hcotangent (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=1/(((exp(t)-exp(-t))/2)/((exp(t)+exp(-t))/2));
       nd:=st+1;
     end;

PROCEDURE harccotangent (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln((t+1)/(t-1))/2;
       nd:=st+1;
     end;

PROCEDURE arccotangent (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=(arctan(1/t))*(180/Pi);
       nd:=st+1;
     end;

PROCEDURE arcsine (pp:integer;st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=(arctan(t/sqrt(-t*t+1)))*(180/pi);
       nd:=st+1;
     end;

PROCEDURE arccosine (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=(-arctan(t/sqrt(-t*t+1))+Pi/2)*(180/Pi);
       nd:=st+1;
     end;

PROCEDURE arctangent (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=(arctan(t))*(180/Pi);
       nd:=st+1;
     end;

PROCEDURE hsine (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=(exp(t)-exp(-t))/2;
       nd:=st+1;
     end;

PROCEDURE hcosine (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=(exp(t)+exp(-t))/2;
       nd:=st+1;
     end;

PROCEDURE htangent (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=((exp(t)-exp(-t))/2)/((exp(t)+exp(-t))/2);
       nd:=st+1;
     end;

PROCEDURE harctangent (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln((1+t)/(1-t))/2;
       nd:=st+1;
     end;

PROCEDURE harcsine (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln(t+sqrt(t*t+1));
       nd:=st+1;
     end;

PROCEDURE harccosine (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln(t+sqrt(t*t-1));
       nd:=st+1;
     end;

PROCEDURE secant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=1/cos(t*(pi/180));
       nd:=st+1;
     end;

PROCEDURE hsecant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=1/((exp(t)+exp(-t))/2);
       nd:=st+1;
     end;

PROCEDURE arcsecant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=(-arctan((1/t)/sqrt(-(1/t)*(1/t)+1))+Pi/2)*(180/Pi);
       nd:=st+1;
     end;

PROCEDURE harcsecant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln((sqrt(-t*t+1)+1)/t);
       nd:=st+1;
     end;

PROCEDURE cosecant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=1/sin(t*(Pi/180));
       nd:=st+1;
     end;

PROCEDURE hcosecant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=1/((exp(t)-exp(-t))/2);
       nd:=st+1;
     end;

PROCEDURE arccosecant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=arctan((1/t)/sqrt(-(1/t)*(1/t)+1))*(180/Pi);
       nd:=st+1;
     end;
PROCEDURE harccosecant (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln((1/t)+sqrt((1/t)*(1/t)+1));
       nd:=st+1;
     end;

PROCEDURE log (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln(t)/ln(10);
       nd:=st+1;
     end;

PROCEDURE logn (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=ln(t);
       nd:=st+1;
     end;

PROCEDURE tentothex (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=exp(t*ln(10));
       nd:=st+1;
     end;

PROCEDURE expnt (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       s:=exp(t);
       nd:=st+1;
     end;

PROCEDURE raiseit (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
       else
         begin
           val(rp,t,code);
           if code<>0 then invalparam;
         end;
       rp:=paramstr(pp+3+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then u:=pi
       else
         begin
           val(rp,u,code);
           if code<>0 then invalparam;
         end;
       s:=exp(u*ln(t));
       nd:=st+2;
     end;

PROCEDURE rootit (pp,st:integer);
     begin
       rp:=paramstr(pp+2+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then t:=pi
         else
           begin
             val(rp,t,code);
             if code<>0 then invalparam;
           end;
       rp:=paramstr(pp+3+st);
       upperit(rp);
       rp:=uc;
       if rp='PI' then u:=pi
         else
           begin
             val(rp,u,code);
             if code<>0 then invalparam;
           end;
       s:=exp((1/t)*ln(u));
       nd:=st+2;
     end;

PROCEDURE add (pp : integer; z : real);
     begin
     rp:=paramstr(pp+1+st);
     upperit(rp);
     rp:=uc;
       if rp='SQROOT' then
         begin
           squareroot(pp,st);
           x:=s;
         end
       else
       if rp='SQUARE' then
         begin
           square(pp,st);
           x:=s;
         end
       else
       if rp='SIN' then
         begin
           sine(pp,st);
           x:=s;
         end
       else
       if rp='COS' then
         begin
           cosine(pp,st);
           x:=s;
         end
       else
       if rp='TAN' then
         begin
           tangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSIN' then
         begin
           arcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOS' then
         begin
           arccosine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTAN' then
         begin
           arctangent(pp,st);
           x:=s;
         end
       else
       if rp='SINH' then
         begin
           hsine(pp,st);
           x:=s;
         end
       else
       if rp='COSH' then
         begin
           hcosine(pp,st);
           x:=s;
         end
       else
       if rp='TANH' then
         begin
           htangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSINH' then
         begin
           harcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTANH' then
         begin
           harctangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOSH' then
         begin
           harccosine(pp,st);
           x:=s;
         end
       else
       if rp='COT' then
         begin
           cotangent(pp,st);
           x:=s;
         end
       else
       if rp='COTH' then
         begin
           hcotangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOT' then
         begin
           arccotangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOTH' then
         begin
           harccotangent(pp,st);
           x:=s;
         end
       else
       if rp='SEC' then
         begin
           secant(pp,st);
           x:=s;
         end
       else
       if rp='SECH' then
         begin
           hsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSEC' then
         begin
           arcsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSECH' then
         begin
           harcsecant(pp,st);
           x:=s;
         end
       else
       if rp='CSC' then
         begin
           cosecant(pp,st);
           x:=s;
         end
       else
       if rp='CSCH' then
         begin
           hcosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSC' then
         begin
           arccosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSCH' then
         begin
           harccosecant(pp,st);
           x:=s;
         end
       else
       if rp='LOG' then
         begin
           log(pp,st);
           x:=s;
         end
       else
       if rp='LN' then
         begin
           logn(pp,st);
           x:=s;
         end
       else
       if rp='EXP' then
         begin
           expnt(pp,st);
           x:=s;
         end
       else
       if rp='10X' then
         begin
           tentothex(pp,st);
           x:=s;
         end
       else
       if rp='RAISE' then
         begin
           raiseit(pp,st);
           x:=s;
         end
       else
       if rp='XTHROOT' then
         begin
           rootit(pp,st);
           x:=s;
         end
       else
       if rp='PI' then x:=pi
       else
         begin
           st:=nd;
           val(rp,x,code);
           if code<>0 then invalparam;
         end;
       y:=z+x;
     end;

PROCEDURE subtract (pp : integer; z : real);
     begin
     rp:=paramstr(pp+1+st);
     upperit(rp);
     rp:=uc;
       if rp='SQROOT' then
         begin
           squareroot(pp,st);
           x:=s;
         end
       else
       if rp='SQUARE' then
         begin
           square(pp,st);
           x:=s;
         end
       else
       if rp='SIN' then
         begin
           sine(pp,st);
           x:=s;
         end
       else
       if rp='COS' then
         begin
           cosine(pp,st);
           x:=s;
         end
       else
       if rp='TAN' then
         begin
           tangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSIN' then
         begin
           arcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOS' then
         begin
           arccosine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTAN' then
         begin
           arctangent(pp,st);
           x:=s;
         end
       else
       if rp='SINH' then
         begin
           hsine(pp,st);
           x:=s;
         end
       else
       if rp='COSH' then
         begin
           hcosine(pp,st);
           x:=s;
         end
       else
       if rp='TANH' then
         begin
           htangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSINH' then
         begin
           harcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTANH' then
         begin
           harctangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOSH' then
         begin
           harccosine(pp,st);
           x:=s;
         end
       else
       if rp='COT' then
         begin
           cotangent(pp,st);
           x:=s;
         end
       else
       if rp='COTH' then
         begin
           hcotangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOT' then
         begin
           arccotangent(pp,st);
           x:=s;
         end
       else
       if rp='SEC' then
         begin
           secant(pp,st);
           x:=s;
         end
       else
       if rp='SECH' then
         begin
           hsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSEC' then
         begin
           arcsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSECH' then
         begin
           harcsecant(pp,st);
           x:=s;
         end
       else
       if rp='CSC' then
         begin
           cosecant(pp,st);
           x:=s;
         end
       else
       if rp='CSCH' then
         begin
           hcosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSC' then
         begin
           arccosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSCH' then
         begin
           harccosecant(pp,st);
           x:=s;
         end
       else
       if rp='LOG' then
         begin
           log(pp,st);
           x:=s;
         end
       else
       if rp='LN' then
         begin
           logn(pp,st);
           x:=s;
         end
       else
       if rp='EXP' then
         begin
           expnt(pp,st);
           x:=s;
         end
       else
       if rp='10X' then
         begin
           tentothex(pp,st);
           x:=s;
         end
       else
       if rp='RAISE' then
         begin
           raiseit(pp,st);
           x:=s;
         end
       else
       if rp='XTHROOT' then
         begin
           rootit(pp,st);
           x:=s;
         end
       else
       if rp='PI' then x:=pi
       else
         begin
           st:=nd;
           val(rp,x,code);
           if code<>0 then invalparam;
         end;
       y:=z-x;
     end;

PROCEDURE multiply (pp : integer; z : real);
     begin
     rp:=paramstr(pp+1+st);
     upperit(rp);
     rp:=uc;
       if rp='SQROOT' then
         begin
           squareroot(pp,st);
           x:=s;
         end
       else
       if rp='SQUARE' then
         begin
           square(pp,st);
           x:=s;
         end
       else
       if rp='SIN' then
         begin
           sine(pp,st);
           x:=s;
         end
       else
       if rp='COS' then
         begin
           cosine(pp,st);
           x:=s;
         end
       else
       if rp='TAN' then
         begin
           tangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSIN' then
         begin
           arcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOS' then
         begin
           arccosine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTAN' then
         begin
           arctangent(pp,st);
           x:=s;
         end
       else
       if rp='SINH' then
         begin
           hsine(pp,st);
           x:=s;
         end
       else
       if rp='COSH' then
         begin
           hcosine(pp,st);
           x:=s;
         end
       else
       if rp='TANH' then
         begin
           htangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSINH' then
         begin
           harcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTANH' then
         begin
           harctangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOSH' then
         begin
           harccosine(pp,st);
           x:=s;
         end
       else
       if rp='COT' then
         begin
           cotangent(pp,st);
           x:=s;
         end
       else
       if rp='COTH' then
         begin
           hcotangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOT' then
         begin
           arccotangent(pp,st);
           x:=s;
         end
       else
       if rp='SEC' then
         begin
           secant(pp,st);
           x:=s;
         end
       else
       if rp='SECH' then
         begin
           hsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSEC' then
         begin
           arcsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSECH' then
         begin
           harcsecant(pp,st);
           x:=s;
         end
       else
       if rp='CSC' then
         begin
           cosecant(pp,st);
           x:=s;
         end
       else
       if rp='CSCH' then
         begin
           hcosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSC' then
         begin
           arccosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSCH' then
         begin
           harccosecant(pp,st);
           x:=s;
         end
       else
       if rp='LOG' then
         begin
           log(pp,st);
           x:=s;
         end
       else
       if rp='LN' then
         begin
           logn(pp,st);
           x:=s;
         end
       else
       if rp='EXP' then
         begin
           expnt(pp,st);
           x:=s;
         end
       else
       if rp='10X' then
         begin
           tentothex(pp,st);
           x:=s;
         end
       else
       if rp='RAISE' then
         begin
           raiseit(pp,st);
           x:=s;
         end
       else
       if rp='XTHROOT' then
         begin
           rootit(pp,st);
           x:=s;
         end
       else
       if rp='PI' then x:=pi
       else
         begin
           st:=nd;
           val(rp,x,code);
           if code<>0 then invalparam;
         end;
       y:=z*x;
     end;

PROCEDURE divide (pp : integer; z : real);
     begin
     rp:=paramstr(pp+1+st);
     upperit(rp);
     rp:=uc;
       if rp='SQROOT' then
         begin
           squareroot(pp,st);
           x:=s;
         end
       else
       if rp='SQUARE' then
         begin
           square(pp,st);
           x:=s;
         end
       else
       if rp='SIN' then
         begin
           sine(pp,st);
           x:=s;
         end
       else
       if rp='COS' then
         begin
           cosine(pp,st);
           x:=s;
         end
       else
       if rp='TAN' then
         begin
           tangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSIN' then
         begin
           arcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOS' then
         begin
           arccosine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTAN' then
         begin
           arctangent(pp,st);
           x:=s;
         end
       else
       if rp='SINH' then
         begin
           hsine(pp,st);
           x:=s;
         end
       else
       if rp='COSH' then
         begin
           hcosine(pp,st);
           x:=s;
         end
       else
       if rp='TANH' then
         begin
           htangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCSINH' then
         begin
           harcsine(pp,st);
           x:=s;
         end
       else
       if rp='ARCTANH' then
         begin
           harctangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOSH' then
         begin
           harccosine(pp,st);
           x:=s;
         end
       else
       if rp='COT' then
         begin
           cotangent(pp,st);
           x:=s;
         end
       else
       if rp='COTH' then
         begin
           hcotangent(pp,st);
           x:=s;
         end
       else
       if rp='ARCCOT' then
         begin
           arccotangent(pp,st);
           x:=s;
         end
       else
       if rp='SEC' then
         begin
           secant(pp,st);
           x:=s;
         end
       else
       if rp='SECH' then
         begin
           hsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSEC' then
         begin
           arcsecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCSECH' then
         begin
           harcsecant(pp,st);
           x:=s;
         end
       else
       if rp='CSC' then
         begin
           cosecant(pp,st);
           x:=s;
         end
       else
       if rp='CSCH' then
         begin
           hcosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSC' then
         begin
           arccosecant(pp,st);
           x:=s;
         end
       else
       if rp='ARCCSCH' then
         begin
           harccosecant(pp,st);
           x:=s;
         end
       else
       if rp='LOG' then
         begin
           log(pp,st);
           x:=s;
         end
       else
       if rp='LN' then
         begin
           logn(pp,st);
           x:=s;
         end
       else
       if rp='EXP' then
         begin
           expnt(pp,st);
           x:=s;
         end
       else
       if rp='10X' then
         begin
           tentothex(pp,st);
           x:=s;
         end
       else
       if rp='RAISE' then
         begin
           raiseit(pp,st);
           x:=s;
         end
       else
       if rp='XTHROOT' then
         begin
           rootit(pp,st);
           x:=s;
         end
       else
       if rp='PI' then x:=pi
       else
         begin
           st:=nd;
           val(rp,x,code);
           if code<>0 then invalparam;
         end;
       y:=z/x;
     end;

PROCEDURE typeuseage;
     begin
       clrscr;
       textcolor(col);
       writeln ('EVALUATE : Copyright 1992 C. Johnson');
       writeln ('====================================');
       writeln ('');
       writeln ('Invalid parameter(s)');
       writeln ('Use as follows:');
       writeln ('');
       writeln ('EVALUATE number operator [function] number [operator [function] number ...]');
       writeln ('');
       writeln ('Operator is either + - * /');
       writeln ('Number is any number. PI is also a number.');
       writeln ('Functions are:');
       writeln ('  sin cos tan sinh cosh tanh cot coth');
       writeln ('  arcsin arccos arctan arcsinh arccosh arctanh arccot arccoth');
       writeln ('  sec csc sech csch');
       writeln ('  arcsec arccsc arcsech arccsch');
       writeln ('  sqroot square raise xthroot');
       writeln ('  log ln exp 10x');
       writeln ('');
       writeln ('PRESS A KEY TO CONTINUE');
       repeat
       { pause loop }
       until keypressed;
       clrscr;
       textcolor(col);
       writeln ('EVALUATE : Copyright 1992 C. Johnson');
       writeln ('====================================');
       writeln ('');
       writeln ('A space must be left between each number, function and operator');
       writeln ('i.e.:- ');
       writeln ('EVALUATE 3 + 4 + 9 + 56.67 * 45     will work, but:-');
       writeln ('EVALUATE 3+4+9+56.67*45    will NOT work.');
       writeln ('');
       writeln ('If a parameter is entered as: " +6 " as oppose to: " + 6 "  and');
       writeln ('it occurs at the end of the sum, then IT WILL BE IGNORED!');
       writeln ('e.g.:-');
       writeln ('EVALUATE 3 + 4 + 9 + 56.67 *45');
       writeln ('The above sum will ignore the last operator and number in');
       writeln ('the sum as they are not separated by a space. So instead');
       writeln ('of getting an answer of 3270.15 an answer of 72.67 will be');
       writeln ('obtained.');
       writeln ('');
       writeln ('N.B. This does not follow BODMAS');
       writeln ('');
       writeln ('');
       writeln ('This program may not be copied in any way, including both the');
       writeln ('source code and the executable form, except for a SINGLE BACK-UP');
       writeln ('copy, without the prior consent of the programmer.');
       writeln ('');
       writeln ('EVALUATE.EXE & EVALUATE.PAS, Copyright 1992, Christopher Johnson.');
       writeln ('');
       normvideo;
       halt(1);
     end;

PROCEDURE invalparam;
     begin
       writeln ('Invalid parameter(s)');
       halt(1);
     end;

PROCEDURE haltanswer;
     begin
       writeln ('Evaluated answer: ',z:15:30);
       halt(0);
     end;

BEGIN
     initializevars;
     if paramcount=0 then
       begin
         writeln ('Invalid parameter(s)');
         halt(1);
       end;
     if paramstr(1)='/?' then typeuseage;
     if paramstr(1)='-?' then typeuseage;
     np:=paramcount-1;
     if (np+1)<3 then invalparam;
     np:=np div 2;
     rp:=paramstr(1);
     upperit(rp);
     rp:=uc;
     if rp='PI' then z:=pi
     else
       begin
         val(paramstr(1),z,code);
         if code<>0 then invalparam;
       end;
     while paramstr((i*2)+st)<>'' do
       begin
            px:=paramstr((i*2)+st);
            pp:=i*2;
            if px='+' then add(pp,z)
               else if px='-' then subtract(pp,z)
                else if px='*' then multiply(pp,z)
                  else if px='/' then divide(pp,z)
                    else invalparam;
            st:=nd;
            z:=y;
            i:=i+1;
            if i>np  then haltanswer;
       end;
     writeln ('Evaluated answer: ',z:15:30)
END.
