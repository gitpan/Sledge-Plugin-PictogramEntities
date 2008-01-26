package Dummy::Pages;
use strict;
use warnings;
use HTTP::MobileAgent;
use Test::More tests => 3;

sub mobile_agent {
    HTTP::MobileAgent->new("KDDI-SA31 UP.Browser/6.2.0.7.3.129 (GUI) MMP/2.0")
}

sub add_filter  {
    my ($self, $code) = @_;
    is $code->('Dummy::Pages', "&#xE63E;&#xE65C;"), q{<img localsrc="44" /><img localsrc="341" />};
}

sub add_trigger {
    my ($class, $point, $code) = @_;
    is $point, 'BEFORE_DISPATCH';
    is(ref($code), 'CODE');
    $code->('Dummy::Pages');
}

use Sledge::Plugin::PictogramEntities;

