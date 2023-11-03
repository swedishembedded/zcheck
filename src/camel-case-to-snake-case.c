static struct {
	int camelCase;
	struct {
		struct {
			struct bar CamelFoobar;
			int fooBar;
		} l2;
		int fooFoo;
	} l1;
	float foo_case;
	struct {
		uint32_t moreCamelCase;
		int moreCamels;
	} data;
	int moreDataInCamel;
} foo;
