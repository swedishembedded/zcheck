int ok_function(int a, int b){
	if(a){
		return b;
	} else {
		return -a;
	}
	return -EINVAL;
}

float foo(){
	return 1;
}

int fail_function(int a){
	if(a){
		return -ENOMEM;
	}
	return -1;
}

int ok_return_zero(){
	return 0;
}
