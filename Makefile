define HELP

Try these 'make' targets:

    make test           - Run the tests
    make update         - Regenerate the lib/ExprToRPN/Grammar.pm module

endef
export HELP

test = test

#------------------------------------------------------------------------------
default: help

help:
	@echo "$$HELP"

test: ../testml
	prove -lv $(test)

update: ../pegex
	perl -Ilib -MExprToRPN::Grammar=compile

../pegex:
	make -C ../ pegex

../testml:
	make -C ../testml

.PHONY: test
