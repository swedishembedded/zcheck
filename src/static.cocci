virtual report

@r@
identifier I;
type T !~ "^(struct|k_)";
position p;
@@
... when any
static T I@p;

@script:python@
p << r.p;
I << r.I;
T << r.T;
@@
msg = "Static variable '%s' '%s' found." % (T, I)
coccilib.report.print_report(p[0], msg)
