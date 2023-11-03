int func(int a, char b){
	int local_a = 0;
	uint32_t local_b = 0;
	struct bar valid, valid2;
	struct foo local_c = {
		0
	};
	float var_d = 0.0;
	enum some_type en_e = 0;
	memset(&valid, 0, sizeof(valid));
	memset(&valid2, 0, sizeof(struct bar));
	if(something){
		int nested_a = 0;
		for(int c = 0; c < 10; c++){
			struct some_local loc = {
				0
			};
			do_something(&loc);
			if(something){
				int nested_b = 0;
			}
		}
	}
}

static void foo(int a, int b);

void another(){
	struct {
		/* Comment */
		int a;
	} foo = {
		0
	};
}
