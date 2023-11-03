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
	return -EAGAIN;
}

int ok_return_zero(){
	return 0;
}

// Example 1: Function returning a constant.
int function_returning_constant() {
    // Some logic here...
    return 42;  // Matches the first part of the semantic patch (constant return).
}


// Example 2: Function returning a non-zero constant.
int function_returning_non_zero() {
	if(true){
		return function_returning_constant();
	}
    // Some logic here...
    return -1;  // Matches the first part of the semantic patch (non-zero constant return).
}

// Example 3: Function returning an identifier not matching the pattern.
#define SUCCESS 1
int function_returning_identifier() {
    // Some logic here...
    return SUCCESS;  // Matches the second part of the semantic patch (identifier return).
}

// Example 4: Function returning an identifier with a pattern starting with "-E".
#define ERROR_CODE -100
int function_with_error_code() {
    // Some logic here...
    return ERROR_CODE;  // Does NOT match the second part of the semantic patch due to the "-E" like pattern.
}

// Example 5: Function returning a standard error pattern.
#define EFAIL -2
int function_returning_standard_error() {
    // Some logic here...
    return EFAIL;  // Does NOT match the second part of the semantic patch due to the "-E" like pattern.
}

