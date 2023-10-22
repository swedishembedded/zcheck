virtual report

@r@
identifier fn;
type T;
identifier I !~ "self";
global idexpression v;
expression E;
position p;
@@
fn@p(T I, ...) {
<+...
v = E;
...+>
}

@script:python@
fn << r.fn;
p << r.p;
v << r.v;
T << r.T;
@@
msg = "function '%s' modifies global state '%s'" %(fn,v)
msg += ". Should take 'self' object as first parameter."
coccilib.report.print_report(p[0], msg)
