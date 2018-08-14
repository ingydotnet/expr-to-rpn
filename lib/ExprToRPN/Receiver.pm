package ExprToRPN::Receiver;
use base 'Pegex::Tree';

use XXX;

sub final {
  my ($self, $got) = @_;
  XXX $got;
}

sub got_expression {
  my ($self, $got) = @_;
  my ($lhs, $oper, $rhs) = @{$got->[0]};
  YYY $got;
  return [$self->flat($lhs), $self->flat($rhs), $oper];
}

sub flat {
  my ($self, $item) = @_;

  return ref($item)
    ? @{$self->flatten($item)}
    : $item;
}

1;
