virtual report

@rs@
identifier I;
type T;
@@
static T I;

@r@
identifier I2 != rs.I;
type T;
position p;
@@
T I2@p;

@script:python@
p << r.p;
@@
msg = "Non-static global variable found"
coccilib.report.print_report(p[0], msg)
