virtual patch

@exists@
identifier I, fn;
type T = {
char, signed char, unsigned char,
short, short int, unsigned short int,
int, unsigned int,
long, long int, unsigned long int,
long long, long long int, unsigned long long int
};
@@
fn(...){
<+...
- T I;
+ T I = 0;
...+>
}

@exists@
identifier I, fn;
type T =~ "^[u]*int[[:digit:]]+_t";
@@
fn(...){
<+...
- T I;
+ T I = 0;
...+>
}

@@
identifier I,fn;
type T = {
bool
};
@@
fn(...){
<+...
- T I;
+ T I = false;
...+>
}

@@
identifier I,fn;
type T = {
float
};
@@
fn(...){
<+...
- T I;
+ T I = 0.0;
...+>
}

@@
identifier I, fn;
type T = {
double, long double
};
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
- T *I;
+ T *I = NULL;
...+>
}

@t@
identifier I;
type T;
position p;
@@
T@p I;

@exists@
identifier I;
type T =~ "^struct.*";
@@
T
- I;
+ I = {0};
... when != memset(&I, 0, sizeof(I))
	when != memset(&I, 0, sizeof(T))

@@
identifier I, fn;
type T =~ "^enum.*";
@@
fn(...){
<+...
- T I;
+ T I = 0;
...+>
}
