int func(int a, int b){
	struct st {
		int a;
	};
	struct st c, d;
	struct st *e, *f;
	memcpy(&a, &b, sizeof(b)); // wrong
	memcpy(e, f, sizeof(*f)); // wrong
	memcpy(&c.a, &c.b, sizeof(c.b)); // wrong
	memcpy(&a, &b, sizeof(&b)); // wrong
	memcpy(&a, &b, sizeof(a)); // right
}
