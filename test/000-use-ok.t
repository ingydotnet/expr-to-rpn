use Test::More;

my @modules = qw(
  ExprToRPN
  ExprToRPN::Grammar
  ExprToRPN::Receiver
);

for my $module (@modules) {
  use_ok $module;
}

done_testing;
