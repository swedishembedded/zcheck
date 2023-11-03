void func(){
	struct k_mutex m;
	k_mutex_lock(&m, K_MSEC(USE_KCONFIG_VARIABLE_HERE));
	if(something){
		k_mutex_lock(&m, K_MSEC(USE_KCONFIG_VARIABLE_HERE));
	}
}
