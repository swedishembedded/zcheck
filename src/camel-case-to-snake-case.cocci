virtual patch

@initialize:python@
@@
import re
import os

// Python function to convert camelCase to snake_case
def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()

/////////////////////
// One level
/////////////////////
@ match @
identifier I;
type T;
@@
struct {
...
T I;
...
}

@ script:python p@
I << match.I;
N;
@@
coccinelle.N = camel_to_snake(I)

@@
identifier match.I;
type match.T;
identifier p.N;
@@
struct {
...
- T I;
+ T N;
...
}

/////////////////////
// Two levels
/////////////////////
@ match2 exists @
identifier I;
identifier I2;
type T;
@@
struct {
...
	struct {
	...
	T I;
	...
	} I2;
...
}

@ script:python p2@
I << match2.I;
N;
@@
coccinelle.N = camel_to_snake(I)


@@
identifier match2.I;
type match2.T;
identifier p2.N;
@@
struct {
...
- T I;
+ T N;
...
}

/////////////////////
// Three levels
/////////////////////
@ match3 exists @
identifier I;
identifier I2;
identifier I3;
type T;
@@
struct {
...
	struct {
	...
		struct {
		...
		T I;
		...
		} I3;
	...
	} I2;
...
}

@ script:python p3@
I << match3.I;
N;
@@
coccinelle.N = camel_to_snake(I)


@@
identifier match3.I;
type match3.T;
identifier p3.N;
@@
struct {
...
- T I;
+ T N;
...
}


