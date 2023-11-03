virtual patch
virtual report

@initialize:python@
@@
import re
import os

@is_static exists@
identifier fn;
type T1;
position p;
@@
static T1 fn@p(...) {...}

@rule1_base@
identifier fn;
identifier v;
type T, T1;
position p != is_static.p;
position p1;
@@
T1 fn@p(T@p1 v, ...) {...}

@ script:python rename @
p << rule1_base.p;
f << rule1_base.fn;
T << rule1_base.T;
O;
N;
@@

file = os.path.splitext(os.path.basename(p[0].file))[0];
file = re.sub(r"-.*", "", file)
if not re.match(r"^%s.*" % (file), f):
	cocci.include_match(True)
	coccinelle.N = file+"_"+f
	coccinelle.O = f;
else:
	cocci.include_match(False)

@@
identifier rename.O;
identifier rename.N;
parameter list P;
type T;
@@
- T O(P)
+ T N(P)
{...}

@ script:python depends on report @
O << rename.O;
N << rename.N;
p << rule1_base.p;
@@
coccilib.report.print_report(p[0], "change '%s' to '%s'" % (O, N))

