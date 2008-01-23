package Sledge::Plugin::PictogramEntities;
use strict;
use warnings;
our $VERSION = '0.01';
use HTML::Entities::ConvertPictogramMobileJp;

sub import {
    my $pkg = caller(0);

    $pkg->add_trigger(
        BEFORE_DISPATCH => sub {
            my $self = shift;

            unless ( $self->mobile_agent->is_non_mobile ) {
                $self->add_filter(
                    sub {
                        my ( $self, $content ) = @_;

                        convert_pictogram_entities(
                            mobile_agent => $self->mobile_agent,
                            html         => $content,
                        );
                    }
                );
            }
        },
    );
}

1;
__END__

=encoding utf8

=for stopwords Pictogram

=head1 NAME

Sledge::Plugin::PictogramEntities - Pictogram entities filter

=head1 SYNOPSIS

    package Your::Pages;
    use Sledge::Plugin::PictogramEntities;
    use HTTP::MobileAgent;
    sub mobile_agent { HTTP::MobileAgent->new } # if does not exists.

    # in your template
    &#xE74D;bread.

    # if user's browser is ezweb phone, then convert to
    &#xEC83;bread.

=head1 DESCRIPTION

Sledge::Plugin::PictogramEntities is Pictogram entities converter for Japanese mobile phones.

If you want to know more details, please see L<HTML::Entities::ConvertPictogramMobileJp>.
This module is thin wrapper for that module.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom@gmail.comE<gt>

=head1 SEE ALSO

L<HTML::Entities::ConvertPictogramMobileJp>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
