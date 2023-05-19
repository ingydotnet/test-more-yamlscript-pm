use strict; use warnings;
package Test::More::YAMLScript;

our $VERSION = '0.1.0';

use base 'Lingy::Namespace';

no warnings 'redefine';

sub subtest {
    my ($t, $label, $exprs) = @_;
    $t->subtest(
        $label,
        sub { Lingy::Eval::eval($_, $Lingy::Eval::ENV) for @_ },
        @$exprs,
    );
}

1;
