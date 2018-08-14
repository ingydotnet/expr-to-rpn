expr-to-rpn
===========

Convert Infix Expressions to RPN

# Synopsis
``` coffee
expr2rpn = require 'expr-to-rpn'
expr = '1 * (2 + 3) / 4'
rpn = expr2rpn.compile expr
console.log rpn     # 123+*4/
```

# Description

This is a library that compiles simple infix mathematical expressions to a
reverse polish notation (RPN) form.

The library is implemented in Perl(5) and JavaScript (CoffeeScript source
code), and is distributed on CPAN (for Perl) and NPM (for JS).

The compiler's grammar is written in Pegex and the libraries make use of the
Pegex runtimes for Perl and JS.

The tests are written in TestML, which also works for both Perl and JS.

The purpose of this project is to show how to make an Acmeist (multi-language)
compiler library and package it for common distribution channels.

More languages may be added over time.

# Project Layout

This project consists of 4 or 5 different independent parts. Instead of putting
each part into its own Git repository, each part is on its own independent
branch in this single repository.

The `git worktree` command makes it easy to have all the branches checked out
at once.  After cloning this repo, run `make work`, and you will see the
following subdirectories (branch worktrees): `perl5`, `coffee`, `pegex`,
`testml`.

To run the test suite for both Perl and JS, just run `make test` from the top
level directory. To run the tests for a specific language only, `cd` to that
language's subdir and run `make test` there.
