virtual report

@r@
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
p << r.p;
I << r.I;
C << r.C;
@@
coccilib.report.print_report(p[0], "Found enum: '%s', constant: '%s'" % (I, C))


