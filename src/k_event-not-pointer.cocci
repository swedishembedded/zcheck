// Storing a pointer to a k_event is almost always wrong
virtual patch
virtual report

@r@
identifier I;
position p;
@@
- struct k_event *I@p;
+ struct k_event I;

@call@
identifier r.I;
identifier fn;
@@
fn(...,
- I
+ &I
,...)

@script:python depends on r && report@
i << r.I;
p << r.p;
@@
msg = "k_event %s declared as pointer" % (i)
coccilib.report.print_report(p[0], msg)
