// k_mutex_lock with no_wait as timeout is generally incorrect outside of system work queue tasks
virtual patch
virtual report

@r@
position p;
@@
k_mutex_lock@p(...,K_NO_WAIT)

@replace depends on patch@
position p;
@@
k_mutex_lock@p(...,
- K_NO_WAIT
+ K_MSEC(USE_KCONFIG_VARIABLE_HERE)
,...)

@script:python depends on report@
p << r.p;
@@
msg = "k_mutex_lock with K_NO_WAIT found"
coccilib.report.print_report(p[0], msg)
