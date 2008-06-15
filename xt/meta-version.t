use strict;
use warnings;
use YAML;
use UNIVERSAL::require;
use Test::More;

my $meta = YAML::LoadFile('META.yml');
my $requires = $meta->{requires};

plan tests => 1*scalar(keys %$requires);

while (my ($module, $version) = each %$requires) {
    $module->require or die $@;
    no strict 'refs';
    my $installed = ${"$module\::VERSION"};
    is $installed, $version, "$module: $installed == $version";
}

