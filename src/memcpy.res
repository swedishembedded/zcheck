int func(int a, int b){
	struct st {
		int a;
	};
	struct st c, d;
	struct st *e, *f;
	memcpy(&a, &b, sizeof(a)); // wrong
	memcpy(e, f, sizeof(*e)); // wrong
	memcpy(&c.a, &c.b, sizeof(c.a)); // wrong
	memcpy(&a, &b, sizeof(a)); // wrong
	memcpy(&a, &b, sizeof(a)); // right
}
