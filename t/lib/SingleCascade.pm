package SingleCascade;

use Moose;
use MooseX::CascadeClearing;

has master => (
    is => 'rw',
    isa => 'Str',
    clearer => 'clear_master',
    predicate => 'has_master',
    lazy => 1,
    default => 'nuts',

    clear_master => 'foo',
    is_clear_master => 1,
);

my @opts = (
    is => 'ro', isa => 'Str', clear_master => 'master', lazy_build => 1,
);

has sub1 => @opts; 
has sub2 => @opts;
has sub3 => @opts;

has nosub => (is => 'rw', isa => 'Str', lazy_build => 1);

sub _build_sub1 { shift->master . "1" }
sub _build_sub2 { shift->master . "2" }
sub _build_sub3 { shift->master . "3" }

sub _build_nosub { 'lazy!' }

#__PACKAGE__->meta->make_immutable;
1;

