int ok_non_static_global;
static int ok_static_global;
enum global_enum {
	GLOBAL_CONSTANT,
	GLOBAL_CONSTANT2,
	GLOBAL_CONSTANT3,
};

void func(int a){
	static struct foo fail_static_local;
	int fail_local_variable;
}

static int ok_second_static_global;

int func(int a, int b, int *c){
	static int fail_second_static_local;
	*c = ok_second_static_global;
	a = 123;
	b = GLOBAL_CONSTANT;
	int ret;
	fail_second_static_local = ok_second_static_global;
	ok_non_static_global = 2;
	ok_static_global = 1;
	return -ret;
}
