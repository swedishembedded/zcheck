virtual report
virtual patch

@correct exists@
position p;
constant R =~ "^E[A-Z]+";
@@
return@p -R;

@r2 exists@
position p != correct.p;
expression E != 0;
@@
* return@p E;

@script:python depends on report@
p << r2.p;
I << r2.E;
@@
coccilib.report.print_report(p[0], "returning a constant: %s" % (I))


@r1 exists@
position p != {r2.p, correct.p};
constant int R != 0;
@@
* return@p R;

@script:python depends on report@
p << r1.p;
I << r1.R;
@@
coccilib.report.print_report(p[0], "returning a constant: %s" % (I))


