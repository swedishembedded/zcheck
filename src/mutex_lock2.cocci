virtual report
virtual patch

@ r exists @
expression l;
position p;
@@
k_mutex_lock(l, ...)
... when != return;
	when != k_mutex_unlock(l);
+ k_mutex_unlock(l);
return@p ...;

@r2@
identifier R;
expression l;
@@
R = k_mutex_lock(l, ...)
... when = return ...;
if(R){
<+...
- k_mutex_unlock(l);
...+>
	return ...;
}

