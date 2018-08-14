define HELP

Try these 'make' targets:

    make test           - Run all tests
    make test-perl5     - Run Perl 5 tests
    make test-coffee    - Run CoffeeScript (JS) tests
    make work           - Set up all the worktree subdirs
    make clean          - Remove generated files
    make realclean      - Also remove the worktree subdirs

endef
export HELP

LANGS := perl5 coffee
TESTS := $(LANGS:%=test-%)
WORK := $(LANGS) pegex testml

#------------------------------------------------------------------------------
default: help

help:
	@echo "$$HELP"

test: $(TESTS)

$(TESTS):
	make -C $(@:test-%=%) test

work: $(WORK)

$(WORK):
	@git branch --track $@ origin/$@ 2>/dev/null || true
	git worktree add -f $@ $@

status:
	@for d in $(WORK); do \
	    [ -d $$d ]] || continue; \
	    ( \
		cd $$d; \
		git status -sb; \
	    ) \
	done
	@git status -sb

clean:

realclean: clean
	rm -fr $(WORK)
