virtual report

@r@
identifier fn;
position p;
identifier gv;
expression E;
@@
fn@p(...){
<... when any
(
gv = E
|
E = gv
)
...>
}

@script:python depends on r@
p << r.p;
fn << r.fn;
@@
coccilib.report.print_report(p[0], "Non pure function %s" % (fn))
