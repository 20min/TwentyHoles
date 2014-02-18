package TwentyHoles::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

TwentyHoles::Controller::Root - Root Controller for TwentyHoles

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 auto
=cut

sub auto :Private {
    my ( $self, $c ) = @_;
    if ( defined $c->req->headers->{'eve-trusted'} ) {
        if ( $c->req->headers->{'eve-trusted'} eq 'No' ) {
    	    $c->res->body('<body onload="CCPEVE.requestTrust(\'' . $c->req->base . '*\');setTimeout(function(){location.reload(true)},500);">');
            $c->detach;
        }
        else {
            $c->model('DB::Character')->seen_character({
                'character_id' => $c->req->headers->{'eve-charid'},
                'character_name' => $c->req->headers->{'eve-charname'},
                'system_name' => $c->req->headers->{'eve-solarsystemname'},
                'ship_name' => $c->req->headers->{'eve-shipname'},
            });
        }
    }
    1;
}

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{'characters'} = $c->model('DB::Character');
    $c->stash->{'systems'} = $c->model('DB::System');
    $c->stash->{'wormholes'} = $c->model('DB::Wormhole');
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Carl Johnstone

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
