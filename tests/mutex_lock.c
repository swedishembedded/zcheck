struct k_mutex lock;

int function(){
	int r = k_mutex_lock(&lock, K_FOREVER);
	if(r){
		return -ETIMEDOUT; // valid to not unlock here
	}
	r = produce_something();
	if(r){
		k_mutex_unlock(&lock);
		return -EIO;
	}
	if(r){
		do_something();
		// no return so we should not match this
	}
	k_mutex_unlock(l);
	r = produce_something();
	if(r){
		return -EINVAL; // this is valid
	}
	k_mutex_lock(l);
	r = produce_something();
	if(r){
		return -EINVAL; // here an unlock is missing
	}
	k_mutex_unlock(&lock);
	return 0;
}
