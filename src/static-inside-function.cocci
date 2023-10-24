virtual report

@r@
identifier I, fn;
expression E;
type T !~ ".*struct.*";
@@
fn(...){
<+...
(
- static T I;
|
- static T I = E;
)
...+>
}

