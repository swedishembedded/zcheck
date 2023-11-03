static struct {
	int camel_case;
	struct {
		struct {
			struct bar camel_foobar;
			int foo_bar;
		} l2;
		int foo_foo;
	} l1;
	float foo_case;
	struct {
		uint32_t more_camel_case;
		int more_camels;
	} data;
	int more_data_in_camel;
} foo;
