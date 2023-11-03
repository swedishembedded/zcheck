// Passing a struct param to a function by value is almost always a mistake
virtual report
virtual patch

@r@
identifier I;
identifier fn;
position p;
type T =~ "struct[^*]*$";
@@
fn(...,
+ const
T
- I@p
+ *I
,...) {...}

@script:python depends on report@
fn << r.fn;
t << r.T;
i << r.I;
p << r.p;
@@
msg = "'%s' parameter '%s' to function '%s' passed by value" % (t, i, fn)
coccilib.report.print_report(p[0], msg)
