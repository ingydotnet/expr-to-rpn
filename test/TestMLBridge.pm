package TestMLBridge;
use base 'TestML::Bridge';

use ExprToRPN;
use YAML;

sub compile {
  my ($self, $expr) = @_;

  return YAML::Dump(ExprToRPN->compile($expr));
}

1;
