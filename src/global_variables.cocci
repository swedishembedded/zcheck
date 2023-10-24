virtual report

@bool@
identifier I = {true, false};
identifier C;
position p;
@@
C = I@p;

@@
global idexpression I;
expression C;
position p != {bool.p};
@@
* I = C@p;

@c@
constant I;
identifier C;
position p;
@@
C = I@p;

@@
global idexpression I;
identifier C;
position p != {c.p, bool.p};
@@
* C = I@p;

