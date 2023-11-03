int func(enum foo_enum *_rename_me, int c){
	enum foo_enum var;
	if(c){
		var = CONSTANT;
		*_rename_me = var;
		return 0;
	}
	*_rename_me = var;
	return 0;
}
