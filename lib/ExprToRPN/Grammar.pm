package ExprToRPN::Grammar;

use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => '../pegex/expr.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.64)
  {
    '+toprule' => 'expression',
    'LPAREN' => {
      '.rgx' => qr/\G\(/
    },
    'RPAREN' => {
      '.rgx' => qr/\G\)/
    },
    '_' => {
      '.rgx' => qr/\G\s*/
    },
    'expression' => {
      '.all' => [
        {
          '.all' => [
            {
              '.ref' => 'operand'
            },
            {
              '+min' => 0,
              '-flat' => 1,
              '.all' => [
                {
                  '.ref' => 'operator'
                },
                {
                  '.ref' => 'operand'
                }
              ]
            },
            {
              '+max' => 1,
              '.ref' => 'operator'
            }
          ]
        },
        {
          '.ref' => '_'
        }
      ]
    },
    'number' => {
      '.rgx' => qr/\G\s*(\-?[0-9]+)/
    },
    'operand' => {
      '.any' => [
        {
          '.ref' => 'number'
        },
        {
          '.all' => [
            {
              '.ref' => '_'
            },
            {
              '.ref' => 'LPAREN'
            },
            {
              '.ref' => 'expression'
            },
            {
              '.ref' => '_'
            },
            {
              '.ref' => 'RPAREN'
            }
          ]
        }
      ]
    },
    'operator' => {
      '.rgx' => qr/\G\s*(\+|\-|\*|\/|\^)/
    }
  }
}

1;
