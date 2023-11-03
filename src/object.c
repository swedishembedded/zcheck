int my_object(struct my_object *self){
	// fine
}

int my_object_foo(struct my_object *self, int a){
	// fine
}

int state;

int fun(int a){
	// not good
	state = 1;
}

static int fun_not_changed(int a, int b){
	return 0;
}
