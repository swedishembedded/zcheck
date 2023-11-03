struct k_mutex lock;
struct k_mutex l;

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
		k_mutex_unlock(&lock);
		return 0;
	}
	k_mutex_unlock(&lock);
	r = produce_something();
	if(r){
		return -EINVAL; // this is valid
	}
	k_mutex_lock(&l, K_FOREVER);
	r = produce_something();
	if(r){
		k_mutex_unlock(&l);
		return -EINVAL; // here an unlock is missing
	}
	k_mutex_unlock(&l);
	return 0;
}
