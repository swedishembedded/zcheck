virtual report
virtual patch

@r@
type T;
identifier I;
position p;
@@
T I@p;

@bad@
identifier fn;
type r.T;
identifier r.I;
@@
fn(...){
...
T I;
...
}

@replace depends on !bad && patch@
type r.T;
identifier r.I;
@@
+ #if 0
T I;
+ #endif

@script:python depends on !bad && report@
i << r.I;
p << r.p;
@@
coccilib.report.print_report(p[0], "global variable '%s' found" % (i))
