enum foo_enum func(int c){
	enum foo_enum var;
	if(c){
		var = CONSTANT;
		return var;
	}
	return var;
}
