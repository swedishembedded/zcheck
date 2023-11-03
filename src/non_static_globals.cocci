virtual report
virtual patch

@match@
identifier I;
expression E;
type T;
@@
(
T I;
|
T I = E;
)

@rs disable optional_qualifier@
identifier match.I;
type match.T;
expression E;
@@
(
static T I;
|
static T I = E;
)

@fn depends on !rs@
identifier match.I;
identifier f;
type match.T;
@@
f(...){
<+...
T I;
...+>
}

@r depends on !rs && !fn@
identifier match.I;
type T;
position p;
@@
+ static
T I@p;

@script:python depends on report@
p << r.p;
v << match.I;
@@
msg = "Non-static global variable '%s' found" % (v)
#coccilib.report.print_report(p[0], msg)
