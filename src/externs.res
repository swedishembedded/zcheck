// invalid
int  foo;
// invalid
struct my_type bar;
// invalid
void function(int a);
// not recommended
static int foo;
// ok
static struct my_instance foo;
#ifdef NONEXIST
float inside_ifdef;
#endif

void foo() {
	int bar;
}
