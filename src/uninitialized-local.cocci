virtual report

@@
identifier I, fn;
expression E;
type T;
@@
fn(...){
<+...
- T *I;
+ T *I = NULL;
...+>
}

@@
identifier I, fn;
expression E;
type T =~ ".*struct.*";
@@
fn(...){
<+...
- T I;
+ T I = {0};
...+>
}

@@
identifier I, fn;
type T = {float, double};
@@
fn(...){
<+...
- T I;
+ T I = 0.0;
...+>
}

@@
identifier I, fn;
type T;
@@
fn(...){
<+...
- T I;
+ T I = 0;
...+>
}
