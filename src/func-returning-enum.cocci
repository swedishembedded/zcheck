virtual report
virtual patch

@r@
identifier fn;
type T =~ "^enum.*";
position p;
parameter list P;
@@
- T fn@p(P)
+ int fn(T *_rename_me, P)
{...}

@var depends on r@
type r.T;
identifier I;
identifier r.fn;
@@
fn(...){
...
T I;
... when any
- return I;
+ *_rename_me = I;
+ return 0;
...
}

@script:python depends on report@
fn << r.fn;
t << r.T;
p << r.p;
@@
msg = "function '%s' returning '%s'" % (fn, t)
coccilib.report.print_report(p[0], msg)
