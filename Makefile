COCCI = $(wildcard src/*.cocci)

.PHONY: check
check:
	@$(foreach cocci, $(COCCI),./test $(cocci) || exit 1;)

