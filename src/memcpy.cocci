// Check that size is always of first parameter type and not of the second
virtual patch
virtual report

@match exists@
identifier A, B;
position p;
@@
(
memcpy@p(A, B, sizeof(*B))
|
memcpy@p(&A, &B, sizeof(&B))
|
memcpy@p(&A, &B, sizeof(B))
)

@script:python depends on match && report@
p << match.p;
A << match.A;
B << match.B;
@@
coccilib.report.print_report(p[0], "memcpy size should be of '%s', not '%s'" % (B, A))

@match2@
expression A, B;
position p != {match.p};
@@
(
memcpy@p(A, B, sizeof(B))
|
memcpy@p(A, B, sizeof(*B))
|
memcpy@p(&A, &B, sizeof(&B))
|
memcpy@p(&A, &B, sizeof(B))
)

@script:python depends on report@
p << match2.p;
A << match2.A;
B << match2.B;
@@
coccilib.report.print_report(p[0], "memcpy size expression should be of '%s', not '%s'" % (B, A))

@depends on patch@
identifier A;
identifier E;
@@
- memcpy(A, E, sizeof(*E))
+ memcpy(A, E, sizeof(*A))

@depends on patch@
expression A,B;
@@
- memcpy(&A, &B, sizeof(B))
+ memcpy(&A, &B, sizeof(A))

@depends on patch@
identifier A,B;
@@
- memcpy(&A, &B, sizeof(B))
+ memcpy(&A, &B, sizeof(A))

@depends on patch@
expression A,B;
@@
... when any
- memcpy(&A, &B, sizeof(&B));
+ memcpy(&A, &B, sizeof(A));
