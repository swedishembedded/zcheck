virtual report
virtual patch

@r@
identifier I;
type T;
position p;
@@
... when any
- extern
T I@p;

@script:python depends on report@
p << r.p;
I << r.I;
@@
msg = "Extern declaration '%s' found" % (I)
coccilib.report.print_report(p[0], msg)
