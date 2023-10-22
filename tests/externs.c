// invalid
extern int  foo;
// invalid
extern struct my_type bar;
// valid
extern void function(int a);
// not recommended
static int foo;
// ok
static struct my_instance foo;
#ifdef NONEXIST
extern float inside_ifdef;
#endif
