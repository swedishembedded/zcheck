// not recommended
static int foo;
// another static
static struct my_instance foo;

int function(int a){
	// inside function
	static int foo;
	static uint32_t foo;
	static float bar = 0;
	static float bar2;
	double bar3;
	static struct foobar foobar;
	static struct foobar *blah;
	for(foo = 0; foo < 10; foo++){
	}
}
