int func(int a, char b){
	int local_a;
	uint32_t local_b;
	struct bar valid, valid2;
	struct foo local_c;
	float var_d;
	enum some_type en_e;
	memset(&valid, 0, sizeof(valid));
	memset(&valid2, 0, sizeof(struct bar));
	if(something){
		int nested_a;
		for(int c = 0; c < 10; c++){
			struct some_local loc;
			do_something(&loc);
			if(something){
				int nested_b;
			}
		}
	}
}

static void foo(int a, int b);

void another(){
	struct {
		/* Comment */
		int a;
	} foo;
}
