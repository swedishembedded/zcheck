virtual patch

@depends on patch@
type T;
@@
- typedef struct
+ T
{...}
- T
;

@depends on patch@
type T1;
type T;
@@
- typedef T1
+ T1
{...}
- T
;

