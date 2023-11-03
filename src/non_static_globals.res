static int bad_global;
static struct foo another_bad_global;
static int good_foo; // already static so no change here

void foo(){
	int variable; // should not be changed
}
