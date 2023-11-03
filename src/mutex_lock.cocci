virtual report
virtual patch

@ replace depends on patch exists @
identifier R;
expression L;
@@
R = k_mutex_lock(L, ...)
... when != k_mutex_unlock(L)
	when any
if(R) {...}
... when != k_mutex_unlock(L)
	when any
+ k_mutex_unlock(L);
return ...;

@ replace2 depends on patch @
expression L;
@@
k_mutex_lock(L, ...)
... when != k_mutex_unlock(L)
+ k_mutex_unlock(L);
return ...;

@ r exists @
expression L;
identifier R;
position p, pl;
@@
R = k_mutex_lock@pl(L, ...)
... when != k_mutex_unlock(L)
	when any
if(R){ ... }
... when != k_mutex_unlock(L)
	when any
return@p ...;

@ r2 exists @
expression L;
position p != {r.p};
position pl != {r.pl};
@@
k_mutex_lock@pl(L, ...)
... when != k_mutex_unlock(L)
return@p ...;

@ script:python depends on report@
p << r.p;
@@
coccilib.report.print_report(p[0], "Mutex unlock missing")

@ script:python depends on report@
p << r2.p;
@@
coccilib.report.print_report(p[0], "Mutex unlock missing")


