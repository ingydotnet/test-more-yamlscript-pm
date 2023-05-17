use strict; use warnings;
package Test::More::YAMLScript;

our $VERSION = '0.1.0';

use Lingy::Namespace;
use base 'Lingy::Namespace';
use Lingy::Common;
use YAMLScript::RT;

use constant NAME => 'Test.More.YAMLScript';

use Test::Builder();

my $t;
BEGIN {
    $t = Test::Builder->new;
    $t->level(2);
}

sub like_args {
    my ($str, $qr, $label) = @_;
    $qr =~ s{^/?(.*?)/?$}{$1}s;
    $qr = qr/$qr/;
    return ($str, $qr, $label);
}

YAMLScript::RT->rt->rep(q<
    (defmacro todo [label test]
      `(-todo ~label '~test))
    (defmacro skip [label test]
      `(-skip ~label '~test))
    (defmacro subtest [label & tests]
      `(-subtest ~label '~tests))
>);

our %ns = (
    fn('plan'   => 1 => sub { $t->plan(tests => "$_[0]") } ),
    fn('pass'   => 1 => sub { $t->ok(1, @_) } ),
    fn('fail'   => 1 => sub { $t->ok(0, @_) } ),
    fn('note'   => 1 => sub { $t->note(@_) } ),
    fn('diag'   => 1 => sub { $t->diag(@_) } ),
    fn('ok'     => 2 => sub { $t->ok(@_) } ),
    fn('is'     => 3 => sub { $t->is_eq(@_) } ),
    fn('isnt'   => 3 => sub { $t->isnt_eq(@_) } ),
    fn('like'   => 3 => sub { $t->like(like_args(@_)) } ),
    fn('unlike' => 3 => sub { $t->unlike(like_args(@_)) } ),
    fn('-todo'  => 2 => sub { $t->todo_skip($_[0]) } ),
    fn('-skip'  => 2 => sub { $t->skip($_[0]) } ),
    fn('skip-all' => 1 => sub { $t->skip_all($_[0]) } ),
    fn('done-testing' =>
        0 => sub { $t->done_testing() },
        1 => sub { $t->done_testing("$_[0]") } ),
    fn('-subtest' =>
        2 => sub {
            my ($label, $exprs) = @_;
            $t->subtest(
                $label,
                sub {
                    for my $expr (@_) {
                        Lingy::Eval::eval($expr, $Lingy::Eval::ENV);
                    }
                },
                @$exprs,
            );
        },
    ),

    # TODO
    # [ is_deeply => ...
);

1;
