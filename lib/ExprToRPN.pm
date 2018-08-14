package ExprToRPN;
use base 'Pegex::Base';

use Pegex::Parser;
use ExprToRPN::Grammar;
use ExprToRPN::Receiver;

sub compile {
  my ($self, $expr) = @_;

  my $parser = Pegex::Parser->new(
    grammar => ExprToRPN::Grammar->new,
    receiver => ExprToRPN::Receiver->new,
  );

  $parser->parse($expr);
}

1;
