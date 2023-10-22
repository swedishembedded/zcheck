virtual report

@r1 exists@
identifier fn;
position p;
constant int R != 0;
@@
int fn@p(...){
...
(
return R;
|
return -R;
)
...
}

@script:python@
p << r1.p;
I << r1.R;
fn << r1.fn;
@@
coccilib.report.print_report(p[0], "Function '%s' returning a constant: %s" % (fn, I))

@r exists@
identifier fn;
position p;
identifier R !~ "^E.*";
@@
int fn@p(...){
...
(
return R;
|
return -R;
)
...
}

@script:python@
p << r.p;
I << r.R;
fn << r.fn;
@@
coccilib.report.print_report(p[0], "Function '%s' returning an identifier: %s" % (fn, I))


