void func(){
	struct k_mutex m;
	k_mutex_lock(&m, K_NO_WAIT);
	if(something){
		k_mutex_lock(&m, K_NO_WAIT);
	}
}
