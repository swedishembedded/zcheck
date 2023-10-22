virtual report

@ass@
global idexpression I;
identifier C;
@@
I = C;

@r@
global idexpression gv != ass.I;
expression E;
parameter P;
position p;
@@
gv@p = E;

@script:python depends on !r@
p << r.p;
gv << r.gv;
@@
coccilib.report.print_report(p[0], "Global variable '%s' is assigned in local scope. This leaks local state." % (gv))

@r_enum@
identifier I;
identifier C;
position p;
@@
enum I@p {
...,
C,
...
};

@script:python@
p << r_enum.p;
C << r_enum.C;
@@
coccilib.report.print_report(p[0], "Enum value '%s'" % (C))

@display@
int i;
@@
 return
*       -i
 ;

@r2@
global idexpression gv != r_enum.C;
identifier E;
position p;
@@
E = gv@p;

@script:python@
p << r2.p;
gv << r2.gv;
@@
coccilib.report.print_report(p[0], "Value of global variable '%s' is used in local scope. This makes the function non-reentrant." % (gv))


