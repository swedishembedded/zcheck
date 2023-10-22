int pure_function(int a){
	do_something(a);
}

int ok_global;

int non_pure_function(int a){
	ok_global = a;
}

int non_pure_function2(int *a){
	*a = ok_global;
}
