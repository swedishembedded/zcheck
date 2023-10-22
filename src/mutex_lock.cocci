virtual report
virtual patch

@ r exists @
expression l;
identifier r, e;
position p;
@@
r = k_mutex_lock(l, ...)
... when any
if(r){ ... }
... when != e = r
	when any
if(e){
... when any
	when != k_mutex_unlock(l)
	return@p ...;
}
... when != k_mutex_unlock(l)
k_mutex_unlock(l);


@ script:python depends on r@
p << r.p;
@@

// This Python script runs if a locked mutex is not unlocked in all code paths.
msg = "Mutex unlock missing"
coccilib.report.print_report(p[0], msg)
