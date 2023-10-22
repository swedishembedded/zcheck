// not recommended
static int foo;
// another static
static struct my_instance foo;

int function(int a){
	// inside function
	static int foo;
}
